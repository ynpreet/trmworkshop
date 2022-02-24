view: arr_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.arr_temp`
    ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  measure: arr {
    type: sum
    sql: ${TABLE}.ARR ;;
  }

  dimension_group: bo_m {
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
    sql: ${TABLE}.BoM_Date ;;
  }

  dimension_group: churn {
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
    sql: ${TABLE}.Churn_Date ;;
  }

  dimension_group: customer {
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
    sql: ${TABLE}.Customer_Date ;;
  }

  dimension_group: eo_m {
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
    sql: ${TABLE}.EoM_Date ;;
  }

  measure: total_arr {
    type: sum
    sql: ${TABLE}.Total_ARR ;;
  }
  measure: average_arr {
    type: average
    sql: ${TABLE}.Total_ARR ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
