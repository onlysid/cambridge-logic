FROM php:8.3-fpm

# Install nginx
RUN apt-get update && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY . .

# Copy nginx config
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 8080

CMD service nginx start && php-fpm
