# GLOSSARY 1 - RDD Method

## General Methods and Functions

**Method Name, Parameters**  | **Method Type** | **Description** | **Sample Code**
------------- | ------------| ------------|-------------|
|parallelize(x, numSlices = None)  | N/A | Distribute a local Python collection to form an RDD. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.SparkContext.parallelize.html) | 06 |
|textfile(name, minPartitions = None)  | N/A| Read a text file from a local file system and return it as an RDD of Strings.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.SparkContext.textFile.html)|06|
<br>

## RDD Methods 

**Method Name, Parameters**  | **Method Type** | **Description** | **Sample Code**
------------- | ------------| ------------|-------------|
|collect() | action | Returns a list that contains all of the elements in this RDD.  | 06|
|count()| action| Returns the number of elements in this RDD. |06
|countByKey()|action|Count the number of elements for each key, and return the result to the master as a dictionary.|11
|distinct(numPartitions=None)|transformation|Returns and RDD of distinct elements from the orginal RDD.|07
|filter(f)|transformation|Return a new RDD containing only the elements that satisfy a condition represented by f.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.filter)|09
|flatMap(f)|transformation|Return a new RDD by applying a function to each element of the original RDD and then flattening the results.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.flatMap)|08
|getNumPartitions()|action|Returns the number of partitions in the RDD. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.getNumPartitions)|07
|glom()|transformation|Returns an RDD containing lists, with each list representing a partition of the original RDD. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.glom)|07
|map(f)|transformation|Return a new RDD by applying a function to each element of the original RDD. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.map)|08
|mapValues(f)|transformation|Pass each value in the key-value pair RDD through a map function without changing the keys.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.mapValues)|11
|max(key=None)|action|Find the maximum item in this RDD.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.max.html)|06
|mean()|action|Compute the mean of this RDD’s elements.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.mean.html)|06
|min(key=None)|action|Find the minimum item in this RDD.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.min.html)|06
|persist(f)|N/A|Set this RDD’s storage level to persist its values across operations after the first time it is computed.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.persist)|10
|reduce(f)|action|Reduces the elements of the RDD using the specified commutative and associative binary operator. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.reduce)|09
|reduceByKey(func)|transformation|Merge the values for each key using an associative and commutative reduce function.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.reduceByKey)|11
|sample(withReplacement, fraction, seed=None)|transformation|Returns an RDD of elements randomly selected from the original RDD. The expected size of the sample is equal to fraction times the size of the RDD being sampled from. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.sample)|07
|sortBy(ascending=True, keyfunc=f)|transformation|Sorts this RDD by the given keyfunc.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.sortBy.html)|09
|stats()|action|Generates a report stating the count, mean, standard deviation, max and min of the RDD elements.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.stats.html)|06
|stdev()|action|Compute the standard deviation of this RDD’s elements.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.stdev.html)|06
|sum()|action|Add up the elements in this RDD.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.sum.html)|06
|take(num)|action|Returns a list containing the first num elements of the RDD.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.take)|07
|unpersist(f)|N/A|Mark the RDD as non-persistent, and remove all blocks for it from memory and disk.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.unpersist)|10
|variance()|action|Compute the variance of this RDD’s elements.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.variance.html)|06
<br>
<br>


# GLOSSARY 2 -  Data Frame Methods

## General Methods and Functions

| **Method Name and Parameters** | **Method Type** | **Description** | **Sample Code** |
| ------------------------------ | --------------- | --------------- | ------------|
| createDataFrame(data, schema=None) | N/A | Creates a DataFrame from an RDD, a list, or a pandas DataFrame.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.SparkSession.createDataFrame)|14|
| sql(sqlQuery) | N/A |Returns a DataFrame representing the result of the given query.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.SparkSession.sql)|23|

<br>

## Data Frame Methods
| **Method Name and Parameters** | **Method Type** | **Description** | **Sample Code** |
| ------------------------------ | --------------- | --------------- | ------------|
|agg(*exprs)|transformation|Aggregate on the entire DataFrame without groups, or to performed grouped aggregations.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.agg)|16|
|count()|action|Returns the number of rows in this DataFrame.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.count)|15|
|crossJoin(other)|transformation|Returns the Cartesian product with another DataFrame.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.crossJoin)|20|
|describe(*cols)|transformation|Computes basic statistics for numeric and string columns.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.describe)|15|
|dropna(how='any', subset=None)|transformation|Returns a new DataFrame omitting rows with null values.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.dropna)|15|
|fillna(value, subset=None)|transformation|Replaces null values. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.fillna)|15|
|filter(condition)|transformation|Filters rows using the given condition.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.filter)|16|
|groupBy(*cols)|transformation|Groups the DataFrame using the specified columns, so we can run aggregation on them. See [GroupedData](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.GroupedData) for all the available aggregation functions.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.groupBy)|16|
|join(other, on, how)|transformation|Joins with another DataFrame using the given join expression.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.join)|19 - 21 |
|persist
|printSchema()|action|Prints out the schema in the tree format.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.printSchema)|14|
|sample(withReplacement=None, fraction=None, seed=None)|transformation|Returns a sampled subset of this DataFrame.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.sample)|15|
|select(*cols)transformation|Projects a set of expressions and returns a new DataFrame.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.select)|16|
|show(n=20, truncate=True, vertical=False)|action|Prints the first n rows to the console.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.show)|14|
|sort(*cols, ascending=False)|transformation|Returns a new DataFrame sorted by the specified column(s).  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.sort)|16|
|summary(*statistics)|transformation|Computes specified statistics for numeric and string columns. Available statistics are: - count - mean - stddev - min - max - arbitrary approximate percentiles specified as a percentage (eg, 75%)  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.summary)|15|
|toPandas(ascending=True, keyfunc=f)|action|Returns the contents of this DataFrame as Pandas pandas.DataFrame.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.toPandas)|14|
|unpersist
|withColumn(colName, col)|transformation|Returns a new DataFrame by adding a column or replacing the existing column that has the same name.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.withColumn)|16
<br>
<br>


   
# GLOSSARY 3 -  Machine Learning Class


| **Method Name and Parameters** | **Description** | **Lessons** |
| ------------------------------ |---------------  | ------------|
|CrossValidator(estimator=None, estimatorParamMaps=None, evaluator=None, numFolds=3, seed=None, parallelism=1)|K-fold cross validation performs model selection by splitting the dataset into a set of non-overlapping randomly partitioned folds which are used as separate training and test datasets e.g., with k=3 folds, K-fold cross validation will generate 3 (training, test) dataset pairs, each of which uses 2/3 of the data for training and 1/3 for testing. Each fold is used as the test set exactly once  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.tuning.CrossValidator.html)|31, 33|
|DecisionTreeClassifier(featureCol='features', labelCol='label', maxDepth=5, maxBins=32, minInstancesPerNode=1, seed=None)|Decision tree learning algorithm for classification. It supports both binary and multiclass labels, as well as both continuous and categorical features.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.classification.DecisionTreeClassifier.html)|34, 35|
|LogisticRegression(featuresCol='features', labelCol='label', maxIter=100, regParam=0.0, elasticNetParam=0.0, standardization=True)|Logistic regression. This class supports multinomial logistic (softmax) and binomial logistic regression.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.classification.LogisticRegression.html)|25,26,32|
|MulticlassClassificationEvaluator(predictionCol='prediction',lablelCol='label', metricName='f1', probabilityCol='probability')|Evaluator for Multiclass Classification, which expects input columns: prediction, label, weight (optional) and probabilityCol (only for logLoss).  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.evaluation.MulticlassClassificationEvaluator.html)|25
|MulticlassMetrics(predictionAndLabels)|Evaluator for multiclass classification.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.mllib.evaluation.MulticlassMetrics.html)|29
|OneHotEncoder(inputCols=None, outputCols=None, handleInvalid='error', dropLast=True)|A one-hot encoder that maps a column of category indices to a column of binary vectors, with at most a single one-value per row that indicates the input category index. For example with 5 categories, an input value of 2.0 would map to an output vector of [0.0, 0.0, 1.0, 0.0]. The last category is not included by default (configurable via dropLast), because it makes the vector entries sum up to one, and hence linearly dependent. So an input value of 4.0 maps to [0.0, 0.0, 0.0, 0.0].  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.feature.OneHotEncoder.html)|27|
|RandomForestClassifier(featuresCol='features', labelCol='label', maxDepth=5, maxBins=32, minInstancesPerNode=1, numTrees=20, seed=None)|Random Forest learning algorithm for classification. It supports both binary and multiclass labels, as well as both continuous and categorical features.|36|
|Pipeline(stages=None)|A simple pipeline, which acts as an estimator. A Pipeline consists of a sequence of stages, each of which is either an Estimator or a Transformer.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.Pipeline.html)|28|
|StringIndexer(inputCol=None, outputCol=None, inputCols=None, outputCols=None, handleInvalid='error', stringOrderType='frequencyDesc')|A label indexer that maps a string column of labels to an ML column of label indices. If the input column is numeric, we cast it to string and index the string values. The indices are in [0, numLabels). By default, this is ordered by label frequencies so the most frequent label gets index 0. The ordering behavior is controlled by setting stringOrderType. Its default value is 'frequencyDesc'.  [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.feature.StringIndexer.html)|25, 27|
|VectorAssembler(inputCols=None, ouputCol=None, handleInvalid='error')| A feature transformer that merges multiple columns into a vector column. [doc](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.ml.feature.VectorAssembler.html)|25
