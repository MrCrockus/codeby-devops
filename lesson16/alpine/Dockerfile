FROM alpine:latest

# Установка nginx
RUN apk update
RUN apk add nginx
 
RUN mkdir -p /opt/www

# index.html
WORKDIR /opt/www
COPY ./index.html .

# Создать конфиг nginx 
RUN mkdir -p /etc/nginx/conf.d
COPY ./nginx.conf /etc/nginx/nginx.conf

# открыть 80 порт
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
