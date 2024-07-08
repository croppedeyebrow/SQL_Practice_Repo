/*Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

Write a solution to find the employees who earn more than their managers.
매니저보다 임금이 높은 직원을 찾아라.
Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.

 */
 
 use practice;
 CREATE TABLE Employee (
      id int,
      name varchar(255),
      salary int,
      managerId int
      );
  INSERT INTO Employee
  (id, name, salary, managerId)
  values
  (1, 'Joe',70000,3),
  (2, 'Henry',80000,4),
  (3, 'Sam',60000, null),
  (4,'Max',90000,null);
  
  SELECT * FROM Employee;
  
  SELECT E1.name AS Employee
  FROM Employee AS  E1
  inner JOIN Employee AS E2 
  ON E1.managerId = E2.id
  WHERE E1.salary > E2.salary;
  
  
  

