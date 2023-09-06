FROM golang:1.19

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

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the primitive command when the Docker container starts
ENTRYPOINT ["primitive"]
