view: wallet_screening_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.wallet_screening_temp`
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

  measure: wallets_screened {
    type: sum
    sql: ${TABLE}.wallets_screened ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
