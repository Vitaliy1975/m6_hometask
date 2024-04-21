SELECT students.student_name, AVG(grades.grade) AS av
FROM students
JOIN grades ON students.student_name  = grades.student_name 
GROUP BY students.student_name 
ORDER BY av DESC 
LIMIT 5;
