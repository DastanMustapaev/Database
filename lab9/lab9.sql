-- Example database design: Library Management System
-- Entity: Authors
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- Entity: Books
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    publish_year INTEGER
);

-- Many-to-Many Relationship: Authors write Books
CREATE TABLE book_authors (
    author_id INTEGER REFERENCES authors(author_id),
    book_id INTEGER REFERENCES books(book_id),
    PRIMARY KEY (author_id, book_id)
);

-- Entity: Members
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150) UNIQUE
);

-- Entity: Loans (One-to-Many relationship)
CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES members(member_id),
    book_id INTEGER REFERENCES books(book_id),
    loan_date DATE DEFAULT CURRENT_DATE
);

-- Sample data
INSERT INTO authors (author_name) VALUES ('J.K. Rowling');
INSERT INTO books (title, publish_year) VALUES ('Harry Potter', 1997);
INSERT INTO members (name, email) VALUES ('Dastan', 'dastan@mail.com');

INSERT INTO book_authors VALUES (1,1);
INSERT INTO loans (member_id, book_id) VALUES (1,1);

SELECT * FROM loans;
