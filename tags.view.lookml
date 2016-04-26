- view: tags
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: permalink
    type: string
    sql: ${TABLE}.permalink

  - dimension: tag
    type: string
    sql: ${TABLE}.tag

  - measure: count
    type: count
    drill_fields: [id]

