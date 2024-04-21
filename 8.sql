SELECT AVG(grades.grade), tutors.tutor_name 
from grades 
join subjects on grades.subject_name =subjects.subject_name 
JOIN tutors on subjects.tutor_name =tutors.tutor_name 
WHERE tutors.tutor_name ='Emma Bonilla';
