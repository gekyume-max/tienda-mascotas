# Stage 1: Build (Opcional si solo es HTML, pero cumple la estructura)
FROM alpine AS build
WORKDIR /app
COPY . .

# Stage 2: Production con Nginx
FROM nginx:alpine
COPY --from=build /app /usr/share/nginx/html
# Si tienes un default.conf, descomenta la línea de abajo:
# COPY --from=build /app/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]