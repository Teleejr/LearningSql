/*Question 2: LIST EACH DEPARTMENT AND THE NUMBER OF COURSES IT OFFERS. CORRECT.*/
SELECT dept.NAME AS 'Dept Name',
COUNT(c.deptid) AS '# of Courses'
FROM department AS dept
JOIN course AS c 
ON dept.id = c.deptid 
GROUP BY 1 ORDER BY 2;

/*Question 3: lIST EACH COURSE AND THE NUMBER OF STUDENTS. CORRECT.*/
SELECT c.NAME AS 'Course Name',
COUNT(sc.studentid) AS 'Number of Students'
FROM course AS c
JOIN studentcourse AS sc
ON c.id = sc.courseid
GROUP BY 1 desc ORDER BY 2 desc, c.name;

/*Question 4: LIST COURSES WITHOUT FACULTY. CORRECT*/
SELECT NAME FROM course AS c
WHERE NOT EXISTS
(SELECT courseid FROM facultycourse AS fc
WHERE fc.courseid = c.id);

/*Question 5: LIST NUMBER OF STUDENTS IN COURSES WITHOUT FACULTY. CORRECT*/
SELECT ALL c.name, COUNT(DISTINCT sc.studentid) FROM course AS c
JOIN studentcourse AS sc
ON c.id = sc.courseid
WHERE NOT EXISTS
(SELECT courseid FROM facultycourse AS fc
WHERE fc.courseid = c.id)
GROUP BY 1 ORDER BY 2 desc;

/*Question 6: lIST TOTAL # OF STUDENTS ENROLLED EACH YEAR. CORRECT.*/
SELECT count(distinct studentid) AS 'Students', YEAR(startdate) AS 'Year' 
FROM studentcourse
GROUP BY 2 ORDER BY 1;

/*Question 7: LIST # OF STUDENTS ENROLLED IN AUGUST OF EACH YEAR. CORRECT.*/
SELECT startdate, COUNT(DISTINCT studentid) FROM studentcourse
GROUP BY startdate
HAVING MONTH(startdate) = 8;

/*Question 8: LIST STUDENT NAME AND # OF COURSES IN THEIR MAJOR.
COLUMNS: FIRST NAME, LAST NAME, MAJOR COURSES.
CONNECTS: S.ID->SC.STUDENTID, S.MAJORID->DEPT.ID, DEPT.ID->C.DEPTID, C.ID->SC.COURSEID*/

/*Question 9: LIST NAME AND AVG OF STUDENTS WITH LESS THAN 50%. CORRECT BUT CAN'T SORT.*/
SELECT DISTINCT sc.studentid, s.firstname, s.lastname, ROUND(AVG(sc.progress),1) FROM studentcourse AS sc
JOIN student AS s
ON sc.studentid = s.id
GROUP BY sc.studentid, s.firstname, s.lastname
HAVING AVG(sc.progress) < 50 
ORDER BY AVG(sc.progress) desc;

/*Question 10: LIST COURSE NAME AND STUDENTS AVG.*/
SELECT DISTINCT c.name AS 'Course', ROUND(AVG(sc.progress),1) AS 'Avg Progress' FROM course AS c
JOIN studentcourse AS sc ON c.id = sc.courseid
GROUP BY c.name ORDER BY AVG(sc.progress) desc;

/*Question 11: LIST COURSE WITH THE HIGHEST AVG PROGRESS. WTF ARE THEY ASKING????*/
/*Question 12: LIST FACULTY NAME AND AVG PROGRESS OF ALL THEIR COURSES.*/

/*Question 13: LIST FACULTY AVERAGE IF > 90% OF MAX COURSE AVG.*/
/*Question 14: LIST MIN & MAX GRADES.*/

SELECT s.firstname AS 'First', s.lastname AS 'Last', MIN(sc.progress) AS 'Min Score', MAX(sc.progress) AS 'Max Score'
FROM student AS s JOIN studentcourse AS sc
ON s.id = sc.studentid
GROUP BY s.firstname, s.lastname ORDER BY MIN(sc.progress) DESC, MAX(sc.progress) DESC;



