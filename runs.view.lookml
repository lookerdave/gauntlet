- view: runs
  fields:

  - dimension_group: run
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.run_at

  - measure: count
    type: count
    drill_fields: []

