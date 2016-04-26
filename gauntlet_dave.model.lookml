- connection: crunchbase

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: companies
  joins:
  - join: company_acquired_by
    from: acquisitions
    type: left_outer
    sql_on: ${companies.permalink} = ${company_acquired_by.acquired_by_permalink}
    relationship: many_to_one

- explore: companies_to_update

- explore: competitions

- explore: employment

- explore: funding

- explore: investments
  joins:
    - join: funding
      type: left_outer 
      sql_on: ${investments.funding_id} = ${funding.id}
      relationship: many_to_one

- explore: acquisitions

- explore: ipo

- explore: offices

- explore: people

- explore: runs

- explore: tags

