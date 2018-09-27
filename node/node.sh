docker build -f ./Dockerfile -t node .
docker rm -f node
docker run -dt --name node node /bin/sh
docker exec -it node /bin/sh