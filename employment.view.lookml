- view: employment
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: company_permalink
    type: string
    sql: ${TABLE}.company_permalink

  - dimension: is_past
    type: yesno
    sql: ${TABLE}.is_past

  - dimension: permalink
    type: string
    sql: ${TABLE}.permalink

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - measure: count
    type: count
    drill_fields: [id]

