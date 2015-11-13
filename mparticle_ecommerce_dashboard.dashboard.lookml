- dashboard: mparticle_ecommerce_dashboard
  title: mParticle Ecommerce Dashboard
  layout: tile
  tile_size: 100
  refresh: 1 hour
  
  filters:
    - name: date
      title: Date
      type: date_filter
      default_value: 30 Days

  elements:

  - name: Revenue by Attribution Source
    title: Revenue by Attribution Source
    listen:
      date: rawevents.eventdate_date
    type: looker_column
    model: mparticle_looker_blocks
    explore: rawevents
    dimensions: [rawevents.attribution_publisher_name]
    measures: [rawevents.revenue, rawevents.unique_user_count]
    dynamic_fields:
    - table_calculation: arpu
      label: ARPU
      expression: ${rawevents.revenue} / ${rawevents.unique_user_count}
      value_format: $#,##0.00
    sorts: [rawevents.revenue desc]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    hidden_fields: [rawevents.unique_user_count]
    ordering: none
    show_null_labels: false
    point_style: none
    interpolation: linear
    show_null_points: true
    x_axis_label: Attribution Source
    y_axis_labels: [Revenue]
    y_axis_value_format: $#,##0.00
    series_types:
      arpu: line
    series_labels:
      arpu: ARPU
      rawevents.revenue: Total Revenue
    y_axis_orientation: [left, right]
