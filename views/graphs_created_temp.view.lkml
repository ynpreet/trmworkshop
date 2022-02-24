view: graphs_created_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.graphs_created_temp`
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

  measure: graphs_created {
    type: sum
    sql: ${TABLE}.graphs_created ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
