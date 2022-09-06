view: sql_derived_table {
  derived_table: {
    sql:
      SELECT
          order_items.order_item_id  AS order_item_id,
          order_items.price  AS price,
          order_items.freight_value  AS freight_value,
          customers.customer_id  AS customer_id,
          customers.customer_city  AS customer_city,
          customers.customer_state  AS customer_state
      FROM `ecommerce_dataset.order_items`
           AS order_items
      LEFT JOIN `ecommerce_dataset.orders`
           AS orders ON order_items.order_id = orders.order_id
      LEFT JOIN `ecommerce_dataset.customers`
           AS customers ON orders.customer_id = customers.customer_id;;
  }

  dimension: order_item_id {
    description: ""
    type: number
  }
  dimension: price {
    description: ""
    type: number
  }
  dimension: freight_value {
    description: ""
    type: number
  }
  dimension: customer_id {
    description: ""
  }
  dimension: customer_city {
    description: ""
  }
  dimension: customer_state {
    description: ""
  }





  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: sql_derived_table {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
