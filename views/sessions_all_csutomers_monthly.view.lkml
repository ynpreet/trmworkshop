view: sessions_all_csutomers_monthly {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.sessions_all_csutomers_monthly`
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

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }

  measure: mar_1_2021__12_00_am___feb_24_2022__11_00_am {
    type: sum
    sql: ${TABLE}.Mar_1_2021__12_00AM___Feb_24_2022__11_00AM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
