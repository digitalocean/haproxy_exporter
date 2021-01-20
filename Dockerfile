FROM golang:1.15.6-buster AS builder
ADD . /haproxy_exporter
WORKDIR /haproxy_exporter
RUN go build -o /bin/haproxy_exporter .

FROM debian:buster
COPY --from=builder /bin/haproxy_exporter /bin/haproxy_exporter
EXPOSE     9101
CMD [ "/bin/haproxy_exporter" ]
