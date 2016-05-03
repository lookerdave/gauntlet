- view: company_facts
  derived_table:
    sql_trigger_value: SELECT CURDATE()
    indexes: [permalink]
    sql: |
      SELECT
        companies.permalink
        , CASE WHEN acquisitions.acquired_by_permalink IS NOT NULL THEN 1 ELSE 0 END as acquired_bool
        , acquisitions.price_amount
        , (SELECT COUNT(*) FROM acquisitions WHERE companies.permalink = acquisitions.acquired_by_permalink) as lifetime_acq_count
        , (SELECT COUNT(*) FROM funding where companies.permalink = funding.permalink) as count_funding_rounds
        , SUM(funding.raised_amount) as total_investment
        , GROUP_CONCAT(DISTINCT investments.investor_permalink) as investor_list
        , COUNT(DISTINCT investments.investor_permalink) as num_investors
      FROM companies
      LEFT JOIN acquisitions 
      ON companies.permalink = acquisitions.acquired_permalink
      LEFT JOIN funding
      ON companies.permalink = funding.permalink
      LEFT JOIN investments
      ON investments.funding_id = funding.id
      GROUP BY 1

  fields:
    - dimension: permalink
      type: string
      sql: ${TABLE}.permalink
      primary_key: true
      
    - dimension: crunchbase_link
      sql: ${TABLE}.permalink
      html: |
        <a href="http://www.crunchbase.com/{{ value }}" />
      
    - dimension: was_acquired
      type: yesno
      sql: ${TABLE}.acquired_bool = 1
      
    - dimension: acquisition_price
      type: number
      sql: ${TABLE}.price_amount
      
    - dimension: number_of_acquisitions
      type: number
      sql: ${TABLE}.lifetime_acq_count
      
    - dimension: number_of_funding_rounds
      type: number
      sql: ${TABLE}.count_funding_rounds
      
    - dimension: total_investment
      type: number
      sql: ${TABLE}.total_investment
      
    - dimension: investor_list
      type: string
      sql: ${TABLE}.investor_list
      
    - dimension: number_of_investors
      type: number
      sql: ${TABLE}.num_investors
      
    - measure: count
      type: count
