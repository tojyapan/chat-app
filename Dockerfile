FROM golang:latest as builder

WORKDIR /go/src/chat-app
COPY . .
RUN go get github.com/gorilla/websocket
RUN go build main.go

CMD ./main $PORT
