- view: companies
  fields:

  - dimension: blog_url
    type: string
    sql: ${TABLE}.blog_url

  - dimension: category_code
    type: string
    sql: ${TABLE}.category_code

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: crunchbase_url
    type: string
    sql: ${TABLE}.crunchbase_url

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension_group: founded
    type: time
    timeframes: [date, week, month, year]
    convert_tz: false
    sql: ${TABLE}.founded_at

  - dimension: full_record
    type: yesno
    sql: ${TABLE}.full_record

  - dimension: homepage_url
    type: string
    sql: ${TABLE}.homepage_url

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: number_of_employees
    type: number
    sql: ${TABLE}.number_of_employees

  - dimension: overview
    type: string
    sql: ${TABLE}.overview

  - dimension: permalink
    primary_key: true
    type: string
    sql: ${TABLE}.permalink

  - dimension: phone_number
    type: string
    sql: ${TABLE}.phone_number

  - dimension: twitter_username
    type: string
    sql: ${TABLE}.twitter_username

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at
  
#   - dimension: was_company_acquired
#     type: yesno
#     sql: 

  - measure: count
    type: count
    drill_fields: [name, twitter_username]

