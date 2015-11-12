- connection: qa_redshift

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: rawevents
  joins: 
  - join: users
    sql_on: ${rawevents.mparticle_user_id} = ${users.mparticle_user_id}
    relationship: many_to_one

