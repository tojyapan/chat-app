FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /go/src/chat-app
COPY . .


RUN go get github.com/gorilla/websocket
RUN go build main.go

FROM alpine
COPY --from=builder /go/src/chat-app /app

CMD /app/main $PORT
