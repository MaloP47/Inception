FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    nginx openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/* \
    && openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=mpeulet.42.fr"

COPY conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
