view: transaction_screened_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.transaction_screened_temp`
    ;;

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
    sql: ${TABLE}.date ;;
  }

  dimension: transactions_screened {
    type: number
    sql: ${TABLE}.transactions_screened ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
