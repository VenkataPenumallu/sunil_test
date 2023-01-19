- dashboard: special
  title: special
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: YsEEScfeJ0hjZ8LiSUxOHv
  elements:
  - title: quick_dashboard
    name: quick_dashboard
    model: sunil_test
    explore: users
    type: table
    fields: [users.city, users.created_date, users.state, users.last_name, users.gender,
      users.count]
    sorts: [users.created_date desc]
    limit: 500
    listen:
      Gender: users.gender
      State: users.state
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
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
    explore: users
    listens_to_filters: []
    field: users.gender
  - name: State
    title: State
    type: field_filter
    default_value: New York
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: sunil_test
    explore: users
    listens_to_filters: []
    field: users.state
