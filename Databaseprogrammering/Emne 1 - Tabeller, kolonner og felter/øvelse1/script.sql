CREATE TABLE users (userId INTEGER PRIMARY KEY AUTOINCREMENT, 
                    groupId INTEGER NOT NULL,
                    username VARCHAR(16),
                    password CHAR(32),
                    created TIMESTAMP,
                    lastlogin TIMESTAMP)