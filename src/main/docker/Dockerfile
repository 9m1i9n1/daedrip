FROM java:8
VOLUME /tmp
ADD p1-0.0.1-SNAPSHOT pilot.jar
RUN bash -c 'touch /pilot.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/pilot.jar"]
