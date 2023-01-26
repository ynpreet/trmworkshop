connection: "trm-business-operations"

# include all the views
include: "/views/**/*.view"

datagroup: trmlabs_workshop_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trmlabs_workshop_default_datagroup

explore: account_test {hidden: yes}


#explore: opportunity_test {}

#explore: arr_temp {}

explore: arr_temp {
  hidden: yes
  join: account_test {
    type:  inner
    sql_on: ${arr_temp.account_name}=${account_test.account_name} ;;
    relationship: one_to_one
  }
}

explore: opportunity_test {
  hidden: yes
  join: account_test {
    relationship: many_to_one
    sql_on: ${opportunity_test.account_id}=${account_test.account_id} ;;
    type: inner
  }

}

explore: wacv {hidden: yes}
# branch 'master' of git@github.com:ynpreet/trmworkshop.git

explore: people_data_temp {hidden: yes}

explore: net_arr_retention_12_m {hidden: yes}

explore: net_dollar_retention {hidden: yes}

explore: gross_dollar_retention {hidden: yes}

explore: logo_retention_ttm {hidden: yes}

explore: gross_retention_ttm {hidden: yes}

explore: efficiency_metrics_temp {hidden: yes}

explore: sessions_all_csutomers_monthly {hidden: yes}

explore : monthly_active_users_all_temp {hidden: yes}

explore: wau_mau_all_temp {hidden: yes}

explore: transaction_screened_temp {hidden: yes}

explore: wallet_screening_temp {hidden: yes}

explore: graphs_created_temp {hidden: yes}

explore: trm_users_temp {hidden: yes}
