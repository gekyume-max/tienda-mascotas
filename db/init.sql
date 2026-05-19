CREATE DATABASE IF NOT EXISTS tienda_perritos;
USE tienda_perritos;

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);


/*el profe*/
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Saco Alimento Premiun', 'Saco pollo para cachorros 15kg', 45990.00, 20),
('Bravery pollo Adulto raza pequena', 'Sabor a pollo', 25990.00, 20),
('Alimento Adulto Pedigree', 'Sabor carne', 15990.00, 40),
('Snacks Dentales', 'Ayuda a la limpieza dental', 5990.00, 30),
('Alimento Adulto Light', 'Control de peso, razas medianas', 17990.00, 8),
('Alimento Cachorro Premium', 'Sabor a pollo, razas pequenas', 19990.00, 15);
