view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    link: {
      label: "Column Chart" #or your label of choice
       url:"
      {% assign vis_config = '{\"show_view_names\":false,\"show_row_numbers\":true,\"transpose\":false,\"truncate_text\":true,\"hide_totals\":false,\"hide_row_totals\":false,\"size_to_fit\":true,\"table_theme\":\"white\",\"limit_displayed_rows\":false,\"enable_conditional_formatting\":false,\"header_text_alignment\":\"left\",\"header_font_size\":12,\"rows_font_size\":12,\"conditional_formatting_include_totals\":false,\"conditional_formatting_include_nulls\":false,\"type\":\"looker_grid\",\"defaults_version\":1
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }

  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: total_usd {
    label: "Total USD"
    type: sum
    value_format: "$0.00"
    sql: ${retail_price} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
