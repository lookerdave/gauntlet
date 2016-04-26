- view: competitions
  fields:

  - dimension: competitor_permalink
    type: string
    sql: ${TABLE}.competitor_permalink

  - dimension: permalink
    type: string
    sql: ${TABLE}.permalink

  - measure: count
    type: count
    drill_fields: []

