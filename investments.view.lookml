- view: investments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: funding_id
    type: number
    # hidden: true
    sql: ${TABLE}.funding_id

  - dimension: investor_permalink
    type: string
    sql: ${TABLE}.investor_permalink

  - dimension: is_company
    type: yesno
    sql: ${TABLE}.is_company

  - measure: count
    type: count
    drill_fields: [id, funding.id]

