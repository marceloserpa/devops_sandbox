# Kafka 4.0

Start Kafka broker

```
docker-compose up -d
```


Access container terminal

```
docker exec --workdir /opt/kafka/bin/ -it broker sh
```

Create a new topic

```
./kafka-topics.sh --bootstrap-server localhost:9092 --create --topic test-topic

./kafka-topics.sh --bootstrap-server localhost:9092 --list
```