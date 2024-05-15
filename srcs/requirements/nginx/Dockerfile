FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache nginx openssl \
    && mkdir -p /var/www/html \
	&& chown -R nginx:nginx /var/www/html \
	&& chmod -R 755 /var/www/html \
    && rm -rf /var/cache/apk/* \
    && rm /etc/nginx/http.d/default.conf \
    && openssl req -x509 -days 90 -nodes -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt -sha256 -subj \
    "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mpeulet.42.fr/UID=mpeulet" 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf 
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443/tcp

CMD ["nginx", "-g", "daemon off;"]
