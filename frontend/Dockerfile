# Stage 1: Build
FROM alpine AS build
WORKDIR /app
COPY . .

# Stage 2: Production con Nginx
FROM nginx:alpine
# Copiamos todo el contenido (HTML, JS)
COPY --from=build /app /usr/share/nginx/html

# ¡ESTA LÍNEA ES LA CLAVE! Quítale el #
COPY --from=build /app/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]