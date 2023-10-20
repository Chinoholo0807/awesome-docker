启动mailhog
```sh
mkdir -p ~/test-docker/mailhog \
&& cd ~/test-docker/mailhog \
&& mkdir -p maildir

docker build -t my-mailhog .

docker run -p 1025:1025 -p 8025:8025  \
--name my-mailhog-container \
--network=casdoor-network \
-e "MH_STORAGE=maildir" \
-v $(pwd)/maildir:/maildir \
-d mailhog/mailhog

docker-compose up
```