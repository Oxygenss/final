FROM golang:1.23.2

WORKDIR /app

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./
COPY tracker.db ./

RUN go build -o /my_app

CMD ["/my_app"]