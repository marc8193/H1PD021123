use taskDatabase;

-- Opg 4.1.1
SELECT * FROM tasks WHERE teamId IS NULL

-- Opg 4.1.2
SELECT name, teamname 
FROM tasks
JOIN teams
ON tasks.taskId = teams.currentTask;

-- Opg 4.1.3
SELECT teamname, name
FROM tasks
JOIN teams
ON tasks.taskId = teams.currentTask;
