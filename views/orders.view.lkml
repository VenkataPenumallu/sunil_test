view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: testing {
    type: string
    case: {
      when: {
        sql: ${status} = "pending" then ${count} ;;
        label: "pending"
      }
      when: {
        sql: ${users.city} = "Adel" then ${user_id} ;;
      }
      else: "unknown"
    }
  }


  dimension: product_description {
    type: string
    sql:

      CASE
      WHEN ${status} = "pending" THEN "ABC"


      WHEN ${users.city} = "Adel" THEN "xyz"


      ELSE "other"


      END ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  measure: mes1 {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: mes2{
    type: count_distinct
    sql: ${id} ;;
  }

  measure: testing2 {
    type: number
    sql: 100*(${mes1}/nullif(${mes2}, 0)) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      order_items_vijaya.count,
      ten_million_orders.count
    ]
  }
}
