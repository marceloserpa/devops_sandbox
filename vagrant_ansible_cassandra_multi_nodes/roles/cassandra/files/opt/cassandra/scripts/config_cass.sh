#!/bin/bash
seeds="172.17.177.101,172.17.177.102,172.17.177.103"
cluster_name='cassandra-multi-nodes'
endpoint_snitch="SimpleSnitch"

sed -i 's/cluster_name:.*/cluster_name: "'"$cluster_name"'"/g' /opt/cassandra/conf/cassandra.yaml

sed -i 's/- seeds:.*/- seeds:\"'$seeds'\"/g' /opt/cassandra/conf/cassandra.yaml

sed -i 's/endpoint_snitch:.*/endpoint_snitch: \"'$endpoint_snitch'\"/g' /opt/cassandra/conf/cassandra.yaml
