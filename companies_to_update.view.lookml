- view: companies_to_update
  fields:

  - dimension: permalink
    type: string
    sql: ${TABLE}.permalink

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: []

