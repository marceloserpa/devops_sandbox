#Micrometer + Prometheus + Grafana

### Running Java application

build application and run 

```
./gradlew clean build
java -jar build/libs/micrometer_poc.jar
```

###Prometheus

Install Prometheus

```
https://github.com/prometheus/prometheus/releases/download/v2.11.0-rc.0/prometheus-2.11.0-rc.0.linux-amd64.tar.gz
tar -xzf prometheus-2.11.0-rc.0.linux-amd64.tar.gz
cd prometheus-2.11.0-rc.0.linux-amd64
```
Replace default prometheus.yml for prometheus.yml in this directory

Run Prometheus

```
./prometheus --config.file=prometheus.yml
```

###Grafana
Install Grafana

```
wget https://dl.grafana.com/oss/release/grafana-6.2.5.linux-amd64.tar.gz 
tar -xzvf grafana-6.2.5.linux-amd64.tar.gz
cd grafana-6.2.5/bin && ./grafana-server
```

Dashboard

```
sum(irate(metric_count_total{app="poc",instance="localhost:8080",job="app-poc"}[2m]))
```
