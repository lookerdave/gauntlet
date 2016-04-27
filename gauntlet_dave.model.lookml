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

- explore: investments
  joins:
    - join: funding
      type: left_outer 
      sql_on: ${investments.funding_id} = ${funding.id}
      relationship: many_to_one
    - join: companies
      type: left_outer
      sql_on: ${funding.permalink} = ${companies.permalink}
      relationship: many_to_one
      
- explore: companies
  joins:
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

- explore: companies_to_update

- explore: competitions

- explore: employment

- explore: funding

- explore: acquisitions

- explore: ipo

- explore: offices

- explore: people

- explore: runs

- explore: tags

