view: wau_mau_all_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.wau_mau_all_temp`
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
    sql: ${TABLE}.Date ;;
  }

  dimension: formula {
    type: string
    sql: ${TABLE}.Formula ;;
  }

  measure: mar_1_2021__12_00_am___feb_24_2022__11_06_am {
    type: sum
    sql: ${TABLE}.Mar_1_2021__12_00AM___Feb_24_2022__11_06AM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
