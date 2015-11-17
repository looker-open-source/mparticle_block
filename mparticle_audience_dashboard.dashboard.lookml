- dashboard: mparticle_audience_dashboard
  title: mParticle Audience Dashboard
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
      type: field_filter
      explore: rawevents
      field: rawevents.audience_membership
      default_value: '%"1234"%' ## when using this dashboard, users need to change the value to relevant audience ID for audience analytics
  
  elements:
    - name: add_a_unique_name_1447443937174
      title: Audience Size by Day
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      dimensions: [rawevents.event_date]
      measures: [rawevents.unique_user_count]
      listen:
        date: rawevents.event_date
        audience_membership_filter: rawevents.audience_membership_filter
        platform: rawevents.platform
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

    - name: add_a_unique_name_1447456463158
      title: Audience Lift % (comparing users in the audience vs not in the audience)
      type: looker_column
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        audience_membership_filter: rawevents.audience_membership_filter
        platform: rawevents.platform
      dimensions: [rawevents.is_in_audience]
      measures: [rawevents.avg_session_length, rawevents.time_spent_in_app, rawevents.unique_user_count,
        rawevents.arpu, rawevents.session_count]
      dynamic_fields:
      - table_calculation: sessions_per_user
        label: Sessions Per User
        expression: ${rawevents.session_count} / ${rawevents.unique_user_count}
        value_format: '#,##0.0'
      - table_calculation: time_spent_in_app_per_user
        label: Time Spent In App Per User
        expression: ${rawevents.time_spent_in_app}/${rawevents.unique_user_count}
        value_format: '#,##0.0'
      - table_calculation: arpu_lift
        label: ARPU Lift %
        expression: if(${rawevents.arpu} > 0, if(offset(${rawevents.arpu}, -1) > 0, ${rawevents.arpu} / offset(${rawevents.arpu}, -1) - 1, null), null)
        value_format: '#,##0.0%'
      - table_calculation: sessions_per_user_lift
        label: Sessions Per User Lift %
        expression: ${sessions_per_user} / offset(${sessions_per_user}, -1) - 1
        value_format: '#,##0.0%'
      - table_calculation: avg_session_length_lift
        label: Avg Session Length Lift %
        expression: ${rawevents.avg_session_length} / offset(${rawevents.avg_session_length}, -1) - 1
        value_format: '#,##0.0%'
      - table_calculation: time_spent_in_app_per_user_lift
        label: Time Spent In App Per User Lift %
        expression: ${time_spent_in_app_per_user} / offset(${time_spent_in_app_per_user}, -1) - 1
        value_format: '#,##0.0%'
      sorts: [rawevents.is_in_audience]
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: auto
      ordering: none
      show_null_labels: false
      hidden_fields: [rawevents.time_spent_in_app, rawevents.unique_user_count, rawevents.arpu,
        rawevents.session_count, time_spent_in_app_per_user, sessions_per_user, rawevents.avg_session_length]
      y_axis_value_format: '#,##0.0%'
      y_axis_labels: [Lift %]
      hidden_points_if_no: [rawevents.is_in_audience]
    
    - name: add_a_unique_name_1447437478710
      title: Daily ARPU by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        audience_membership_filter: rawevents.audience_membership_filter
        platform: rawevents.platform
      dimensions: [rawevents.is_in_audience, rawevents.event_date]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.arpu]
      sorts: [rawevents.event_date desc, rawevents.is_in_audience desc]
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
      y_axis_labels: ARPU
      
    - name: add_a_unique_name_1447437478710
      title: Daily Sessions Per User by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        audience_membership_filter: rawevents.audience_membership_filter
        platform: rawevents.platform
      dimensions: [rawevents.is_in_audience, rawevents.event_date]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.session_count, rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: sessions_per_user
        label: Sessions Per User
        expression: ${rawevents.session_count} / ${rawevents.unique_user_count}
      sorts: [rawevents.event_date desc, rawevents.is_in_audience desc]
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
      hidden_fields: [rawevents.unique_user_count, rawevents.session_count]
      x_axis_label: Date

    - name: add_a_unique_name_1447443189312
      title: Daily Avg Session Length by Audience Membership
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        audience_membership_filter: rawevents.audience_membership_filter
        platform: rawevents.platform
      dimensions: [rawevents.event_date, rawevents.is_in_audience]
      pivots: [rawevents.is_in_audience]
      measures: [rawevents.avg_session_length]
      sorts: [rawevents.event_date desc, rawevents.is_in_audience desc]
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
        date: rawevents.event_date
        audience_membership_filter: rawevents.audience_membership_filter
        platform: rawevents.platform
      dimensions: [rawevents.event_date, rawevents.is_in_audience]
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

    