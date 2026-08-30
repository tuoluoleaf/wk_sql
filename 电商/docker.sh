
# nacos
# 默认nacos/nacos,登陆后修改默认密码
docker run --name nacos --restart=always \
-e MODE=standalone \
-e NACOS_AUTH_ENABLE=true \
-e NACOS_AUTH_TOKEN=SecretKey012345678901234567890123456789012345678901234567890123456789 \
-e NACOS_AUTH_IDENTITY_KEY=serverIdentity \
-e NACOS_AUTH_IDENTITY_VALUE=security \
-p 8848:8848 \
-p 9848:9848 \
-d nacos/nacos-server:v2.2.2


# redis
docker run --name redis -p 6379:6379 --restart=always -d redis \
redis-server --requirepass "leaf123" --bind 0.0.0.0