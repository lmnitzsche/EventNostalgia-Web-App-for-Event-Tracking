# Use an official PHP image as the base image
FROM php:8.1-apache

# Install PHP extensions (e.g., for MySQL)
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the Apache listen port to 8080 (instead of the default 80)
RUN echo "Listen 8080" >> /etc/apache2/ports.conf

# Configure Apache to accept connections on port 8080
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf

# Set working directory to /var/www/html (default Apache folder)
WORKDIR /var/www/html

# Copy your project files into the container
COPY . .

# Expose port 8080 (default for Cloud Run)
EXPOSE 8080

# Start Apache server
CMD ["apache2-foreground"]
