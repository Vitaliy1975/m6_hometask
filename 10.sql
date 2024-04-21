SELECT  students.student_name, subjects.subject_name, tutors.tutor_name 
from students
join grades on students.student_name =grades.student_name 
JOIN subjects on grades.subject_name =subjects.subject_name
JOIN tutors on subjects.tutor_name =tutors.tutor_name
where students.student_name ='Amber Blair' AND tutors.tutor_name ='Rachel Robinson';
