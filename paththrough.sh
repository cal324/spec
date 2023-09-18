
for i in aggregator fluentd-only fluentbit-only
do
  argo submit -p rate=500 -p limit_cpu=100m workflows/paththrough-${i}.yaml
done

