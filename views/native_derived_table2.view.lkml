# If necessary, uncomment the line below to include explore_source.

# include: "ecommerce_pdt.model.lkml"

view: native_derived_table2 {
  derived_table: {
    explore_source: order_items {
      column: order_item_id {}
      column: price {}
      column: freight_value {}
      column: customer_id { field: customers.customer_id }
      column: customer_city { field: customers.customer_city }
      column: customer_state { field: customers.customer_state }
    }
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
}
