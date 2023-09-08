# Stage 1: Build the Go binary
FROM golang:1.21-alpine AS build

# Install Git. Required for fetching the dependencies.
RUN apk add --no-cache git

ENV GOOS=linux
ENV GO111MODULE=on

# Set the Current Working Directory inside the container
WORKDIR /primitive

# Copy everything from the current directory to the Working Directory inside the container
COPY . .

# Install the primitive package
RUN go install github.com/bclews/primitive@latest

# Stage 2: Create a lightweight image with the Go binary
FROM alpine:3.18

# Copy the Go binary from the builder stage
COPY --from=build /go/bin/primitive /usr/bin/primitive

VOLUME /primitive
WORKDIR /primitive

# Set the entrypoint to the Go binary
ENTRYPOINT [ "primitive" ]
CMD [ "--help" ]