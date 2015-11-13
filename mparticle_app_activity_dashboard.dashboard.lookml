- dashboard: mparticle_dashboard
  title: mParticle Dashboard
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
    - name: uu by App Platform
      title: Active Users by App Platform
      type: looker_column
      model: mparticle_looker_blocks
      explore: rawevents
      dimensions: [rawevents.app_name_platform]
      measures: [rawevents.unique_user_count]
      listen:
        date: rawevents.eventdate_date
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
      
    - name: Dau by app Platform
      title: DAU by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.eventdate_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.unique_user_count]
      sorts: [rawevents.eventdate_date desc, rawevents.app_name_platform]
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
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        platform: rawevents.platform
      dimensions: [rawevents.eventdate_date, rawevents.app_name_platform]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.avg_session_length]
      sorts: [rawevents.eventdate_date desc, rawevents.app_name_platform]
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

    - name: Daily Installs by App Platform
      title: Daily Installs by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.eventdate_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.install_count]
      sorts: [rawevents.eventdate_date desc, rawevents.app_name_platform]
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
        date: rawevents.eventdate_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.eventdate_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.revenue]
      sorts: [rawevents.eventdate_date desc, rawevents.app_name_platform]
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
        date: rawevents.eventdate_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.eventdate_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.session_count]
      sorts: [rawevents.eventdate_date desc, rawevents.app_name_platform]
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
      y_axis_labels: [Session Count]

    - name: Daily Incoming Message Count by App Platform
      title: Daily Incoming Message Count by App Platform
      type: looker_area
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
        platform: rawevents.platform
      dimensions: [rawevents.app_name_platform, rawevents.eventdate_date]
      pivots: [rawevents.app_name_platform]
      measures: [rawevents.count]
      sorts: [rawevents.unique_user_count desc, rawevents.app_name_platform]
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
      y_axis_labels: [Incoming Message Count]

    - name: Top 50 Event Name Stats
      title: Top 50 Event Name Stats
      type: table
      model: mparticle_looker_blocks
      explore: rawevents
      listen:
        date: rawevents.eventdate_date
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
        
    - name: add_a_unique_name_1447350016831
      title: User Retention
      type: looker_column
      model: mparticle_looker_blocks
      explore: rawevents
      dimensions: [rawevents.weeks_since_intall, users.attribution_source]
      pivots: [rawevents.weeks_since_intall]
      measures: [rawevents.unique_user_count]
      dynamic_fields:
      - table_calculation: user_retention_pct
        label: user retention pct
        expression: ${rawevents.unique_user_count} / pivot_index(${rawevents.unique_user_count}, 1)
        value_format: '#,##0.00%'
      sorts: [rawevents.weeks_since_intall, rawevents.unique_user_count desc 0]
      limit: 500
      column_limit: 50
      hidden_fields: [rawevents.unique_user_count]
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
      point_style: none
      interpolation: linear
      font_size: medium
      show_view_names: true
      value_labels: legend
      label_type: labPer
      show_dropoff: false
      swap_axes: false
        
