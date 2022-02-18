connection: "trm-business-operations"

# include all the views
include: "/views/**/*.view"

datagroup: trmlabs_workshop_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trmlabs_workshop_default_datagroup

# explore: account_test {}

explore: opportunity_test {
  join: account_test {
    relationship: many_to_one
    sql_on: ${opportunity_test.account_id}=${account_test.account_id} ;;
    type: inner
  }


}
