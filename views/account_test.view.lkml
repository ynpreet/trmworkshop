view: account_test {
  sql_table_name: `trm_sales_salesforce.account_test`
    ;;

  dimension: __of_licenses {
    type: number
    sql: ${TABLE}.__of_Licenses ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.Account_ID ;;
    primary_key: yes
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.Account_Owner ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.Billing_City ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.Billing_Country ;;
  }

  dimension: billing_geo {
    type: string
    sql: ${TABLE}.Billing_Geo ;;
  }

  dimension: billing_state_province {
    type: string
    sql: ${TABLE}.Billing_State_Province ;;
  }

  dimension: billing_zip_postal_code {
    type: string
    sql: ${TABLE}.Billing_Zip_Postal_Code ;;
  }

  dimension: churn_date {
    type: number
    sql: ${TABLE}.Churn_Date ;;
  }

  dimension: customer_date {
    type: number
    sql: ${TABLE}.Customer_Date ;;
  }

  dimension: products {
    type: string
    sql: ${TABLE}.Products ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }

  dimension: total_arr {
    type: number
    sql: ${TABLE}.Total_ARR ;;
  }

  measure: sum_arr{
    type: sum
    sql: ${total_arr} ;;

  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension: verticals {
    type: string
    sql: ${TABLE}.Verticals ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
