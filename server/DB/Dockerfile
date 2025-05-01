FROM golang:latest AS build_environment

WORKDIR /app

COPY . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:latest

WORKDIR /app

COPY --from=build_environment /app/main /app/

CMD [ "./main" ]


