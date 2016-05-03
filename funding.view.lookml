- view: funding
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: funded
    type: time
    timeframes: [date, week, month, year]
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
    
  - measure: total_raised
    type: sum
    sql: ${raised_amount}
    
  - measure: total_raised_by_currency_type
    type: sum
    sql: ${raised_amount}
    value_format: '#.##,," M"'
    html: |
      {% if raised_currency_code._value == 'USD' %}
        ${{ rendered_value }} US
      {% elsif raised_currency_code._value == 'EUR' %}
        €{{ rendered_value }} EUR
      {% elsif raised_currency_code._value == 'GBP' %}
        £{{ rendered_value }} GBP
      {% elsif raised_currency_code._value == 'CAD' %}
        ${{ rendered_value }} CAD
      {% elsif raised_currency_code._value == 'JPY' %}
        ¥{{ rendered_value }} JPY
      {% elsif raised_currency_code._value == 'SEK' %}
        kr{{ rendered_value }} SEK
      {% elsif raised_currency_code._value == 'NIS' %}
        ₪{{ rendered_value }} NIS
      {% elsif raised_currency_code._value == 'AUD' %}
        ${{ rendered_value }} AUD
      {% else %}
        ${{ rendered_value }}
      {% endif %}
        

