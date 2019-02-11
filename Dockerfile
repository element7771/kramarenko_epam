# Set the base image to java8
FROM openjdk:8-alpine

# File Author / Maintainer
MAINTAINER Kramarenko EPAM

# Create directory
RUN mkdir -p /app

# Set default directory
WORKDIR /app

# Copy notepad jar file
COPY target/*.war app.war

# Add initialization script
ADD entrypoint.sh entrypoint.sh

# Give permissions
RUN chmod 755 entrypoint.sh

# Expose default servlet container port
EXPOSE 8080

# Main command
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
