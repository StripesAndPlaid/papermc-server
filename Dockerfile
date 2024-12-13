FROM openjdk:21

# Add necessary files to image
WORKDIR /minecraft/data
ADD https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/132/downloads/paper-1.21.1-132.jar paperclip.jar
COPY server-icon.png /minecraft/data
RUN echo "eula=true" > eula.txt

# Add and switch to minecraft user
RUN useradd minecraft
RUN chown -R minecraft /minecraft/data
USER minecraft

# Specify volume mount
VOLUME /minecraft/data

# Expose server port
EXPOSE 25565

# Run the server jar
ENTRYPOINT [ "java" ]
CMD [ "-Xms2G", "-Xmx2G", "-XX:+AlwaysPreTouch", "-XX:+DisableExplicitGC", "-XX:+ParallelRefProcEnabled", "-XX:+PerfDisableSharedMem", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=8M", "-XX:G1HeapWastePercent=5", "-XX:G1MaxNewSizePercent=40", "-XX:G1MixedGCCountTarget=4", "-XX:G1MixedGCLiveThresholdPercent=90", "-XX:G1NewSizePercent=30", "-XX:G1RSetUpdatingPauseTimePercent=5", "-XX:G1ReservePercent=20", "-XX:InitiatingHeapOccupancyPercent=15", "-XX:MaxGCPauseMillis=200", "-XX:MaxTenuringThreshold=1", "-XX:SurvivorRatio=32", "-Dusing.aikars.flags=https://mcflags.emc.gs", "-Daikars.new.flags=true", "-jar", "paperclip.jar", "nogui" ]
