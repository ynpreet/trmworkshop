view: efficiency_metrics_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.efficiency_metrics_temp`
    ;;

  dimension: arr {
    type: number
    sql: ${TABLE}.ARR ;;
  }

  measure: cac_payback {
    type: number
    sql: ${TABLE}.CAC_Payback ;;
    value_format: "$#,##0.00"
  }

  measure: current_assets {
    type: sum
    sql: ${TABLE}.Current_Assets ;;
    value_format: "$#,##0.00"
  }

  measure: current_liabilities {
    type: sum
    sql: ${TABLE}.Current_Liabilities ;;
    value_format: "$#,##0.00"
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  measure: gross_margin {
    type: sum
    sql: ${TABLE}.Gross_Margin ;;
    value_format: "0.00%"
  }

  measure: mrr {
    type: sum
    sql: ${TABLE}.MRR ;;
    value_format: "$#,##0.00"
  }

  measure: new_customers_acquired {
    type: sum
    sql: ${TABLE}.New_Customers_Acquired ;;
  }

  measure: quick_ratio {
    type: sum
    sql: ${TABLE}.Quick_Ratio ;;
    value_format: "$#,##0.00"
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.Revenue ;;
    value_format: "$#,##0.00"
  }

  measure: sales___marketing {
    type: sum
    sql: ${TABLE}.Sales___Marketing ;;
    value_format: "$#,##0.00"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
