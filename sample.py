from pyspark.sql import SparkSession
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.regression import DecisionTreeRegressor
from pyspark.ml import Pipeline
from pyspark.ml.evaluation import RegressionEvaluator

spark = SparkSession.builder.appName("a4").getOrCreate()

import logging
logger = spark._jvm.org.apache.log4j
logger.LogManager.getLogger("org").setLevel(logger.Level.WARN)
logger.LogManager.getLogger("akka").setLevel(logger.Level.WARN)

df = spark.read.csv("2019-01-h1.csv", header=True, inferSchema=True)
selected_df = df.select("passenger_count", "PULocationID", "DOLocationID", "total_amount")


print("First 10 rows of the dataset:")
selected_df.show(10)

trainDF, testDF = selected_df.randomSplit([0.8, 0.2], seed =42)

assembler = VectorAssembler(
	inputCols = ["passenger_count", "PULocationID", "DOLocationID"],
	outputCol="features"
)

regressor = DecisionTreeRegressor(
	featuresCol = "features",
	labelCol = "total_amount"
).setMaxBins(500)

pipeline = Pipeline(stages=[assembler, regressor])

model = pipeline.fit(trainDF)

predictions = model.transform(testDF)

print("First 10 predictions:")
predictions.select("passenger_count", "PULocationID", "DOLocationID", "prediction").show(10)

evaluator = RegressionEvaluator(
	labelCol = "total_amount",
	predictionCol = "prediction",
	metricName = "rmse"
)
rmse = evaluator.evaluate(predictions)

print ("RMSE:")
