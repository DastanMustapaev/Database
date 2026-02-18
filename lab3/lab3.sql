CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO students (name, age)
VALUES ('Asan', 21),
       ('Ali', 20);

SELECT * FROM students;

DROP TABLE students;
