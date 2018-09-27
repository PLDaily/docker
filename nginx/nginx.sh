docker build -f ./Dockerfile -t nginx .
docker rm -f nginx

ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)

docker run --name nginx \
-v "$(pwd)"/.nginx:/etc/nginx/conf.d \
-v "$(pwd)"/logs:/logs \
--add-host="host:${ip}" \
-p 80:80 \
-d nginx