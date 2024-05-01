FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache nginx openssl \
    && adduser -D inception \
    && mkdir -p /var/www/worpress/ \
    && chown -R inception:inception /var/lib/nginx \
    && chown -R inception:inception /var/log/nginx \
    && chown -R inception:inception /etc/nginx/ \
    && chown -R inception:inception /var/www/worpress/ \
	&& chown -R inception:inception /etc/ssl/ \
    && rm -rf /var/cache/apk/* \
    && openssl req -x509 -days 90 -nodes -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt -sha256 -subj \
    "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mpeulet.42.fr/UID=mpeulet" 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf 
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# USER inception

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
