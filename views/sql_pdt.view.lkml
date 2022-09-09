view: sql_pdt {
  derived_table: {
    datagroup_trigger: ecommerce_pdt_default_datagroup
    sql:
      SELECT
        orders.order_id  AS id_compra,
        order_items.order_item_id  AS id_item_da_compra,
        (orders.order_purchase_timestamp ) AS horario_de_compra_do_pedido
      FROM
        `ecommerce_dataset.order_items` AS order_items LEFT JOIN
        `ecommerce_dataset.orders` AS orders ON order_items.order_id = orders.order_id  ;;
  }

  dimension: id_compra {
    type: number
    sql: ${TABLE}.id_compra ;;
  }

  dimension: id_item_da_compra {
    type: number
    sql: ${TABLE}.id_item_da_compra ;;
    primary_key: yes
  }

  dimension_group: horario_de_compra_do_pedido {
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
  }
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
