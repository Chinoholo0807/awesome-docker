#!/bin/sh

# create self-signed server certificate:

read -p "Enter your domain [www.example.com]: " DOMAIN

echo "Create server key..."

mkdir -p cert
# 使用 OpenSSL 生成一个 2048 位的带有密码保护的服务器密钥x.key
openssl genrsa -des3 -out cert/$DOMAIN.key 2048

echo "Create server certificate signing request..."
# 定义证书主题信息，包括国家、州、城市、组织和域名等
SUBJECT="/C=US/ST=Mars/L=iTranswarp/O=iTranswarp/OU=iTranswarp/CN=$DOMAIN"
# 使用服务器密钥生成证书签名请求x.csr
openssl req -new -subj $SUBJECT -key cert/$DOMAIN.key -out cert/$DOMAIN.csr

echo "Remove password..."
# 移除密钥文件的密码保护.
mv cert/$DOMAIN.key cert/$DOMAIN.origin.key
openssl rsa -in cert/$DOMAIN.origin.key -out cert/$DOMAIN.key

echo "Sign SSL certificate..."
# 使用证书签名请求x.csr和服务器密钥.key生成自签名的SSL证书x.crt
openssl x509 -req -days 3650 -in cert/$DOMAIN.csr -signkey  cert/$DOMAIN.key -out cert/$DOMAIN.crt

echo "TODO:"
echo "Copy $DOMAIN.crt to /etc/nginx/cert/$DOMAIN.crt"
echo "Copy $DOMAIN.key to /etc/nginx/cert/$DOMAIN.key"
echo "Add configuration in nginx:"
echo "server {"
echo "    ..."
echo "    listen 443 ssl;"
echo "    ssl_certificate     /etc/nginx/cert/$DOMAIN.crt;"
echo "    ssl_certificate_key /etc/nginx/cert/$DOMAIN.key;"
echo "    ssl_session_cache shared:SSL:1m;"
echo "    ssl_session_timeout 10m;"
echo "    ssl_ciphers HIGH:!aNULL:!MD5;"
echo "    ssl_prefer_server_ciphers on;"
echo "}"
