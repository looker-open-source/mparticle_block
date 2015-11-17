- view: rawevents
  sql_table_name: app_191.eventsview
  
  fields:

  - dimension: app_id
    type: int
    sql: ${TABLE}.appid

  - dimension: application_family_id
    type: int
    sql: ${TABLE}.applicationfamilyid

  - dimension: application_transition_type_id
    type: int
    sql: ${TABLE}.applicationtransitiontypeid

  - dimension: install_timestamp
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.firstseentimestamp::bigint) / 1000
    
  - dimension: app_name
    sql: ${TABLE}.appname

  - dimension: app_name_platform
    sql: ${app_name} || '-' || ${platform}
    
  - dimension: app_version
    sql: ${TABLE}.appversion

  - dimension: attribution_campaign_name
    sql: ${TABLE}.attributioncampaign

  - dimension: attribution_publisher_name
    sql: isnull(${TABLE}.attributionpublisher, 'UnAttributed')

  - dimension: attribution_service_provider_name
    sql: ${TABLE}.attributionserviceprovider

  - dimension: audience_membership
    sql: ${TABLE}.audiencemembership
    bypass_suggest_restrictions: true

  - dimension: batch_id
    type: int
    sql: ${TABLE}.batchid

  - dimension: batch_timestamp
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.batchtimestamp::bigint) / 1000


  - dimension: device_brand
    sql: ${TABLE}.brand

  - dimension: city_name
    sql: ${TABLE}.cityname

  - dimension: client_ip
    sql: ${TABLE}.clientip

  - dimension: country_code
    sql: ${TABLE}.countrycode
    bypass_suggest_restrictions: true

  - dimension: customer_id
    sql: ${TABLE}.customerid

  - dimension: data_connection_type
    sql: ${TABLE}.dataconnectiontype

  - dimension: device_model
    sql: ${TABLE}.devicemodel
    bypass_suggest_restrictions: true

  - dimension: device_utc_offset
    type: int
    sql: ${TABLE}.deviceutcoffset

  - dimension: email
    sql: ${TABLE}.email

  - dimension: entry_point_type
    type: number
    sql: ${TABLE}.entrypointtype
    bypass_suggest_restrictions: true

  - dimension: event_attributes
    sql: ${TABLE}.eventattributes

  - dimension_group: event
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.eventdate

  - dimension_group: eventhour
    type: time
    timeframes: [hour, date, week, month]
    sql: ${TABLE}.eventhour

  - dimension: hour
    type: int
    sql: date_part(h, ${TABLE}.eventhour)

  - dimension: event_id
    type: int
    sql: ${TABLE}.eventid

  - dimension: event_length
    type: number
    sql: ${TABLE}.eventlength
    
  - dimension: session_length
    type: number
    sql: case when ${message_type_id} = 2 then ${event_length} / 1000.0 end
    
  - dimension: event_ltv_value
    type: number
    sql: ${TABLE}.eventltvvalue

  - dimension: event_name
    sql: ${TABLE}.eventname
    bypass_suggest_restrictions: true

  - dimension: event_start_timestamp
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.eventstarttimestamp::bigint)/1000

  - dimension: event_timestamp
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.eventtimestamp::bigint)/1000

  - dimension: event_type_id
    type: int
    sql: ${TABLE}.eventtypeid

  - dimension: idfa
    sql: ${TABLE}.idfa

  - dimension: is_debug
    type: yesno
    sql: ${TABLE}.isdebug

  - dimension: is_upgrade_event
    type: yesno
    sql: ${TABLE}.isupgradeevent

  - dimension: message_type_id
    type: int
    sql: ${TABLE}.messagetypeid

  - dimension: mparticle_user_id
    type: number
    sql: ${TABLE}.mparticleuserid

  - dimension: platform
    sql: ${TABLE}.platform
    bypass_suggest_restrictions: true

  - dimension: region_code
    sql: ${TABLE}.regioncode

  - dimension: sampling_percentage
    type: int
    sql: ${TABLE}.samplingpercentage

  - dimension: os_version
    sql: ${TABLE}.osversion
    
  - dimension: sdk_version
    sql: ${TABLE}.sdkversion

  - dimension: session_id
    type: int
    sql: ${TABLE}.sessionid

  - dimension: session_start_timestamp
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.sessionstarttimestamp::bigint)/1000

  - dimension: successfully_closed
    type: yesno
    sql: ${TABLE}.successfullyclosed
    
  - dimension: upgrade_date
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.upgradedate::bigint)/1000

  - dimension: user_attributes
    sql: ${TABLE}.userattributes

  - dimension: days_since_install
    type: int
    sql: ${event_date} - ${users.install_timestamp_date}
    
  - dimension: weeks_since_install
    type: int
    sql: datediff(week, ${users.install_timestamp_date}, ${event_date})
    
  - measure: count
    type: count

  - measure: unique_user_count
    type: count_distinct
    approximate: true
    sql: ${mparticle_user_id}
    
  - measure: avg_session_length
    type: avg
    sql: ${session_length}
    
  - measure: session_count
    type: sum
    sql: case when ${message_type_id} = 1 then 1 else 0 end
    
  - measure: revenue
    type: sum
    sql: ${event_ltv_value}
    value_format: '$#,##0.00'
    
  - measure: install_count
    type: sum
    sql: case when ${message_type_id} = 7 then 1 else 0 end
  
  - measure: time_spent_in_app
    type: sum
    sql: isnull(case when ${message_type_id} = 2 then ${event_length} / 1000 end, 0)
  
  - measure: arpu
    label: "ARPU"
    type: number
    sql: ${revenue} / ${unique_user_count}
    value_format: '$#,##0.00'
    
  # Audience analytics fields #
  - filter: audience_membership_filter
    suggest_explore: rawevents
    suggest_dimension: rawevents.audience_membership
    bypass_suggest_restrictions: true
  
  - dimension: is_in_audience
    type: yesno
    sql: case when {% condition audience_membership_filter %} ${audience_membership} {% endcondition %} then 1 else 0 end
    
  # Funnel Fields #
  
  - filter: event_1
    suggest_explore: rawevents
    suggest_dimension: event_name
  
  - filter: event_2
    suggest_explore: rawevents
    suggest_dimension: event_name
  
  - filter: event_3
    suggest_explore: rawevents
    suggest_dimension: event_name
  
  - filter: event_4
    suggest_explore: rawevents
    suggest_dimension: event_name

  - filter: event_5
    suggest_explore: rawevents
    suggest_dimension: event_name
    
  - measure: funnel.event_1_uu_count
    type: number
    sql: count(distinct case when {% condition event_1 %} ${event_name} {% endcondition %} THEN ${mparticle_user_id} END)

  - measure: funnel.event_2_uu_count
    type: number
    sql: count(distinct case when {% condition event_2 %} ${event_name} {% endcondition %} THEN ${mparticle_user_id} END)
    
  - measure: funnel.event_3_uu_count
    type: number
    sql: count(distinct case when {% condition event_3 %} ${event_name} {% endcondition %} THEN ${mparticle_user_id} END)
    
  - measure: funnel.event_4_uu_count
    type: number
    sql: count(distinct case when {% condition event_4 %} ${event_name} {% endcondition %} THEN ${mparticle_user_id} END)
  
  - measure: funnel.event_5_uu_count
    type: number
    sql: count(distinct case when {% condition event_5 %} ${event_name} {% endcondition %} THEN ${mparticle_user_id} END)