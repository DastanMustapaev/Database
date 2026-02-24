-- Lab 11: Basic Data Operations
-- create table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE
);

-- insert single record
INSERT INTO students (first_name, last_name, birth_date)
VALUES ('Aibek', 'Sharshenov', '2002-05-12');

-- insert multiple records
INSERT INTO students (first_name, last_name, birth_date) VALUES
('Ainura', 'Toktomamatova', '2001-09-23'),
('Bakyt', 'Mamatov', '2003-01-15'),
('Gulzat', 'Sultanova', '2002-07-30');

-- update record
UPDATE students
SET birth_date = '2002-05-15'
WHERE first_name = 'Aibek';

-- delete record
DELETE FROM students
WHERE first_name = 'Gulzat';

-- select data
SELECT * FROM students;
