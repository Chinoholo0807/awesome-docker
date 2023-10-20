


# nginx
docker run -p 80:80 -p 443:443 --privileged=true \
--name my-nginx-container \
-d nginx

docker cp my-nginx-container:/etc/nginx/conf.d $(pwd)
docker cp my-nginx-container:/etc/nginx/nginx.conf $(pwd)
docker cp my-nginx-container:/usr/share/nginx/html $(pwd)
mdkir logs
mkdir cert

docker run  -p 80:80 -p 443:443 --restart=always \
--name my-nginx-container \
--network casdoor-network \
-v $(pwd)/conf.d:/etc/nginx/conf.d \
-v $(pwd)/html:/usr/share/nginx/html \
-v $(pwd)/logs:/var/log/nginx \
-v $(pwd)/nginx.conf:/etc/nginx/nginx.cof \
-v $(pwd)/cert:/etc/nginx/cert \
-d  nginx






