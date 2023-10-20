FROM mysql:5.7
LABEL maintainer="haiwu likamylike@gmail.com"
# 设置时区为北京时间
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
# 定义环境变量
ENV MYSQL_ROOT_PASSWORD=test_mysql_password
# 复制配置文件到容器中
COPY ./conf/my.cnf /etc/mysql/conf.d/my.cnf
# 定义数据卷
VOLUME /var/log/mysql /var/lib/mysql
# 暴露端口
EXPOSE 3306