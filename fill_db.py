from datetime import datetime
import faker
from random import randint, choice
import sqlite3


def generate_fake_data() -> tuple:

    fake_students = []
    fake_groups = ["first_group","second_group","third_group"]
    fake_subjects = ["Anthropology","Archaeology","Linguistics","Psychology","Computer Science","Physics","Economics","Literature"]
    fake_tutors=[]

    fake_data = faker.Faker()

    for _ in range(50):
        fake_students.append(fake_data.name())

    for _ in range(5):
        fake_tutors.append(fake_data.name())

    return fake_students, fake_groups, fake_subjects, fake_tutors


def prepare_data(students,groups,subjects,tutors) -> tuple:
    to_groups = []
    for group in groups:
        to_groups.append((group, ))

    to_students = []
    for st in students:
        to_students.append((st, randint(1, 3)))

    to_grades = []
    for st in students:
        for _ in range(20):
            to_grades.append((st,choice(subjects),randint(6,12),datetime(year=2023,month=randint(1,12),day=randint(1,28))))
    
    to_subjects=[]
    for sub in subjects:
        to_subjects.append((sub,choice(tutors)))

    to_tutors=[]
    for tut in tutors:
        to_tutors.append((tut,))
    
    return to_groups, to_students, to_grades, to_subjects, to_tutors


def insert_data_to_db(groups, students, grades, subjects, tutors) -> None:

    with sqlite3.connect('database.db') as con:

        cur = con.cursor()

        sql_to_groups = """INSERT INTO groups(group_name)
                               VALUES (?)"""

        cur.executemany(sql_to_groups, groups)

        sql_to_students = """INSERT INTO students(student_name, group_id)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_students, students)

        sql_to_grades = """INSERT INTO grades(student_name, subject_name, grade, date_of_grade)
                              VALUES (?, ?, ?, ?)"""

        cur.executemany(sql_to_grades, grades)

        sql_to_subjects="""INSERT INTO subjects(subject_name, tutor_name)
                                VALUES (?, ?)"""
        
        cur.executemany(sql_to_subjects,subjects)

        sql_to_tutors="""INSERT INTO tutors(tutor_name)
                            VALUES (?)"""
        
        cur.executemany(sql_to_tutors,tutors)

        con.commit()


if __name__ == "__main__":
    groups, students, grades, subjects, tutors = prepare_data(*generate_fake_data())
    print(groups,students,grades,subjects,tutors)
    insert_data_to_db(groups, students, grades, subjects, tutors)
