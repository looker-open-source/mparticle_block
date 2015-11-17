- dashboard: mparticle_dashboard
  title: mParticle App Activity Dashboard
  layout: tile
  tile_size: 100
  refresh: 1 hour
  
  filters:
    - name: date
      title: Date
      type: date_filter
      default_value: 30 Days

    - name: platform
      type: field_filter
      explore: rawevents
      field: rawevents.platform
      
    - name: event_1
      type: field_filter
      explore: rawevents
      field: rawevents.event_name
      
    - name: event_2
      type: field_filter
      explore: rawevents
      field: rawevents.event_name
      
    - name: event_3
      type: field_filter
      explore: rawevents
      field: rawevents.event_name
      
    - name: event_4
      type: field_filter
      explore: rawevents
      field: rawevents.event_name
      
  elements:
    - name: add_a_unique_name_1447720576943
      title: Session Count
      type: single_value
      model: mparticle_looker_blocks
      explore: rawevents
      measures: [rawevents.session_count]
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      sorts: [rawevents.event_type_id, rawevents.platform, rawevents.session_count desc]
      limit: 500
      font_size: small
      height: 2
      width: 4
    
    - name: add_a_unique_name_1447720717803
      title: Average Session Length (Seconds)
      type: single_value
      model: mparticle_looker_blocks
      explore: rawevents
      measures: [rawevents.avg_session_length]
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      sorts: [rawevents.event_type_id, rawevents.platform, rawevents.avg_session_length desc]
      limit: 500
      font_size: small
      height: 2
      width: 4
    
    - name: add_a_unique_name_1447720645961
      title: Total Installs
      type: single_value
      model: mparticle_looker_blocks
      explore: rawevents
      measures: [rawevents.install_count]
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      sorts: [rawevents.event_type_id, rawevents.platform, rawevents.install_count desc]
      limit: 500
      font_size: small
      height: 2
      width: 4
  
    - name: uu by App Platform
      title: Active Users by App Platform
      type: looker_column
      model: mparticle_looker_blocks
      explore: rawevents
      dimensions: [rawevents.app_name_platform]
      measures: [rawevents.unique_user_count]
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      sorts: [rawevents.unique_user_count desc]
      limit: 500
      column_limit: 50
      show_row_numbers: true
      ordering: none
      show_null_labels: false
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
      show_null_points: true
      point_style: circle
      interpolation: linear
      value_labels: legend
      label_type: labPer
      font_size: medium
      show_view_names: true
      y_axis_labels: [Monthly Active Users]
      x_axis_label: App
    
    - name: add_a_unique_name_1447446044934
      title: Session Count Breakdown by OS Version
      type: looker_column
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.os_version, rawevents.platform]
      pivots: [rawevents.platform]
      measures: [rawevents.session_count]
      dynamic_fields:
      - table_calculation: session_pct
        label: session_pct
        expression: ${rawevents.session_count} / ${rawevents.session_count:total}
        value_format: 0.0%
      sorts: [rawevents.session_count desc 0, rawevents.platform]
      limit: 500
      column_limit: 50
      total: true
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
      ordering: none
      show_null_labels: false
      value_labels: legend
      label_type: labPer
      hidden_fields: [rawevents.session_count]
      y_axis_labels: ['% of Sessions']
      y_axis_value_format: 0.0%
      x_axis_label: OS Version
  
    - name: Dau by app Platform
      title: DAU by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.event_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.unique_user_count]
      sorts: [rawevents.event_date desc, rawevents.app_name_platform]
      limit: 500
      column_limit: 50
      show_view_names: true
      stacking: normal
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
      point_style: none
      interpolation: linear
      show_null_points: true
      value_labels: legend
      label_type: labPer
      ordering: none
      show_null_labels: false
      x_axis_label: Date
      y_axis_labels: [Daily Active Users]

    - name: Daily Avg Session Length by App Platform
      title: Daily Avg Session Length by App Platform
      type: looker_line
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.event_date, rawevents.app_name_platform]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.avg_session_length]
      sorts: [rawevents.event_date desc, rawevents.app_name_platform]
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
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_null_points: true
      y_axis_labels: [Avg Session Length (in sec)]
      x_axis_label: Date
    
    - name: add_a_unique_name_1447446597510
      title: Daily Time Spent In App Per User by App
      type: looker_line
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.event_date, rawevents.app_name_platform]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.time_spent_in_app, rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: time_spent_in_app_per_user
        label: Time Spent In App Per User
        expression: ${rawevents.time_spent_in_app} / ${rawevents.unique_user_count}
        value_format: '0'
      sorts: [rawevents.session_count desc 0, rawevents.platform, rawevents.app_name_platform]
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
      y_axis_labels: [Time Spent In App Per User (in sec)]
      hidden_fields: [rawevents.unique_user_count, rawevents.time_spent_in_app]

    - name: add_a_unique_name_1447448040138
      title: Session Count by Hour of Day by App
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.hour]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.session_count]
      sorts: [rawevents.session_count desc 1, rawevents.app_name_platform]
      limit: 500
      column_limit: 50
      show_view_names: true
      ordering: none
      show_null_labels: false
      stacking: normal
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
      point_style: none
      interpolation: linear
      show_null_points: true
      value_labels: legend
      label_type: labPer
      x_axis_label: Hour of Day
      y_axis_labels: [Session Count]

    - name: Daily Installs by App Platform
      title: Daily Installs by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.event_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.install_count]
      sorts: [rawevents.event_date desc, rawevents.app_name_platform]
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
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_null_points: true
      y_axis_labels: [Installs]
      x_axis_label: Date

    - name: Daily Revenue by App Platform
      title: Daily Revenue by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.event_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.revenue]
      sorts: [rawevents.event_date desc, rawevents.app_name_platform]
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
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_null_points: true
      x_axis_label: Date
      y_axis_labels: [Revenue]
      y_axis_value_format: $#,##0.00

    - name: Daily Session Count by App Platform
      title: Daily Session Count by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.event_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.session_count]
      sorts: [rawevents.event_date desc, rawevents.app_name_platform]
      limit: 500
      column_limit: 50
      stacking: normal
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
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_null_points: true
      x_axis_label: Date
      y_axis_labels: [Session Count]

    - name: Top 50 Event Name Stats
      title: Top 50 Event Name Stats
      type: table
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.event_date
        platform: rawevents.platform
      dimensions: [rawevents.event_name]
      measures: [rawevents.count, rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: event_count_per_user
        label: Event count per user
        expression: ${rawevents.count} / ${rawevents.unique_user_count}
        value_format: '0.00'
      filters:
        rawevents.event_name: -EMPTY
        rawevents.message_type_id: '4,16'
      sorts: [rawevents.count desc]
      limit: 50
      column_limit: 50
      show_view_names: true
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
      ordering: none
      show_null_labels: false
      show_row_numbers: true
    
    - name: Funnel Analytics by App Platform
      title: Funnel Analytics by App Platform
      type: looker_column
      model: mparticle_looker_blocks
      explore: rawevents
      measures: [funnel.event_1_uu_count, funnel.event_2_uu_count, funnel.event_3_uu_count,
        funnel.event_4_uu_count]
      dimensions: [rawevents.app_name_platform]
      listen:
        date: rawevents.event_date
        event_1: rawevents.event_1
        event_2: rawevents.event_2
        event_3: rawevents.event_3
        event_4: rawevents.event_4
        platform: rawevents.platform
      limit: 500
      column_limit: 50
      show_view_names: true
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
      x_axis_label: App Platform
      ordering: none
      show_null_labels: false
      show_row_numbers: true
      show_dropoff: true
      y_axis_labels: [Unique User Count]
      y_axis_value_format: '#,##0'
      series_labels:
        funnel.event_1_uu_count: Event 1
        funnel.event_2_uu_count: Event 2
        funnel.event_3_uu_count: Event 3
        funnel.event_4_uu_count: Event 4
        
    - name: add_a_unique_name_1447703126712
      title: User Retention by Attribution Source
      type: looker_line
      model: mparticle_looker_blocks
      explore: rawevents
      dimensions: [rawevents.weeks_since_install, users.attribution_source]
      pivots: [users.attribution_source]
      measures: [rawevents.unique_user_count]
      filters:
        rawevents.weeks_since_install: NOT NULL
        users.attribution_source: -NULL
      dynamic_fields:
      - table_calculation: user_retention_pct
        label: user retention pct
        expression: ${rawevents.unique_user_count} / max(${rawevents.unique_user_count})
        value_format: '#,##0.00%'
      sorts: [rawevents.weeks_since_install, rawevents.unique_user_count desc 0, users.attribution_source]
      limit: 500
      column_limit: 50
      hidden_fields: [rawevents.unique_user_count]
      show_row_numbers: true
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
      show_null_points: true
      point_style: none
      interpolation: linear
      font_size: medium
      show_view_names: true
      value_labels: legend
      label_type: labPer
      ordering: none
      show_null_labels: false
      show_dropoff: false
      y_axis_labels: [User Retention Percent %]
      y_axis_value_format: 0%
      x_axis_label: Weeks since install
    