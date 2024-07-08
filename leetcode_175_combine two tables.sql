/*
https://leetcode.com/problems/combine-two-tables/ 

Table: person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| last_name   | varchar |
| first_name  | varchar |
+-------------+---------+
person_id is the primary key column for this table.
This table contains information about the ID of some persons and their first and last names.
person_id는 이 테이블의 기본 키 열입니다.
이 테이블에는 일부 개인의 ID와 성과 이름에 대한 정보가 포함되어 있습니다.
 
 
Table: address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| address_id  | int     |
| person_id   | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
address_id is the primary key column for this table.
Each row of this table contains information about the city and state of one person with ID = person_id.
address_id는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행에는 ID = person_id인 한 사람의 도시 및 주에 대한 정보가 포함되어 있습니다.


Write an SQL query to report the first name, last name, city, and state of each person in the person table.
If the address of a person_id is not present in the address table, report null instead.
Return the result table in any order.
person 테이블에 있는 각 사람의 이름, 성, 도시 및 주를 보고하는 SQL 쿼리를 작성하세요.
person_id의 주소가 address 테이블에 없으면 대신 null을 보고합니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
person table:
+----------+----------+-----------+
|person_id |last_name |first_name |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
address table:
+-----------+----------+---------------+------------+
|address_id |person_id | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output: 
+-----------+----------+---------------+----------+
|first_name |last_name | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | null          | null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+
Explanation: 
There is no address in the address table for the person_id = 1 so we return null in their city and state.
address_id = 1 contains information about the address of person_id = 2.
설명:
person_id = 1에 대한 address 테이블에는 주소가 없으므로 도시와 주에서 null을 반환합니다.
address_id = 1에는 person_id = 2의 주소에 대한 정보가 포함됩니다.
*/


USE PRACTICE;
CREATE TABLE person
(
    person_id  INT,
    first_name VARCHAR(255),
    last_name  VARCHAR(255)
);
INSERT INTO person
    (person_id, last_name, first_name)
VALUES ('1', 'WANG', 'ALLEN'),
	('2', 'Alice', 'Bob');
    
 CREATE TABLE address
(
    address_id INT,
    person_id INT,
    city      VARCHAR(255),
    state     VARCHAR(255)
);
INSERT INTO address
    (address_id, person_id, city, state)
VALUES ('1', '2', 'NEW YORK CITY', 'NEW YORK'),
	('2', '3', 'Leetcode', 'California');
    
    SELECT * FROM PERSON;
    SELECT * FROM ADDRESS;
    
    SELECT *
    FROM PERSON AS P
    LEFT outer JOIN ADDRESS AS A
    ON P.person_id = A.person_id;
    
	SELECT 
    P.first_name, P.last_name,
    A.city, A.state
    FROM PERSON AS P
    LEFT outer JOIN ADDRESS AS A
    ON P.person_id = A.person_id;