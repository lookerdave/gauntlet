- connection: crunchbase

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: acquisitions

- explore: companies

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


- explore: ipo

- explore: offices

- explore: people

- explore: runs

- explore: tags

