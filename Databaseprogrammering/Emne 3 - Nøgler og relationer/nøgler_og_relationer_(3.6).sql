-- Opgave 1.0
USE master
DROP DATABASE IF EXISTS dinDatabase
CREATE DATABASE dinDatabase
GO

use dinDatabase

-- Opgave 1.1
CREATE TABLE groups
(
	groupId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(32),
	rightsLevel INT NOT NULL CHECK (rightsLevel <= 5)
)

-- Opgave 1.2
CREATE TABLE users
(
	userId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	groupId INT NOT NULL FOREIGN KEY REFERENCES groups(groupId),
	username VARCHAR(16) NOT NULL,
	password CHAR(32),
	created DATETIME DEFAULT GETDATE(),
	lastLogin DATETIME
)

-- Opgave 1.3
CREATE TABLE locations
(
	roomNumber CHAR(5) NOT NULL UNIQUE,
	hasWhitebord BIT NOT NULL,
	hasProjector BIT NOT NULL,
	seats INT NOT NULL CHECK (seats <= 1000),
	maxApproved INT NOT NULL CHECK (maxApproved <= 2000)
)

-- Opgave 1.4
CREATE TABLE bookings
(
	reservationId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	userId INT NOT NULL FOREIGN KEY REFERENCES users(userId),
	roomNumber CHAR(5) NOT NULL FOREIGN KEY REFERENCES locations(roomNumber),
	bookedFrom DATETIME NOT NULL,
	bookedTo DATETIME NOT NULL,
)

-- Opgave 2.1
INSERT INTO groups VALUES ('superadministratorgruppe', 5), ('administratorer', 4), ('moderatorer', 3), ('users', 2), ('guests', 1)
INSERT INTO users (groupId, username, password) VALUES (5, 'annedam', '64ebadf0913e2dce4ef461006d2bf14b'), (5, 'konradsommer', 'abe45d28281cfa2a4201c9b90a143095'), (4, 'steensecher', '5ebe2294ecd0e0f08eab7690d2a6ee69')
INSERT INTO users (groupId, username) VALUES (3, 'ella_fanth'), (3, 'remo_lademann'), (3, 'lykkejuul'), (1, 'steen_isaksen'), (1, 'anders_sand'), (1, 'ella_stick') 

-- Opgave 2.2
DELETE FROM users WHERE groupId = 5

-- Opgave 2.3
UPDATE users SET lastLogin='2022-08-11 12:00:00'
UPDATE users SET groupId=2 WHERE groupId=1

-- Opgave 3.6
CREATE TABLE conference
(
	conferenceId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	creator TEXT NOT NULL,
	startDate DATETIME NOT NULL,
	endDate DATETIME NOT NULL,
	roomNumber CHAR(5) NOT NULL FOREIGN KEY REFERENCES locations(roomNumber),
	description TEXT,
	category TEXT NOT NULL,
)