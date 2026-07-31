

# 列出examples目錄
kubectl exec -ti -n default spark-worker-0 -- \
find examples -type f


# 提交作業至 Master
export EXAMPLE_JAR=$(kubectl exec -ti --namespace default spark-worker-0 -- find examples/jars/ -name 'spark-example*\.jar' | tr -d '\r')

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.SparkPi \
  $EXAMPLE_JAR 5



# 透過隨機點的分散式計算來估算圓周率 ($\pi$)。這是最經典的輕量級測試任務
export EXAMPLE_JAR=$(kubectl exec -ti --namespace default spark-worker-0 -- find examples/jars/ -name 'spark-example*\.jar' | tr -d '\r')

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.SparkPi \
  $EXAMPLE_JAR 10 2>&1 | grep "Pi is roughly"



# 執行邏輯斯迴歸（Logistic Regression）機器學習演算法進行多次迭代Iterations測試 Worker 之間的記憶體快取與資料洗牌（Shuffle）效能
kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp \
  --class org.apache.spark.examples.SparkLR \
  $EXAMPLE_JAR 10


# Spark 內建的範例讀取文字檔並進行單字計數（Word Count）。此處直接將 Spark 官方 README 檔案作為資料源進行分散式文本解析

kubectl apply -f spark-manifest-fix.yaml

kubectl rollout status statefulset/spark-master
kubectl rollout status statefulset/spark-worker

kubectl exec -ti --namespace default spark-worker-0 -- spark-submit \
  --master spark://spark-master-svc:7077 \
  --conf spark.jars.ivy=/tmp/.ivy2 \
  --conf spark.executor.instances=1 \
  --class org.apache.spark.examples.JavaWordCount \
  $EXAMPLE_JAR /opt/bitnami/spark/README.md
(報錯...)



# 查看 Spark 版本

kubectl exec -ti -n default spark-worker-0 -- spark-submit --version

kubectl exec -ti -n default spark-worker-0 -- \
cat $SPARK_HOME/RELEASE

