- dashboard: lookml_dashboard_pdf_rendering_testing
  title: Lookml_Dashboard_PDF_rendering_testing
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LtNe4XCtjxO9HHUQ3bwVT8
  elements:
  - title: Lookml_Dashboard_PDF_rendering_testing
    name: Lookml_Dashboard_PDF_rendering_testing
    model: sunil_test
    explore: order_items_vijaya
    type: looker_grid
    fields: [order_items_vijaya.order_id, order_items_vijaya.returned_date, order_items_vijaya.sale_price,
      order_items_vijaya.count, orders.status, products.brand]
    pivots: [order_items_vijaya.returned_date]
    fill_fields: [order_items_vijaya.returned_date]
    sorts: [order_items_vijaya.count desc 0, order_items_vijaya.returned_date]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    series_types: {}
    defaults_version: 1
    listen:
      Created Year: inventory_items.created_year
      Created Quarter: inventory_items.created_quarter
    row: 0
    col: 0
    width: 24
    height: 12
  - title: New Tile
    name: New Tile
    model: sunil_test
    explore: order_items_vijaya
    type: looker_grid
    fields: [order_items_vijaya.order_id, order_items_vijaya.returned_date, order_items_vijaya.sale_price,
      order_items_vijaya.count, orders.status, products.brand, order_items_vijaya.returned_quarter]
    pivots: [order_items_vijaya.returned_quarter]
    fill_fields: [order_items_vijaya.returned_quarter]
    sorts: [order_items_vijaya.count desc 0, order_items_vijaya.returned_date, order_items_vijaya.returned_quarter]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    series_types: {}
    defaults_version: 1
    listen:
      Created Year: inventory_items.created_year
      Created Quarter: inventory_items.created_quarter
    row:
    col:
    width:
    height:
  filters:
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: 10 year
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: sunil_test
    explore: order_items_vijaya
    listens_to_filters: []
    field: inventory_items.created_year
  - name: Created Quarter
    title: Created Quarter
    type: field_filter
    default_value: 4 quarter
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: sunil_test
    explore: order_items_vijaya
    listens_to_filters: []
    field: inventory_items.created_quarter
