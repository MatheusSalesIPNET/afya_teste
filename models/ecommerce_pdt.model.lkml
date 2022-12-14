connection: "ecommerce_with_pdt"


# Comentário para gerar novo commit



# include all the views
include: "/views/**/*.view"

datagroup: ecommerce_pdt_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
  interval_trigger: "24 hour"
}

persist_with: ecommerce_pdt_default_datagroup


explore: native_derived_table {}

explore: sql_derived_table {}

explore: sql_runner_derived_table {}

explore: sql_pdt {}






explore: order_items {
  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: sellers {
    type: left_outer
    sql_on: ${order_items.seller_id} = ${sellers.seller_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}



explore: sellers {}

explore: geolocation {}

explore: products {}

explore: orders {
  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: order_payment {
  join: orders {
    type: left_outer
    sql_on: ${order_payment.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: customers {}

explore: order_reviews {
  join: orders {
    type: left_outer
    sql_on: ${order_reviews.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: vehicles {}
