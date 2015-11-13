- dashboard: mparticle_audience_dashboard
  title: Mparticle Audience Dashboard
  layout: tile
  tile_size: 100
  refresh: 6 hours
  
  filters:
    - name: date
      title: Date
      type: date_filter
      default_value: 30 Days
    
    - name: platform
      type: field_filter
      explore: rawevents
      field: rawevents.platform
      
    - name: audience_membership_filter
      type: string_filter
      explore: rawevents
      field: rawevents.audience_membership_filter
  
  elements:
    - name: add_a_unique_name_1447443937174
      title: Audience Size by Day
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      dimensions: [rawevents.eventdate_date]
      measures: [rawevents.unique_user_count]
      listen:
        date: rawevents.eventdate_date
        audience_membership_filter: rawevents.audience_membership_filter
      filters:
        rawevents.is_in_audience: 'Yes'
      sorts: [rawevents.unique_user_count desc]
      limit: 500
      column_limit: 50
      show_view_names: true
      hidden_fields: [rawevents.count]
      show_null_points: true
      point_style: none
      interpolation: linear
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      x_axis_label: Date
      y_axis_labels: [Audience Size]
      ordering: none
      show_null_labels: false
      show_row_numbers: true

    - name: add_a_unique_name_1447443189312
      title: Daily Avg Session Length by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        audience_membership_filter: rawevents.audience_membership_filter
      dimensions: [rawevents.eventdate_date, rawevents.is_in_audience]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.avg_session_length]
      sorts: [rawevents.eventdate_date desc, rawevents.is_in_audience desc]
      limit: 500
      column_limit: 50
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_points: true
      point_style: none
      interpolation: linear
      x_axis_label: Date
      y_axis_labels: [Avg Session Length (in sec)]

    - name: add_a_unique_name_1447444522033
      title: Daily Time Spent In App Per User by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        audience_membership_filter: rawevents.audience_membership_filter
      dimensions: [rawevents.eventdate_date, rawevents.is_in_audience]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.time_spent_in_app, rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: time_spent_in_app_per_user_in_sec
        label: Time Spent In App Per User (in sec)
        expression: ${rawevents.time_spent_in_app} / ${rawevents.unique_user_count}
        value_format: '#,##0'
      sorts: [rawevents.unique_user_count desc 1, rawevents.is_in_audience]
      limit: 500
      column_limit: 50
      hidden_fields: [rawevents.time_spent_in_app, rawevents.unique_user_count]
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_points: true
      point_style: none
      interpolation: linear
      x_axis_label: Date

    - name: add_a_unique_name_1447437478710
      title: Daily ARPU by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        audience_membership_filter: rawevents.audience_membership_filter
      dimensions: [rawevents.is_in_audience, rawevents.eventdate_date]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.revenue, rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: arpu
        label: Avg Revenue Per User
        expression: ${rawevents.revenue} / ${rawevents.unique_user_count}
        value_format: $#,##0.00
      sorts: [rawevents.eventdate_date desc, rawevents.is_in_audience desc]
      limit: 500
      column_limit: 50
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_points: true
      point_style: none
      interpolation: linear
      hidden_fields: [rawevents.unique_user_count, rawevents.revenue]
      x_axis_label: Date
      
    - name: add_a_unique_name_1447443500765
      title: Daily Message Count Per User by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        audience_membership_filter: rawevents.audience_membership_filter
      dimensions: [rawevents.eventdate_date, rawevents.is_in_audience]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.count, rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: event_count_per_user
        label: Event Count Per User
        expression: ${rawevents.count} / ${rawevents.unique_user_count}
        value_format: '#,##0'
      sorts: [rawevents.eventdate_date desc, rawevents.is_in_audience desc]
      limit: 500
      column_limit: 50
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_points: true
      point_style: none
      interpolation: linear
      hidden_fields: [rawevents.unique_user_count, rawevents.count]
      x_axis_label: Date
    
