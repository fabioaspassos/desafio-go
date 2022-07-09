FROM golang:1.10-alpine as builder
WORKDIR /go/build
COPY main.go /go/src/
RUN  go build /go/src/main.go

FROM hello-world
WORKDIR /root/
COPY --from=builder /go/build/main .
CMD ["./main"]