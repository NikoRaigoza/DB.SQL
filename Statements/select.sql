CREATE TABLE hello_mysql.users (
	user_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    age INT NULL,
    init_date DATE NULL,
    email VARCHAR(100) NULL,
    PRIMARY KEY (user_id)
);

INSERT INTO users (user_id, name, surname, age, init_date, email) VALUES (2, 'Nicolas', 'Raigoza', 24, '1999-05-25', 'nikoraigoza@gmail.com');
INSERT INTO users (name, surname, age, email) VALUES ('Sebastian', 'Taborda', 18, 'sebastian@gmail.com');
INSERT INTO users (user_id, name, surname, init_date) VALUES (4, 'David', 'Gonzalez', '2002-12-25');
INSERT INTO users (user_id, name, surname) VALUES (5, 'Valentina', 'Restrepo');
INSERT INTO users (name, surname, age, init_date, email) VALUES ('Alejandra', 'Molina', 31, '1994-02-11', 'alejandra@hotmail.com');

SELECT * FROM users;
SELECT name, age FROM users;
SELECT DISTINCT * FROM users;
SELECT DISTINCT age FROM users;
SELECT name FROM users WHERE age = 18;
SELECT DISTINCT age FROM users WHERE age = 18;
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users WHERE email LIKE '%@gmail.com';
SELECT * FROM users WHERE NOT email = 'nikoraigoza@gmail.com';
SELECT * FROM users WHERE NOT email = 'sebastian@gmail.com' AND age = 24;
SELECT * FROM users WHERE age = 18 OR age > 25;
SELECT * FROM users LIMIT 4;
SELECT * FROM users WHERE email IS NULL;

SELECT MAX(age) FROM users;
SELECT MIN(user_id) FROM users;
SELECT COUNT(user_id) FROM users;
SELECT SUM(age) FROM users;
SELECT AVG(age) FROM users;
SELECT * FROM users WHERE name IN ('Nicolas', 'Sebastian', 'david');
SELECT * FROM users WHERE age BETWEEN 19 AND 40;
SELECT name AS Nombre, init_date AS 'Fecha de nacimiento' FROM users; 
SELECT CONCAT(name, ' ', surname) AS 'Nombre completo' FROM users;
SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age;
SELECT COUNT(age) FROM users;
SELECT COUNT(age) FROM users HAVING COUNT(age) > 4;

SELECT *,
CASE
	WHEN age > 17 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir la mayoria de edad'
	ELSE 'Es menor de edad'
END AS '¿Mayor de edad?'
FROM users;

SELECT name, surname, IFNULL(age, 0) AS age FROM users;

-- UN COMENTARIO DE UNA SOLA LINEA 


