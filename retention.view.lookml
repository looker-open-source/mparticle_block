- view: retention
  derived_table:
    sql: |
      SELECT * FROM (
      SELECT *, RANK() OVER (PARTITION BY "rawevents.install_timestamp_week" ORDER BY "rawevents.unique_user_count" DESC,"rawevents.install_timestamp_week" ) as z___rank FROM (
      SELECT
              TO_CHAR(DATE_TRUNC('week', (timestamp 'epoch' + (rawevents.firstseentimestamp) / 1000 * interval '1 second')),'YYYY-MM-DD') AS "rawevents.install_timestamp_week",
              TO_CHAR(DATE_TRUNC('week', rawevents.eventdate),'YYYY-MM-DD') AS "rawevents.eventdate_week",
              APPROXIMATE COUNT(DISTINCT rawevents.mparticleuserid) AS "rawevents.unique_user_count"
      FROM app_191.eventsview AS rawevents
      where eventdate > current_date - 90
      and firstseentimestamp > date_part(epoch, current_date - 90) * 1000
      and eventtimestamp >= firstseentimestamp
      GROUP BY 1,2) ww
      ) aa
      LIMIT 30000

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: rawevents_install_timestamp_week
    type: string
    sql: ${TABLE}."rawevents.install_timestamp_week"

  - dimension: rawevents_eventdate_week
    type: string
    sql: ${TABLE}."rawevents.eventdate_week"

  - dimension: rawevents_unique_user_count
    type: int
    sql: ${TABLE}."rawevents.unique_user_count"

  - dimension: z___rank
    type: int
    sql: ${TABLE}.z___rank

  sets:
    detail:
      - rawevents_install_timestamp_week
      - rawevents_eventdate_week
      - rawevents_unique_user_count
      - z___rank
