/*
https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/ 

Table: actor_director
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp is the primary key column for this table.
timestamp는 이 테이블의 기본 키 열입니다.

 
Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
Return the result table in any order.
배우가 감독과 최소 3번 협력한 쌍(actor_id, director_id)을 조회하는 SQL 쿼리를 작성합니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
actor_director table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
Output: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.
설명: 3번 협력한 (1, 1) 쌍이 유일한 쌍입니다.
*/


USE practice;

CREATE TABLE actor_director
(
    actor_id    INT,
    director_id INT,
    timestamp   INT
);
INSERT INTO actor_director
    (actor_id, director_id, timestamp)
VALUES ('1', '1', '0'),
    ('1', '1', '1'),
    ('1', '1', '2'),
    ('1', '2', '3'),
    ('1', '2', '4'),
    ('2', '1', '5'),
    ('2', '1', '6');
    
    
SELECT *
FROM actor_director; 

SELECT actor_id, director_id 
FROM actor_director
group by actor_id, director_id
having COUNT(*) >=3;

