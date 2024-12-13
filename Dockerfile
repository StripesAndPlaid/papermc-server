FROM openjdk:21
WORKDIR /minecraft
ADD https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/132/downloads/paper-1.21.1-132.jar paperclip.jar
RUN echo "eula=true" > eula.txt
EXPOSE 25565
ENTRYPOINT [ "java" ]
CMD [ "-Xms2G", "-Xmx2G", "-XX:+AlwaysPreTouch", "-XX:+DisableExplicitGC", "-XX:+ParallelRefProcEnabled", "-XX:+PerfDisableSharedMem", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=8M", "-XX:G1HeapWastePercent=5", "-XX:G1MaxNewSizePercent=40", "-XX:G1MixedGCCountTarget=4", "-XX:G1MixedGCLiveThresholdPercent=90", "-XX:G1NewSizePercent=30", "-XX:G1RSetUpdatingPauseTimePercent=5", "-XX:G1ReservePercent=20", "-XX:InitiatingHeapOccupancyPercent=15", "-XX:MaxGCPauseMillis=200", "-XX:MaxTenuringThreshold=1", "-XX:SurvivorRatio=32", "-Dusing.aikars.flags=https://mcflags.emc.gs", "-Daikars.new.flags=true", "-jar", "paperclip.jar", "nogui" ]
