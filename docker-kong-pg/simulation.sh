#!/bin/bash

KONG_HOST=localhost

curl -i -X POST http://$KONG_HOST:8001/services \
  --data name=example_service \
  --data url='http://mockbin.org'


curl -i http://$KONG_HOST:8001/services/example_service


curl -i -X POST http://$KONG_HOST:8001/services/example_service/routes \
  --data 'paths[]=/mock' \
  --data name=mocking

curl http://$KONG_HOST:8000/mock