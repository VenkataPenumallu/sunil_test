view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Test of link"
      url: "https://gcps2220.cloud.looker.com/explore/sunil_test/order_items?qid=IulDT1efiDlXrwdWfvVRfa"
    }
  }

  dimension: inventory_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    view_label: "aaaaaaaa"
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: testing {
    case: {
      when: {
        sql: ${TABLE} = pending ;;
        label: "pending"
      }
      when: {
        sql: ${TABLE}.order_id = 4 ;;
        label: "apple"
      }
      else: "unknown"
    }
    alpha_sort: yes
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  filter: year_filter {
    type: date
    sql: ${returned_year} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }


  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }
}
