/*
https://leetcode.com/problems/not-boring-movies/ 

Table: Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]
id는 이 테이블의 기본 키입니다.
각 행에는 영화 이름, 장르, 등급에 대한 정보가 포함되어 있습니다.
등급은 [0, 10] 범위의 부동소수점 2자리입니다.


Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
홀수 ID와 "boring"이 아닌 설명이 포함된 영화를 보고하는 SQL 쿼리를 작성하세요.
등급별로 내림차순으로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5.
The movie with ID = 3 is boring so we do not include it in the answer.
설명:
홀수 ID인 1, 3, 5의 영화 3개가 있습니다.
ID = 3인 영화는 'boring'이므로 답변에 포함하지 않습니다.
*/



USE PRACTICE;
CREATE TABLE cinema(id int, movie varchar(255), description varchar(255), rating float(2,1));

INSERT INTO 
    cinema (id,movie,description,rating)
VALUES 
	('1', 'War', 'great 3D', '8.9')
	,('2', 'Science', 'fiction', '8.5')
	,('3', 'irish', 'boring', '6.2')
	,('4', 'Ice song', 'Fantacy', '8.6')
	,('5', 'House card', 'Interesting', '9.1');
    
    
SELECT * FROM cinema;


SELECT * 
FROM cinema
WHERE mod(id,2) = 1      
AND description != 'boring'
order by rating desc;

/*mod(나누고 싶은 값, 나눌값) */


SELECT * 
FROM cinema
WHERE id & 1 = 1
AND description IN (SELECT description FROM cinema WHERE description != 'boring')
ORDER BY rating DESC;


SELECT * 
FROM cinema
WHERE id%2 = 1
AND description IN (SELECT description FROM cinema WHERE description != 'boring')
ORDER BY rating DESC;
