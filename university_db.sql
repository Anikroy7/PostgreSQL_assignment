-- Active: 1729943047414@@127.0.0.1@5432@postgres@public
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(10)
);

create TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(30),
    credits INTEGER
);

create TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES "students" (student_id),
    course_id INTEGER REFERENCES "courses" (course_id)
);

-- !DROP THE TABLE
DROP TABLE courses;

-- !DELETE ALL DATA FROM TABLE
TRUNCATE TABLE enrollment;

-- INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
-- ( 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
-- ( 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
-- ( 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
-- ( 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
-- ( 'Sophia', 22, 'sophia@example.com', 50, 52, NULL);

INSERT INTO
    courses (course_name, credits)
VALUES ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3);

INSERT INTO
    enrollment (course_id, student_id)
VALUES (1, 1),
    (1, 2),
    (2, 1),
    (3, 1);

--? Query 1: Insert a new student record with the following details:
INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Hasan',
        23,
        'hasan@gmail.com',
        43,
        39,
        NULL
    );
--?  Query 2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name
FROM
    enrollment as en
    JOIN students ON en.student_id = "students".student_id
    JOIN courses on en.course_id = "courses".course_id
WHERE
    "courses".course_name = 'Next.js';

--? Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students set status = 'Awarded' WHERE student_id = (SELECT student_id FROM students ORDER BY (frontend_mark + backend_mark) DESC LIMIT 1);
 
--? Query 4: Delete all courses that have no students enrolled.


SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollment;