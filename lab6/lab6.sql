CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    faculty VARCHAR(100)
);

ALTER TABLE student
ADD COLUMN age INTEGER;

ALTER TABLE student
ALTER COLUMN faculty TYPE VARCHAR(150);

ALTER TABLE student
RENAME COLUMN age TO student_age;

CREATE TEMP TABLE temp_data (
    id SERIAL,
    note TEXT
);

DROP TABLE IF EXISTS temp_data;
