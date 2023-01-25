view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: id2 {
    type: number
    value_format: "0.00"
    sql: ${age}*${id} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  parameter: home {
    type: string
    allowed_value: {
      label: "Decimal_0"
      value: "decimal_0"
    }
    allowed_value: {
      label: "Decimal_2"
      value: "decimal_2"
    }
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: testing {
    label: "first attempt"
    group_label: "Time"
    type: sum
   description: "testing the functionality"
   sql:{% if home._parameter_value == 'decimal_2' %}
      ${age}
     {% elsif home._parameter_value == 'decimal_0' %}
      ${id2}
     {% else %}
      ${city}
     {% endif %};;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
