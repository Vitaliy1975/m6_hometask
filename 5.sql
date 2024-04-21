SELECT subjects.subject_name, tutors.tutor_name 
from subjects
join tutors on subjects.tutor_name =tutors.tutor_name 
WHERE tutors.tutor_name ='Melody Hawkins' 