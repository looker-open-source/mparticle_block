- connection: qa_redshift

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: rawevents
  sql_always_where: rawevents.eventtimestamp - coalesce(rawevents.firstseentimestamp, 0) >= 0
  joins: 
  - join: users
    sql_on: ${rawevents.mparticle_user_id} = ${users.mparticle_user_id}
    relationship: many_to_one

