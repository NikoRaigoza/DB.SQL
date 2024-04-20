INSERT INTO users (user_id, name, surname) VALUES (7, 'Maria', 'Lopez');

UPDATE users SET age = '21' WHERE user_id = 7;

DELETE FROM users WHERE user_id = 7;

CREATE DATABASE test;

DROP DATABASE test;

---------------------------------------------

CREATE TABLE personas (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    created DATETIME DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age >= 18) --Restriccion en un campo especifico en donde solo se aceptan valores mayores a 18
);

ALTER TABLE personas
ADD surname VARCHAR(50);

ALTER TABLE personas
RENAME COLUMN descripcion TO description;

ALTER TABLE personas
MODIFY COLUMN description VARCHAR(200);

ALTER TABLE personas
DROP COLUMN description;

ALTER TABLE users
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id); 


-- JOINS

SELECT users.name, dni.dni_number FROM users
INNER JOIN dni
ON users.user_id = dni.user_id;

SELECT users.name, dni.dni_number FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id; 

SELECT users.name, dni.dni_number FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id; 

SELECT users.user_id, dni.user_id
FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id
UNION
SELECT dni.user_id, dni.user_id
FROM dni
RIGHT JOIN users
ON users.user_id = dni.user_id;

-- INDEX

CREATE INDEX idx_name ON users(name);

CREATE UNIQUE INDEX idx_name2 ON users(name, surname);

DROP INDEX idx_name ON users;

-- TRIGGER

CREATE TRIGGER tg_emailtg_email
AFTER UPDATE ON users
FOR EACH ROW 
BEGIN
	IF OLD.email <> NEW.email THEN
		INSERT INTO email_history (user_id, email)
        VALUES(OLD.user_id, OLD.email);
	END IF;
END;

DROP TRIGGER tg_email;

-- VIEWS

CREATE VIEW v_adult_users AS
SELECT name, age
FROM users
WHERE age >= 18;