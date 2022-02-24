view: gross_dollar_retention {
  derived_table: {
    sql: WITH all_months AS (
        SELECT *
        FROM UNNEST(GENERATE_DATE_ARRAY(DATE '2020-01-01', CURRENT_DATE(), INTERVAL 1 MONTH)) AS month
      ),

      monthly_incremental_arr AS (
        SELECT
          month
          , SUM(COALESCE(arr, 0)) AS arr
        FROM all_months
        LEFT JOIN `trm-business-operations.trm_sales_salesforce.arr_temp`
          ON month = BoM_Date
          AND Type IN ('New Business', 'Expansion')
        GROUP BY 1
      ),

      monthly_churn AS (
        SELECT
          month
          , SUM(COALESCE(arr, 0)) AS churn
        FROM all_months
        LEFT JOIN `trm-business-operations.trm_sales_salesforce.arr_temp`
          ON month = DATE_ADD(EoM_Date, INTERVAL 1 DAY)
          AND Type IN ('Churn', 'Contraction')
        GROUP BY 1
      ),

      expansion_arr AS (
        SELECT
          month
          , SUM(COALESCE(arr, 0)) AS arr
        FROM all_months
        LEFT JOIN `trm-business-operations.trm_sales_salesforce.arr_temp`
          ON month = BoM_Date
          AND Type = 'Expansion'
        GROUP BY 1
      ),

      total_arr AS (
        SELECT
          a.month
          , SUM(COALESCE(Total_ARR, 0)) AS arr
        FROM all_months AS a
        LEFT JOIN `trm-business-operations.trm_sales_salesforce.arr_temp` AS t
          ON a.month = t.BoM_Date
        GROUP BY 1
      ),

      ttm_expansion AS (
        SELECT
          month
          , SUM(COALESCE(e.arr, 0)) OVER (ORDER BY month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS ttm_expansion
          , SUM(COALESCE(m.churn, 0)) OVER (ORDER BY month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS ttm_churn
        FROM expansion_arr AS e
        LEFT JOIN monthly_churn AS m USING (month)
      ),


      monthly_avg_annualized_dollar_gross_retention AS (
        SELECT
          m.month
          , (t.arr + m.churn) / t.arr AS gross_dollar_retention
        FROM total_arr AS t
        LEFT JOIN monthly_churn AS m
          ON m.month = DATE_ADD(t.month, INTERVAL 1 MONTH)
      ),

      monthly_avg_gross_annualized_over_time AS (
        SELECT
          *
          , POW(AVG(gross_dollar_retention) OVER (ORDER BY month), 12) AS avg_annualized_gross_dollar_retention
        FROM monthly_avg_annualized_dollar_gross_retention
        WHERE month >= '2021-01-01'
        ORDER BY month
      )

      SELECT * FROM monthly_avg_gross_annualized_over_time
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: date
    datatype: date
    sql: ${TABLE}.month ;;
  }

  measure: gross_dollar_retention {
    type: sum
    sql: ${TABLE}.gross_dollar_retention ;;
    value_format: "0.00%"
  }

  measure: avg_annualized_gross_dollar_retention {
    type: sum
    sql: ${TABLE}.avg_annualized_gross_dollar_retention ;;
    value_format: "0.00%"
  }

  set: detail {
    fields: [month, gross_dollar_retention, avg_annualized_gross_dollar_retention]
  }
}
