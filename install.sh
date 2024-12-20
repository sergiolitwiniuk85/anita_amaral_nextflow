#!/bin/bash

# Pull the Busco image
docker pull ezlabgva/busco:v5.8.2_cv1
docker tag ezlabgva/busco:v5.8.2_cv1 busco:latest


# Build the Docker Compose services
docker-compose build
