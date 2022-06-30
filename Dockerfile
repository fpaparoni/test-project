FROM openjdk:11-jre-slim
EXPOSE 8080
EXPOSE 9080
COPY target/*.jar ./test.jar
CMD java -Djava.awt.headless=true \
		 -server \
		 -Dcom.sun.management.jmxremote \
		 -Dcom.sun.management.jmxremote.port=9080 \
		 -Dcom.sun.management.jmxremote.local.only=false \
		 -Dcom.sun.management.jmxremote.authenticate=false \
		 -Dcom.sun.management.jmxremote.ssl=false \
		 -XshowSettings:vm \
		 -XX:+PrintFlagsFinal \
		 -XX:+StartAttachListener \
		 -jar -Dspring.profiles.active=docker test.jar
