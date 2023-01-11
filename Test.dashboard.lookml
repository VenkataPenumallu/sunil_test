- dashboard: Test
  title: Test
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: vYUoEjX3srTPduzn0jSONZ
  elements:
  - title: example
    name: example
    model: sunil_test
    explore: order_items
    type: table
    fields: [orders.created_date, orders.status, orders.count, products.brand, products.category,
      products.department, products.count, users.age, users.city, users.country, users.email,
      users.first_name]
    filters: {}
    sorts: [users.city desc]
    limit: 500
    listen:
      Created Date: orders.created_date
      Brand: products.brand
      Gender: users.gender
      Category: products.category
    row:
    col:
    width:
    height:
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: '2017'
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: sunil_test
    explore: order_items
    listens_to_filters: []
    field: orders.created_date
  - name: Brand
    title: Brand
    type: field_filter
    default_value: 106Shades,1veMoon
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: sunil_test
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Category
    title: Category
    type: field_filter
    default_value: Active,Blazers & Jackets,Clothing Sets,Dresses,Fashion Hoodies
      & Sweatshirts,Jeans,Jumpsuits & Rompers,Leggings
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: sunil_test
    explore: order_items
    listens_to_filters: []
    field: products.category
  - name: Gender
    title: Gender
    type: field_filter
    default_value: f
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: sunil_test
    explore: order_items
    listens_to_filters: []
    field: users.gender
