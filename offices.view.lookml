- view: offices
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: company_permalink
    type: string
    sql: ${TABLE}.company_permalink

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - dimension: state_code
    type: string
    sql: ${TABLE}.state_code

  - measure: count
    type: count
    drill_fields: [id]

