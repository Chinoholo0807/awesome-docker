
```sh
docker run -p 3306:3306 --privileged=true \
--name my-mysql-container \
--network casdoor-network \
-v $(pwd)/log:/var/log/mysql \
-v $(pwd)/data:/var/lib/mysql \
-v $(pwd)/conf:/etc/mysql/conf.d \
-d my-mysql

```