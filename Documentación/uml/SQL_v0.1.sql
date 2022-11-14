CREATE DATABASE  IF NOT EXISTS `trueque`;
USE `trueque`;

DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS usuario_roles;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS comentario;
DROP TABLE IF EXISTS carrito;
DROP TABLE IF EXISTS orden;
DROP TABLE IF EXISTS datos_envio;


CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
nombre_usuario VARCHAR(100) NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
esta_activo BOOL NOT NULL,
fecha_creacion TIMESTAMP NOT NULL,
modificado_dia TIMESTAMP NOT NULL);

CREATE TABLE roles (
id INT PRIMARY KEY NOT NULL,
nombre VARCHAR(100) NOT NULL UNIQUE);

CREATE TABLE usuario_roles (
usuario_id INT NOT NULL,
role_id INT NOT NULL);

CREATE TABLE producto (
id INT PRIMARY KEY NOT NULL UNIQUE,
usuario_id VARCHAR(100) NOT NULL,
categoria INT NOT NULL,
vendido BOOL NOT NULL,
nombre VARCHAR(255) NOT NULL,
descripcion TEXT(1000) NOT NULL,
dia_creacion TIMESTAMP NOT NULL,
dia_modificacion TIMESTAMP NOT NULL,
cantidad INT NOT NULL);

CREATE TABLE categoria (
id INT PRIMARY KEY NOT NULL,
nombre VARCHAR NOT NULL UNIQUE);

CREATE TABLE comentario (
id INT PRIMARY KEY NOT NULL,
usuario_id VARCHAR(100) NOT NULL,
producto_id INT NOT NULL,
titulo VARCHAR(100) NOT NULL,
descripcion TEXT(1000) NOT NULL,
dia_creacion TIMESTAMP NOT NULL,
dia_modificacion TIMESTAMP NOT NULL,
es_valido BOOL NOT NULL);

CREATE TABLE carrito (
id INT PRIMARY KEY NOT NULL UNIQUE,
producto_id INT NOT NULL,
usuario_id INT NOT NULL,
cantidad INT NOT NULL);

CREATE TABLE orden (
id INT PRIMARY KEY NOT NULL UNIQUE,
usuario_id INT NOT NULL,
envio_id INT NOT NULL,
fecha_creado TIMESTAMP NOT NULL);

CREATE TABLE datos_envio (
id INT PRIMARY KEY NOT NULL UNIQUE,
usuario_id INT NOT NULL,
provincia VARCHAR(50) NOT NULL,
ciudad VARCHAR(100) NOT NULL,
codigo_postal INT NOT NULL,
direccion VARCHAR(150) NOT NULL);

ALTER TABLE usuario_roles ADD CONSTRAINT usuario_roles_usuario_id_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id);
ALTER TABLE usuario_roles ADD CONSTRAINT usuario_roles_role_id_roles_id FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE producto ADD CONSTRAINT producto_usuario_id_usuario_nombre_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(nombre_usuario);
ALTER TABLE producto ADD CONSTRAINT producto_categoria_categoria_id FOREIGN KEY (categoria) REFERENCES categoria(id);
ALTER TABLE comentario ADD CONSTRAINT comentario_usuario_id_usuario_nombre_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(nombre_usuario);
ALTER TABLE comentario ADD CONSTRAINT comentario_producto_id_producto_id FOREIGN KEY (producto_id) REFERENCES producto(id);
ALTER TABLE carrito ADD CONSTRAINT carrito_producto_id_producto_id FOREIGN KEY (producto_id) REFERENCES producto(id);
ALTER TABLE carrito ADD CONSTRAINT carrito_usuario_id_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id);
ALTER TABLE orden ADD CONSTRAINT orden_usuario_id_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id);
ALTER TABLE orden ADD CONSTRAINT orden_envio_id_datos_envio_id FOREIGN KEY (envio_id) REFERENCES datos_envio(id);
ALTER TABLE datos_envio ADD CONSTRAINT datos_envio_usuario_id_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id);
