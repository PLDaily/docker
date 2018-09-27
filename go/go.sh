docker build -f ./Dockerfile -t go .
docker rm -f go
docker run -dt --name go go /bin/sh
docker exec -it go /bin/sh