view: wacv {
  derived_table: {
    sql: -- SELECT * FROM `trm-business-operations.trm_sales_salesforce.account_test` LIMIT 10


      -- select Verticals, Account_Name, sum(ARR/sum(ARR)) as perentage from (
      -- select Verticals, Account_Name, sum(Total_ARR) AS ARR FROM `trm-business-operations.trm_sales_salesforce.account_test` group by Account_Name, Verticals order by ARR DESC) AY group by Verticals, Account_Name
      -- ARR / sum(ARR) over(partition by Account_Name)

      select Verticals,SUM(Total_ARR) AS Total_ARR, ROUND(sum(Weighted_Revenue),0) AS WACV from (
      select Verticals, Account_Name,
      sum(ARR) AS Total_ARR,  ROUND((sum(ARR)/(select sum(Total_ARR) from `trm-business-operations.trm_sales_salesforce.account_test`))*100,1) AS Percentage,
      sum(ARR)*ROUND((sum(ARR)/(select sum(Total_ARR) from `trm-business-operations.trm_sales_salesforce.account_test`))*100,1) AS Weighted_Revenue
      from  (
      select Verticals, Account_Name,sum(Total_ARR) AS ARR   FROM `trm-business-operations.trm_sales_salesforce.account_test` group by Account_Name, Verticals order by ARR DESC) group by Verticals, Account_Name order by Percentage DESC) AP group by Verticals order by WACV DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: verticals {
    type: string
    sql: ${TABLE}.Verticals ;;
  }

  dimension: total_arr {
    type: number
    sql: ${TABLE}.Total_ARR ;;
  }

  dimension: wacv {
    type: number
    sql: ${TABLE}.WACV ;;
  }

  set: detail {
    fields: [verticals, total_arr, wacv]
  }
}
