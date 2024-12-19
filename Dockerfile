FROM eclipse-temurin:21-jdk-alpine

# Define environment variables
ENV EULA=false
ENV UPDATE=false
ENV JAVA_RAM="2G"

# Install dependencies and add user
RUN apk update && apk add --no-cache curl jq udev && \
    adduser -D -h /home/paper paper && \
    mkdir -p /home/paper/data /home/paper/scripts && \
    chown -R paper:paper /home/paper

# Set working directory and switch user
WORKDIR /home/paper/data
USER paper

# Copy necessary files to the image
COPY --chown=paper:paper server-icon.png /home/paper/data/
COPY --chown=paper:paper scripts /home/paper/scripts/

# Specify volume mount points
VOLUME /home/paper/data

# Expose server port
EXPOSE 25565

# Run the server jar
ENTRYPOINT ["/home/paper/scripts/start"]
