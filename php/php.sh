docker build -f ./Dockerfile -t php .
docker rm -f php
docker run -dt --name php php /bin/sh
docker exec -it php /bin/sh