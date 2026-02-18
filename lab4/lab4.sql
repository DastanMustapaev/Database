CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    faculty VARCHAR(50)
);

INSERT INTO students (name, email, faculty)
VALUES 
('Alymbek', 'alymbek@example.com', 'COMSEH'),
('Timur', 'timur@example.com', 'MED'),
('Beka', 'beka@example.com', 'MAT');

SELECT name, email FROM students;

SELECT * FROM students;

SELECT name, email 
FROM students
WHERE name = 'Timur';

SELECT name, email 
FROM students
ORDER BY name ASC;

SELECT name, email 
FROM students
LIMIT 2;

DROP TABLE students;
