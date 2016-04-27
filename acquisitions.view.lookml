- view: acquisitions
  fields:

  - dimension_group: acquired
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.acquired_at

  - dimension: acquired_by_permalink
    type: string
    sql: ${TABLE}.acquired_by_permalink

  - dimension: acquired_permalink
    primary_key: true
    type: string
    sql: ${TABLE}.acquired_permalink

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension: price_amount
    type: number
    sql: ${TABLE}.price_amount

  - measure: count
    type: count
    drill_fields: []

