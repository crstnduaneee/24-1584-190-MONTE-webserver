USE school;

SHOW TABLES;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATA
);

DESCRIBE enrollments;

ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES course(course_id);

DESCRIBE enrollments;

SELECT * FROM students;

SELECT * FROM courses;

INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(8, 1, '2026-10-07'),
(9, 2, '2026-10-07'),
(10, 3, '2026-10-07');

SELCT * FROM enrollments;

SELECT
    students.name,
    courses.course_name,
    enrollments.enrollment_date,
FROM enrollments
JOIN students
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id;

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Information Technology';

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;
ORDER BY number_of_students DESC;

SELECT
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;

INSERT INTO students (name, course, year_level)
VALUES
('Chloe Anne', 'BSIT', 3),
('Jason Aquino', 'BSCS', 2);

SELCT * FROM students;

INSERT INTO courses (course_name, description, units)
VALUES
('Database Systems', 'Data', 21),
('Web Development', 'WebTech', 23);

SELECT * FROM courses;

INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(8, 2, '2026-10-08'),
(8, 4, '2026-10-08'),
(9, 3, '2026-10-08'),
(9, 5, '2026-10-08'),
(10, 4, '2026-10-08'),
(11, 5, '2026-10-08'),
(12, 1, '2026-10-08');

SELECT * FROM enrollments;
