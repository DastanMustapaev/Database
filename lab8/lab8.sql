-- Parent tables
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

-- insert data
INSERT INTO students (name) VALUES
('Alice'),
('Bob');

INSERT INTO courses (course_name) VALUES
('Database Systems'),
('Algorithms');

-- One-to-Many relationship
-- one student -> many enrollments
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id) VALUES
(1,1),
(1,2),
(2,1);

SELECT * FROM enrollments;

-- Many-to-Many relationship (junction table)
CREATE TABLE student_courses (
    student_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

INSERT INTO student_courses VALUES
(1,1),
(1,2),
(2,1);

SELECT * FROM student_courses;

-- One-to-One relationship
CREATE TABLE student_profiles (
    profile_id SERIAL PRIMARY KEY,
    student_id INTEGER UNIQUE REFERENCES students(student_id),
    phone VARCHAR(20)
);

INSERT INTO student_profiles (student_id, phone) VALUES
(1, '+996700000000'),
(2, '+996555555555');

SELECT * FROM student_profiles;
