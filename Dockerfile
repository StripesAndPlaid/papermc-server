FROM eclipse-temurin:21

# Define environment variables
ENV EULA=false
ENV UPDATE=false

# Install dependencies and add user
RUN apt update && apt install -y jq && \
    useradd -m -d /home/paper -s /bin/bash paper && \
    mkdir -p /home/paper/data /home/paper/scripts && \
    chown -R paper:paper /home/paper && \
    apt clean && rm -rf /var/lib/apt/lists/*

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
