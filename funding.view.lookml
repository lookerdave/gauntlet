- view: funding
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: funded
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.funded_at

  - dimension: permalink
    type: string
    sql: ${TABLE}.permalink

  - dimension: raised_amount
    type: number
    sql: ${TABLE}.raised_amount

  - dimension: raised_currency_code
    type: string
    sql: ${TABLE}.raised_currency_code

  - dimension: round_code
    type: string
    sql: ${TABLE}.round_code

  - dimension: source_description
    type: string
    sql: ${TABLE}.source_description

  - measure: count
    type: count
    drill_fields: [id, investments.count]

