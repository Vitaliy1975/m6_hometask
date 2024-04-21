SELECT students.student_name, grades.grade, grades.subject_name, groups.group_name 
from grades 
join students on grades.student_name =students.student_name 
JOIN groups on students.group_id =groups.id 
JOIN subjects on grades.subject_name =subjects.subject_name 
WHERE groups.group_name ='third_group' AND subjects.subject_name ='Economics' ;
