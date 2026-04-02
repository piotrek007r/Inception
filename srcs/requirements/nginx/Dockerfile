FROM alpine:3.18

# Install nginx + openssl
RUN apk add --no-cache nginx openssl

# Create required directories
RUN mkdir -p /var/www/html \
    && mkdir -p /etc/nginx/ssl

# Generate self-signed TLS certificate
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=PL/ST=Poland/L=Warsaw/O=42/OU=Inception/CN=pruszkie.42.fr"

# Copy nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]