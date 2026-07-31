

# 1. SparkPi

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.SparkPi \
  $EXAMPLE_JAR \
  10



# 2. JavaWordCound

kubectl exec -ti --namespace default spark-worker-0 -- \
sh -c 'cat >/tmp/words.txt <<EOF
hello spark
hello kubernetes
hello spark
spark spark
EOF'

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.JavaWordCount \
  $EXAMPLE_JAR \
  /tmp/words.txt



# 5. SparkSQL

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.sql.SparkSQLExample \
  $EXAMPLE_JAR


# 6. JavaSpqrkSQL

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.sql.JavaSparkSQLExample \
  $EXAMPLE_JAR


# 7. JavaSQLDataSource

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.sql.JavaSQLDataSourceExample \
  $EXAMPLE_JAR


# 8. Java DataFrame

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.sql.JavaSparkSQLExample \
  $EXAMPLE_JAR


# 10. Java RandomForestClassifier

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.ml.JavaRandomForestClassifierExample \
  $EXAMPLE_JAR



# 13. JavaLinearRegression

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.sql.JavaSparkSQLExample \
  $EXAMPLE_JAR










