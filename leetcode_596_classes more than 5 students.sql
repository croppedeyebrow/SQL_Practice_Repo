/*
https://leetcode.com/problems/classes-more-than-5-students/ 

Table: Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key column for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
(학생, 수업)은 이 테이블의 기본 키 열입니다.
이 표의 각 행에는 학생의 이름과 학생이 등록한 수업이 표시됩니다.


Write an SQL query to report all the classes that have at least five students.
Return the result table in any order.
학생이 5명 이상인 모든 수업을 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.
설명:
- 수학에는 6명의 학생이 있으므로 포함합니다.
- 영어는 1명이므로 포함하지 않습니다.
- 생물학은 1명이므로 포함하지 않습니다.
- 컴퓨터에는 학생이 1명 있으므로 포함하지 않습니다.
*/

USE PRACTICE;

CREATE TABLE COURSES (STUDENT VARCHAR(255), CLASS VARCHAR(255));
INSERT INTO
	COURSES (STUDENT, CLASS)
VALUES
	('A', 'MATH')
	,('B', 'ENGLISH')
	,('C', 'MATH')
	,('D', 'BIOLOGY')
	,('E', 'MATH')
	,('F', 'COMPUTER')
	,('G', 'MATH')
	,('H', 'MATH')
	,('I', 'MATH');
    
    
SELECT class
FROM Courses
group by class
having COUNT(student) >= 5;

