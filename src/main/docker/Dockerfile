FROM java:8
VOLUME /tmp
ADD ../p1-0.0.1-SNAPSHOT.war pilot.war
RUN bash -c 'touch /pilot.war'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/pilot.war"]
