# Use the official MongoDB image as the base
FROM mongo:latest

# Set environment variables for MongoDB
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=mikocheni92

# Expose the default MongoDB port
EXPOSE 27017

# Create a directory for MongoDB data
RUN mkdir -p /data/db

# Copy initialization script for replica set
COPY replica-set-init.js /docker-entrypoint-initdb.d/

RUN chmod 400 replica.key

# Set the command to enable replica set
CMD ["mongod", "--replSet", "rs0", "--keyFile", "replica.key", "--bind_ip_all"]
