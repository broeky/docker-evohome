FROM alpine:3.12 as gitty
LABEL stage=gitty
RUN apk update && \
    apk add --update git
#RUN git clone https://github.com/watchforstock/evohome-client.git
RUN git clone https://github.com/Hout/evohome-client.git

FROM python:3-alpine3.12
COPY --from=gitty evohome-client/ /evohome-client/
RUN pip3 install ./evohome-client influxdb
COPY evohome.py /tmp/
CMD ["python", "/tmp/evohome.py"]
