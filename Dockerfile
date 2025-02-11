<<<<<<< Updated upstream
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
=======
# Use an official PHP runtime with Apache
FROM php:8.1-apache

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable mysqli

# Set working directory
WORKDIR /var/www/html/

# Copy application files to container
COPY . /var/www/html/

# Ensure proper permissions for Apache
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Enable Apache Rewrite Module (if needed for .htaccess support)
RUN a2enmod rewrite

# Expose port 8080 for Google Cloud Run
EXPOSE 8080

# Start Apache in the foreground
>>>>>>> Stashed changes
CMD ["apache2-foreground"]
