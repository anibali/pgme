FROM golang:1.9 as builder
COPY ./ ./
RUN make build
RUN pwd && ls -lah

FROM nvidia/cuda:9.1-base-ubuntu16.04
COPY --from=builder /go/pgme /
COPY --from=builder /go/template /template
CMD ["/pgme"]
