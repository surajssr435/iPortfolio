FROM ubuntu:latest

# Install NGINX and clean up APT cache
RUN apt-get update -y && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove default HTML content
RUN rm -rf /var/www/html/*

# Copy local content into NGINX web root
COPY . /var/www/html/

# Expose port 80
EXPOSE 80

# Start NGINX in foreground
CMD ["nginx", "-g", "daemon off;"]

