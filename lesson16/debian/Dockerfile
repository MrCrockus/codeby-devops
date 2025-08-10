FROM debian:11

# Установка nginx
RUN apt-get update
RUN apt-get install nginx -y
 
RUN mkdir -p /opt/www

# index.html
WORKDIR /opt/www
COPY ./index.html .

# Создать конфиг nginx 
RUN mkdir -p /etc/nginx/conf.d
COPY ./nginx.conf /etc/nginx/nginx.conf

# открыть 80 порт
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
