- view: users
  derived_table:
    sql_trigger_value: SELECT CURRENT_DATE
    distkey: mparticle_user_id
    sortkeys: [install_timestamp]
    sql: |
      select *
      from (
        select mparticleuserid as mparticle_user_id,
          min(case when messagetypeid = 7 then eventtimestamp end) as install_timestamp,
          min(attributionpublisher) as attribution_source  
        from app_191.eventsview
        group by 1)
      where install_timestamp is not null
      
  fields:
  
  - dimension: 
    sql: ${TABLE}.mparticle_user_id
    primary_key: true
  
  - dimension: install_timestamp
    type: time
    datatype: epoch
    timeframes: [time, date, week, month, year]
    sql: (${TABLE}.install_timestamp::bigint)/1000

  - dimension: attribution_source
    type: string
    sql: ${TABLE}.attribution_source
    
  - measure: count
    type: count
