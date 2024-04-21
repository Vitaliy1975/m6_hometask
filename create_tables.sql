DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(255) UNIQUE NOT NULL,
    group_id INTEGER
);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (id) REFERENCES students (group_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

DROP TABLE IF EXISTS tutors;
CREATE TABLE tutors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tutor_name VARCHAR(255),
    FOREIGN KEY (tutor_name) REFERENCES subjects (tutor_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(255),
    tutor_name VARCHAR(255),
    FOREIGN KEY (tutor_name) REFERENCES tutors (tutor_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS grades;
CREATE TABLE grades(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(255),
    subject_name VARCHAR(255),
    grade INTEGER,
    date_of_grade DATE,
    FOREIGN KEY (student_name) REFERENCES students (student_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    FOREIGN KEY (subject_name) REFERENCES subjects (subject_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);