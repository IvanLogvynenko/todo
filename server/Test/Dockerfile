FROM golang:latest

WORKDIR /app

COPY ./go.mod main.go structs/* /app/

RUN go build -o main .

RUN main

