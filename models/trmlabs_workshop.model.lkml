connection: "trm-business-operations"

# include all the views
include: "/views/**/*.view"

datagroup: trmlabs_workshop_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trmlabs_workshop_default_datagroup

explore: account_test {}

explore: opportunity_test {}

explore: arr_temp {}
