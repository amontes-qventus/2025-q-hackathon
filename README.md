# Data Enrichment for Case Cancellations and No-Show Prediction (CNSP)

## Description
A predictive model designed to identify patients at high risk of canceling or not showing up for their scheduled surgeries. By analyzing historical data such as patient demographics, case types, and case history, the model generates risk scores. The goal is to provide schedulers with actionable insights to mitigate these risks through timely interventions.

We also wanted to enrich qventus knowledge about cases with public available data, we focused on hospital data from this [source](https://www.ahd.com/)

## Impact
This project is both innovative and impactful, addressing a critical inefficiency in perioperative workflows—unanticipated schedule gaps caused by cancellations or no-shows. Proactively addressing these gaps enables hospitals to:

- **Increase OR utilization rates.**
- **Enhance patient satisfaction** by efficiently rescheduling potentially canceled cases.
- **Reduce revenue loss** from unused OR time.
- Allow perioperative teams to **focus on patient care** rather than managing last-minute scheduling adjustments.

## Submitter
Andrea / Jenny

## Team Members
- Andrea Montes  
- Jenny Sanchez

## Infrastructure
We defined a docker-compose file to spin up 4 different services:
1. Dremio: Compute engine to run queries
2. Minio: s3 emulator
3. Nessie: Catalog tool to handle datawarehouses git-like
4. Notebook: Jupyter notbook to implement and visualize prediction model output
5. Superset: We actually didn't use this service, but it can be eventually used to graph things

## Achieved goals
1. We spun up sucessfully a fully local infraestructure saving snowflake credits for this kind of experimentations
2. We defined a small model to enrich the cases data, available in model or_cases_scheduled_enriched
3. We identified a smaller set of variables that have impact on the cancellation of cases
4. We defined a model to predict when a case is more likely to be cancelled

## Next steps
1. Incorporate the new variables we collected from the enrichment process, and include them in the training of the model
2. Create some visualizations to make easier the assessment of cases likely to be cancelled