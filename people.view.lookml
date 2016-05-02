- view: people
  fields:

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: permalink
    primary_key: true
    type: string
    sql: ${TABLE}.permalink

  - measure: count
    type: count
    drill_fields: [last_name, first_name]

