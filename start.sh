#!/bin/sh
echo "🎈 Creating devops Image! 🎈"
docker build -t devops docker/.
echo "🚩 Starting docker ! 🚩"
cd docker
docker-compose up