FROM folioorg/okapi:2.22.0

CMD killall -9 java

###### copy config files ######
COPY okapi-json-config okapi-json-config

USER root

WORKDIR /usr/verticles
COPY start.sh /usr/verticles
RUN chmod 755 /usr/verticles/start.sh

ENTRYPOINT ["./start.sh"] 

EXPOSE 9130
