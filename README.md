# 🐾 Tienda de Perritos 🐾

## Arquitectura de Contenedorización
Proyecto basado en microservicios utilizando **Docker** y **Multi-stage builds**.
- **Frontend:** Nginx Alpine (Optimizado para producción).
- **Backend:** Node.js Express.
- **DB:** MySQL 8.0 con persistencia mediante volúmenes.

## Pipeline CI/CD
El flujo de automatización se activa mediante la rama `deploy`:
1. `docker build`: Construcción de imagen.
2. `ECR Push`: Almacenamiento seguro en Amazon Elastic Container Registry.
3. `SSM Deploy`: Despliegue automático en instancias AWS EC2.

## Persistencia
Se utilizan **Named Volumes** en el servicio de base de datos para garantizar la continuidad operativa:
- `mysql_data:/var/lib/mysql`

## Requisitos
- AWS Academy
- AWS CLI

## Ejecución Local (Sin Docker Compose)
Para levantar el proyecto sin Docker Compose, ejecute los siguientes comandos en orden:

# 1. Red y Base de Datos
```bash
docker network create tienda-red
docker build -t tienda-db ./db
docker run -d --name db-perritos --network tienda-red -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 tienda-db
```

# 2. Backend (Lógica)
```bash
docker build -t tienda-backend ./backend
docker run -d --name back-perritos --network tienda-red -e DB_HOST=db-perritos -e DB_PASSWORD=root -p 3001:3001 tienda-backend
```

# 3. Frontend (Interfaz)
```bash
docker build -t tienda-frontend ./frontend
docker run -d --name front-perritos --network tienda-red -p 8080:80 tienda-frontend
```

## Acceso al Despliegue en AWS
- URL Frontend: http://NUEVA_IP:8080
- URL API (Backend): http://NUEVA_IP:3001/api/productos
