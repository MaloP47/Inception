FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache nginx openssl \
    && openssl req -x509 -days 90 -nodes -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=mpeulet.42.fr" \
     && rm -rf /var/cache/apk/*

# EXPOSE ${NGINX_PORT}

# COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# CMD ["nginx", "-g", "daemon off;"]
