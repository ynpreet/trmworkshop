view: trm_users_temp {
  sql_table_name: `trm-business-operations.trm_sales_salesforce.trm_users_temp`
    ;;

  dimension: deleted_user {
    type: string
    sql: ${TABLE}.deleted_user ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: isverified {
    type: yesno
    sql: ${TABLE}.isverified ;;
  }

  dimension: max_user_org_id {
    type: number
    sql: ${TABLE}.max_user_org_id ;;
  }

  dimension: org_id {
    type: number
    sql: ${TABLE}.org_id ;;
  }

  dimension: org_name {
    type: string
    sql: ${TABLE}.org_name ;;
  }

  dimension: removed_user {
    type: yesno
    sql: ${TABLE}.removed_user ;;
  }

  dimension_group: user_createdat {
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
    sql: ${TABLE}.user_createdat ;;
  }

  dimension_group: user_org_createdat {
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
    sql: ${TABLE}.user_org_createdat ;;
  }

  dimension_group: user_org_updatedat {
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
    sql: ${TABLE}.user_org_updatedat ;;
  }

  dimension_group: user_updatedat {
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
    sql: ${TABLE}.user_updatedat ;;
  }

  measure: count {
    type: count
    drill_fields: [org_name]
  }
}
