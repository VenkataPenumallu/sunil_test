view: orders {
  sql_table_name: demo_db.orders ;;
  filter: year {
    type: date
    sql: ${created_year} ;;
  }
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

  dimension: testing {
    group_label: "sample"
    type: string
    case: {
      when: {
        sql: ${status} = "pending" ;;
        label: "pending"
      }
      when: {
        sql: ${status}=  "complete";;
        label: "apple"
      }
      else: "unknown"
    }
    alpha_sort: yes
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: likitha {
    label: "{{_filters['year']}}"
    type: sum
    sql: ${id} ;;
    value_format: "$#,##0"
    filters: [status: "pending"]
  }


  measure: mes1 {
    type: count_distinct
    filters: [status: "pending"]
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

  measure: liquid_if {
    type: count_distinct
    sql: {% if users.city._in_query %}
         {orders.status}
         {% else %}
         ${created_time}
         {% endif %} ;;
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
