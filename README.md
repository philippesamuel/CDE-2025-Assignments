# CDE-2025-Assignments
Assignments for the 2025 cohort of the Core Data Engineers Bootcamp


[//]: # (Add diagram of conceptual pipeline here. Use mermaid.js)

[//]: # (Written explanation)
[//]: # (Design choices)

It is fundamental to understand the profile and needs of the customers of Beejan Technologies.
What kind of downtime would the customers be able to tolerate?
What critical operations and businesses rely on Beejan Technologies?
Does the company have a SLA with their customers?

Assuming that the customers are located within one time-zone and that the majority of clients actively use the services between 6am and 12am, it can be beneficial to ingest data more frequently during this time-frame.
For this use case it is enough to ingest and process data in hourly batches.

### Data Sources

- Due to the company's profile, I assume that the most relevant social media platforms are Facebook, X(Twitter), LinkedIn and WhatsApp and that data about customer issues is ingested as JSON data through the respective official APIs.
- Call center data is provided as text log files.
- SMS (?)
- I assume that website forms data is stored in a SQL database.
- ... possibly other data sources

[//]: # (Assumptions/thought process)
[//]: # (Challenges or unknowns)
[//]: # (other information)
