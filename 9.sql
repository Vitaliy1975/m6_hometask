SELECT students.student_name, subjects.subject_name 
from students
join grades on students.student_name=grades.student_name 
JOIN subjects on grades.subject_name =subjects.subject_name 
WHERE students.student_name  ='Calvin Woodard';
