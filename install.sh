#!/bin/bash

# Pull the Busco image
docker pull ezlabgva/busco:v5.8.2_cv1
docker tag ezlabgva/busco:v5.8.2_cv1 busco:latest

docker pull ncbi/pgap-dev:2024-12-19.build5922
docker tag ncbi/pgap-dev:2024-12-19.build5922 pgap:latest

# Build the Docker Compose services
docker-compose build



#download pgap
curl -OL https://raw.githubusercontent.com/ncbi/pgap/refs/heads/master/scripts/pgap.py && chmod u+x pgap.py && ./pgap.py --update
