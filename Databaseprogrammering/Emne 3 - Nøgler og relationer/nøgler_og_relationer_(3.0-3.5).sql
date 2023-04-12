-- Opgave 3.0
--alter database schoolLibrary set single_user with rollback immediate

USE master
DROP DATABASE IF EXISTS schoolLibrary;
CREATE DATABASE schoolLibrary
GO

use schoolLibrary

--Forfattere
CREATE TABLE authors (
  authorId INT IDENTITY(1,1),
  firstname VARCHAR(32) NOT NULL,
  lastname VARCHAR(32) NOT NULL,
  PRIMARY KEY(authorId)
)
--Udgivere
CREATE TABLE publishers(
  publisherId INT IDENTITY(1,1),
  name VARCHAR(32) NOT NULL,
  PRIMARY KEY(publisherId)
)
--Bøger
CREATE TABLE books (
  bookId INT IDENTITY(1000,1),
  name VARCHAR(32) NOT NULL,
  ISBN CHAR(17) NOT NULL,
  pages INT PRIMARY KEY(bookId)
)
--Hold
CREATE TABLE classes(
  classname CHAR(10) NOT NULL,
  PRIMARY KEY(classname)
)
--Elever
CREATE TABLE students(
  studentId INT IDENTITY(1,1),
  firstname VARCHAR(32),
  lastname VARCHAR(32) NOT NULL,
  PRIMARY KEY(studentId)
)

-- Opgave 3.1
ALTER TABLE books ADD authorId INT NOT NULL
ALTER TABLE books ADD publisherId INT NOT NULL
ALTER TABLE students ADD classname INT NOT NULL
ALTER TABLE books ADD cprnummer CHAR(17) NOT NULL
ALTER TABLE books ADD CONSTRAINT ISBN UNIQUE(cprnummer)

-- Opgave 3.2
INSERT INTO authors (firstname, lastname) VALUES ('Karl', 'Smart'), ('Anders', 'Sand')
INSERT INTO publishers (name) VALUES ('Voldum Tidende'), ('Købengård')
INSERT INTO books (name, cprnummer, ISBN, authorId, publisherId, pages) VALUES ('C# For Dåmmies', '912-23-45688-06-5', '912-23-45688-06-5', 2, 2, 312), ('Ssssstart med Python', '912-43-79312-65-1', '912-43-79312-65-1', 1, 1, 323), ('Okker gokker gummi docker', '211-41-91357-11-8', '912-43-79312-65-1', 1, 1, 432), ('Dejlige databasser', '851-77-96132-16-7', '851-77-96132-16-7', 2, 1, 592)
INSERT INTO classes VALUES ('h1pd011122'), ('h2pd021122'), ('h1pd081122'), ('h2pd081122')
INSERT INTO students VALUES ('Konrad', 'Sommer', 1), ('Anne', 'Dam', 1), ('Ejvind', 'Møller', 1), ('Steen', 'Isaksen', 1), ('Remo', 'Lademann', 3), ('Ella', 'Fanth', 3), ('Ella', 'Stick', 2), ('Randi', 'Vejen', 2), ('Anne', 'Mad', 2), ('Bent', 'Ower', 2)

-- Opgave 3.3
CREATE TABLE borrows 
(
	borrowId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	bookId INT NOT NULL FOREIGN KEY REFERENCES books(bookId),
	studentId INT NOT NULL,
	taken DATETIME DEFAULT GETDATE(), 
	brought DATETIME
)

-- Opave 3.4
INSERT INTO borrows (bookId, studentId) VALUES (1000, 1), (1003, 8)

-- Opgave 3.5
ALTER TABLE books ADD FOREIGN KEY (authorId) REFERENCES authors(authorId)
ALTER TABLE books ADD FOREIGN KEY (publisherId) REFERENCES publishers(publisherId)