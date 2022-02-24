view: monthly_active_users_all_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.monthly_active_users_all_temp`
    ;;

  dimension: date {
    type: string
    sql: ${TABLE}.Date ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }

  measure: feb_1_2021__12_00_am___feb_24_2022__11_05_am {
    type: sum
    sql: ${TABLE}.Feb_1_2021__12_00AM___Feb_24_2022__11_05AM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
