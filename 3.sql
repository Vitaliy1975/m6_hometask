SELECT groups.group_name, AVG(grades.grade) as av, subjects.subject_name 
from grades 
join	students  on grades.student_name = students.student_name 
JOIN groups on	students.group_id = groups.id 
JOIN subjects on grades.subject_name =subjects.subject_name 
WHERE subjects.subject_name ='Computer Science' 
GROUP BY groups.group_name 
ORDER BY av DESC ;
