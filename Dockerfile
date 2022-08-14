FROM golang:latest as builder
RUN mkdir /build
WORKDIR /build
COPY ./ ./
RUN go build

FROM ubuntu:latest
COPY --from=builder /build/hellogo .
ENTRYPOINT [ "./hellogo" ]
