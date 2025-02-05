# Use an official PHP runtime
FROM php:8.1-apache

# Install MySQLi extension
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable MySQLi extension
RUN docker-php-ext-enable mysqli

# Copy your application files
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Start Apache
CMD ["apache2-foreground"]
