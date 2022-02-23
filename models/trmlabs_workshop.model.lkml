connection: "trm-business-operations"

# include all the views
include: "/views/**/*.view"

datagroup: trmlabs_workshop_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trmlabs_workshop_default_datagroup

explore: account_test {}


#explore: opportunity_test {}

#explore: arr_temp {}

explore: arr_temp {
  join: account_test {
    type:  inner
    sql_on: ${arr_temp.account_name}=${account_test.account_name} ;;
    relationship: one_to_one
  }
}

explore: opportunity_test {
  join: account_test {
    relationship: many_to_one
    sql_on: ${opportunity_test.account_id}=${account_test.account_id} ;;
    type: inner
  }

}

explore: wacv {}
# branch 'master' of git@github.com:ynpreet/trmworkshop.git

explore: people_data_temp {}
