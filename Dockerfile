#
# builder image
#
FROM golang:1.19-buster as builder
RUN mkdir /build
ADD ./ /build/
WORKDIR /build

ARG OWNER=sadok-f
ARG PROJECT=searchstax-mock-api

# accept override of value from --build-args
ARG MY_VERSION=0.0.1
ARG MY_BUILTBY=unknown

# create module, fetch dependencies, then build
RUN CGO_ENABLED=0 GOOS=linux go build searchstax-mock-api.go


#
# generate small final image for end users
#
FROM alpine:3.18

# copy golang binary into container
WORKDIR /root
COPY --from=builder /build/searchstax-mock-api .
RUN mkdir -p /root/ssx/
ADD ./ssx/* /root/ssx/

# executable
ENTRYPOINT [ "./searchstax-mock-api" ]