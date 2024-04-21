SELECT students.student_name, groups.group_name 
from students 
join groups on students.group_id =groups.id 
WHERE  groups.group_name ='second_group';