view: net_arr_retention_12_m {
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

      -- Jan 2022 == ([Jan 2021 ARR] + [Feb 2021 - Jan 2022 expansion] - [Feb 2021 - Jan 2022 churn]) / [Jan 2021 ARR]
      ttm_dollar_net_retention AS (
        SELECT
          e.month
          , (t.arr + e.ttm_expansion + e.ttm_churn) / t.arr AS net_dollar_retention
        FROM total_arr AS t
        LEFT JOIN ttm_expansion AS e
          ON e.month = DATE_ADD(t.month, INTERVAL 1 YEAR)
      )

      -- SELECT * FROM ttm_expansion
      -- WHERE month IS NOT NULL
      -- ORDER BY month

      SELECT * FROM ttm_dollar_net_retention
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

  measure: net_dollar_retention {
    type: sum
    sql: ${TABLE}.net_dollar_retention ;;
  }

  set: detail {
    fields: [month, net_dollar_retention]
  }
}
