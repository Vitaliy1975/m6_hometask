SELECT students.student_name, AVG(grades.grade), subjects.subject_name 
FROM students
JOIN grades ON students.student_name = grades.student_name 
JOIN subjects ON grades.subject_name = subjects.subject_name 
WHERE subjects.subject_name = 'Psychology' 
GROUP BY students.student_name 
ORDER BY AVG(grades.grade)  DESC 
LIMIT 1;
