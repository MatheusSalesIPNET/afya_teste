view: sql_runner_derived_table {
  derived_table: {
    sql: SELECT
        orders.order_id  AS id_compra,
        order_items.order_item_id  AS id_item_da_compra,
        (orders.order_purchase_timestamp ) AS horario_de_compra_do_pedido
      FROM
        `ecommerce_dataset.order_items` AS order_items LEFT JOIN
        `ecommerce_dataset.orders` AS orders ON order_items.order_id = orders.order_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_compra {
    type: string
    sql: ${TABLE}.id_compra ;;
  }

  dimension: id_item_da_compra {
    type: number
    sql: ${TABLE}.id_item_da_compra ;;
  }

  dimension_group: horario_de_compra_do_pedido {
    type: time
    sql: ${TABLE}.horario_de_compra_do_pedido ;;
  }

  set: detail {
    fields: [id_compra, id_item_da_compra, horario_de_compra_do_pedido_time]
  }
}
