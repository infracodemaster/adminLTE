# Use official NGINX image
FROM nginx:alpine

# Remove default NGINX website
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website files into NGINX's default HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 (HTTP)
EXPOSE 80

# Start NGINX server (default CMD from base image)
