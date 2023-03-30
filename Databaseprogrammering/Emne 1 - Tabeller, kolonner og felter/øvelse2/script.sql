--INSERT INTO groups (name, rettighedsniveau) VALUES ("superadministratorgruppe", 5)

--INSERT INTO groups (name, rettighedsniveau) VALUES ("administratorer", 4)
--INSERT INTO groups (name, rettighedsniveau) VALUES ("moderatorer", 3)
--INSERT INTO groups (name, rettighedsniveau) VALUES ("users", 2)
--INSERT INTO groups (name, rettighedsniveau) VALUES ("guest", 1)

--INSERT INTO users (groupId, username, password, rettighedsniveau) VALUES (1, "annedam", "64ebadf0913e2dce4ef461006d2bf14b", 5), (1, "konradsommer", "abe45d28281cfa2a4201c9b90a143095", 5), (2, "steensecher", "5ebe2294ecd0e0f08eab7690d2a6ee69", 4)

--INSERT INTO USERS (username, rettighedsniveau) VALUES ("ella_fanth", 3), ("remo_lademann", 3), ("lykkejuul", 3)

--INSERT INTO USERS (username, rettighedsniveau) VALUES ("steen_isaksen", 1), ("anders_sand", 1), ("ella_stick", 1)

--UPDATE users SET groupId="2" WHERE groupId="5"

