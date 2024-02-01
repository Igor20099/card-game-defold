# Этап 1: Сборка приложения
FROM node:20-alpine AS builder
WORKDIR /app
COPY . .

FROM nginx:latest AS prod
COPY --from=builder /app/ /usr/share/nginx/html
COPY nginx/conf.d/frontend.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ENTRYPOINT nginx -g "daemon off;"
