# Stage 1: Build the Go binary
FROM golang:1.19 AS builder

# Add Maintainer Info
LABEL maintainer="Ben Clews <bennett.clews@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Set the GOPATH environment variable
ENV GOPATH /go

# Add the go bin directory to the PATH
ENV PATH $GOPATH/bin:$PATH

# Copy everything from the current directory to the Working Directory inside the container
COPY . .

# Install the primitive package
RUN go install github.com/bclews/primitive@latest

# Stage 2: Create a lightweight image with the Go binary
FROM alpine:latest

# Copy the Go binary from the builder stage
COPY --from=builder /go/bin/primitive /usr/local/bin/primitive

# Install any necessary dependencies
RUN apk add --no-cache ca-certificates

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Set the entrypoint to the Go binary
ENTRYPOINT ["primitive"]
