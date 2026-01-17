FROM ubuntu:latest AS builder
RUN apt update && apt install -y bash
WORKDIR /app
COPY app.sh .
RUN chmod +x app.sh

FROM ubuntu:latest
COPY --from=builder /app/app.sh .
HEALTHCHECK CMD test -f /app/app.sh || exit 1
ENTRYPOINT ["./app.sh"]
ENV APP_ENV=production

