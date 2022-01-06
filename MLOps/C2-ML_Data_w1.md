# 1. Intro: Machine Learaning Ops Data Lifecycle

|**Managing the entire life cycle of data** |**Modern software development**|
|---|---|
|Labeling|Scalability
|Feature space coverage|Extensibility
|Minimal dimensionality|Configuration
|Maximun predictive data|Consistency & reproducibility|Safety & security
|Fairness|Modularity
|Rare conditions|Testability|
----------
## Production ML Life-cycle
    Scoping => Data => Modeling => Deployment
----------
##  Production ML infrastructure
One version example of the ML dev process:
![alt text](imgs/ML_infrastructure.png)
----------
##  PTF Extended(TFX)
is an end-to-end platform for deploying production ML pipelines: <br>
        data ingestion => data validation => feat.engineering => train model => validate model => push if good => serve model
- TFX libraries
![alt text](https://www.tensorflow.org/tfx/guide/images/libraries_components.png)
- TFX Hello-world
![alt text](https://www.tensorflow.org/tfx/guide/images/prog_fin.png)

-------
# 2. Collecting Data 

-------
# 3. Labeling Data

-------
# 4. Validating Data

