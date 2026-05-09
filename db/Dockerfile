FROM mysql:8.0
# Solo copiamos el init para que se ejecute al arrancar
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306