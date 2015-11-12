- connection: qa_redshift

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: rawevents

#- explore: users
#  joins:
#    - join: rawevents
#      type: inner
#      relationship: one_to_many
#      sql_on: ${users.mparticle_user_id} = ${rawevents.mparticle_user_id}
      