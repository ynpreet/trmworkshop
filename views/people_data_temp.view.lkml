view: people_data_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.people_data_temp`
    ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Start_Date ;;
  }

  dimension: state_of_residence {
    type: string
    sql: ${TABLE}.State_of_Residence ;;
  }

  dimension: sub_team {
    type: string
    sql: ${TABLE}.Sub_Team ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
