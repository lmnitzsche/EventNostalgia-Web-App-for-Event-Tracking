# Use an official PHP image as the base image
FROM php:8.1-apache

# Install PHP extensions (e.g., for MySQL)
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory to /var/www/html (default Apache folder)
WORKDIR /var/www/html

# Copy your project files into the container
COPY . .

# Expose port 8080 (default for Cloud Run)
EXPOSE 8080

# Start Apache server
CMD ["apache2-foreground"]
