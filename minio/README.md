
```sh
mkdir -p ~/test-docker/minio \
&& cd ~/test-docker/minio \
&& mkdir -p config\
&& mkdir -p data

docker run -p 9000:9000 -p 9090:9090 \
--network=casdoor-network \
--name my-minio-container \
-d --restart=always \
-e "MINIO_ACCESS_KEY=minioadmin" \
-e "MINIO_SECRET_KEY=minioadmin" \
-v ./data:/data \
-v ./config:/root/.minio \
minio/minio server \
/data --console-address ":9090" -address ":9000"

docker-compose up
```
