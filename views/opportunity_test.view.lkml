view: opportunity_test {
  sql_table_name: `trm_sales_salesforce.opportunity_test`
    ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.Account_ID ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension_group: close {
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
    sql: ${TABLE}.Close_Date ;;
  }

  dimension: closed {
    type: yesno
    sql: ${TABLE}.Closed ;;
  }

  dimension_group: contract_end {
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
    sql: ${TABLE}.Contract_End_Date ;;
  }

  dimension_group: contract_start {
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
    sql: ${TABLE}.Contract_Start_Date ;;
  }

  dimension: contract_term__months_ {
    type: number
    sql: ${TABLE}.Contract_Term__Months_ ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.Created_Date ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.Fiscal_Period ;;
  }

  dimension: historical_opportunity {
    type: yesno
    sql: ${TABLE}.Historical_Opportunity ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.Opportunity_Name ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}.Opportunity_Owner ;;
  }

  dimension: recurring_revenue_ {
    type: yesno
    sql: ${TABLE}.Recurring_Revenue_ ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension: won {
    type: yesno
    sql: ${TABLE}.Won ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, account_name]
  }
}
