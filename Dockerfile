FROM ubuntu:latest AS builder
RUN apt update && apt install -y bash
WORKDIR /app
COPY app.sh .
RUN chmod +x app.sh

FROM ubuntu:latest
COPY --from=builder /app/app.sh .
HEALTHCHECK CMD echo "healthy"
ENTRYPOINT ["./app.sh"]
