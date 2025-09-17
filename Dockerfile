FROM golang:1.24-alpine AS build
WORKDIR /app
COPY . .
RUN go build -o app main.go

FROM alpine:3.19
WORKDIR /app
COPY --from=build /app/app .
EXPOSE 8080
CMD ["./app"]
