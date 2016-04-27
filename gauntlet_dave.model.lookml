- connection: crunchbase

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# Seems like investments is the most granular table in this model. Each company must have
# at least one or more investors participating in at least one funding round.
#
# Companies may or may not acquire other companies (which could happen many times), and they 
# may or may not be acquired (which only happens once).
# 
# Companies may or may not have an IPO.

- explore: companies
  joins:
  - join: funding
    type: left_outer
    sql_on: ${companies.permalink} = ${funding.permalink}
    relationship: one_to_many #one company can have many funding rounds
    
  - join: investments
    type: left_outer
    sql_on: ${funding.id} = ${investments.funding_id}
    relationship: one_to_many
    
  - join: company_acquired_by
    from: acquisitions
    type: left_outer
    sql_on: ${companies.permalink} = ${company_acquired_by.acquired_by_permalink}
    relationship: many_to_one
    
  - join: company_acquisitions
    from: acquisitions
    type: left_outer
    sql_on: ${companies.permalink} = ${company_acquisitions.acquired_permalink}
    relationship: many_to_one
    
  - join: ipo
    type: left_outer
    sql_on: ${companies.permalink} = ${ipo.company_permalink}
    relationship: one_to_one

- explore: companies_to_update
  hidden: true

- explore: competitions
  hidden: true

- explore: employment
  joins:
    - join: people
      type: left_outer
      sql_on: ${employment.permalink} = ${people.permalink}
      relationship: many_to_one

- explore: funding

- explore: acquisitions

- explore: ipo

- explore: offices
  hidden: true

- explore: people
  hidden: true

- explore: runs
  hidden: true

- explore: tags
  hidden: true

