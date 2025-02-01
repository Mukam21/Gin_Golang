FROM golang:latest

LABEL maintainer="Quigue <usmanowmukam2003@gmail.com>"

WORKDIR /app

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

ENV PORT 5000

RUN go build -o golang-gin-poc .

RUN find . -name "*.go" -type f -delete 

EXPOSE $PORT

CMD ["./golang-gin-poc"]