SELECT * FROM usuarios;
SELECT * FROM roles;
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);
SET FOREIGN_KEY_CHECKS=0;
SELECT usuarios.id, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol;
/*"Relación tipo 1:N (Uno a varios)"*/

CREATE TABLE categorias (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(100) NOT NULL );
SELECT * FROM categorias;
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');
ALTER TABLE usuarios ADD COLUMN id_categoria INT;
UPDATE usuarios SET id_categoria = 1 WHERE id IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id IN (2,20);
UPDATE usuarios SET id_categoria = 3 WHERE id IN (3, 14);
UPDATE usuarios SET id_categoria = 4 WHERE id IN (4);
UPDATE usuarios SET id_categoria = 5 WHERE id IN (6,15);
UPDATE usuarios SET id_categoria = 6 WHERE id IN (7,18);
UPDATE usuarios SET id_categoria = 7 WHERE id IN (8,16);
UPDATE usuarios SET id_categoria = 8 WHERE id IN (10);
UPDATE usuarios SET id_categoria = 9 WHERE id IN (11,19);
UPDATE usuarios SET id_categoria = 10 WHERE id IN (12);

SELECT usuarios.id, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, categorias.nombre_categoria
FROM usuarios
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;

/*"Relación tipo N:M (muchos a muchos)"*/

CREATE TABLE usuarios_categorias (
	id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT, 
    id_categoria INT);
SELECT * FROM usuarios_categorias;
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

SELECT categorias.id_categoria, categorias.nombre_categoria
FROM categorias
JOIN usuarios_categorias ON categorias.id_categoria = usuarios_categorias.id_categoria;