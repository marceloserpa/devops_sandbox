#!/bin/bash

LISTEN_ADDRESS=$1

sed -i "s/listen_address:.*/listen_address: $LISTEN_ADDRESS/g" /opt/cassandra/conf/cassandra.yaml
