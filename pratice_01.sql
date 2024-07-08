USE PRACTICE;


/********************************************************************/

/*****************연산자*********************/



/*비교 연산자*/

/* = '같음' */
SELECT * FROM CUSTOMER
WHERE GENDER = 'MAN';

/* <> '같지 않음' */
SELECT *
FROM CUSTOMER 
WHERE GENDER <> 'MAN';

/* >= : ~보다 크거나 같음 */
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) >= 2020;

/* <= : ~보다 작거나 같음 */
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) <= 2019;

/* > : ~보다 큼 */
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) > 2019;

/* < : ~보다 작음 */
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) < 2020;

/*논리 연산자*/

/*AND : 앞, 뒤 조건 모두 만족 */
SELECT *
FROM CUSTOMER 
WHERE GENDER = 'MAN'
AND ADDR = 'GYEONGGI';

/*NOT : 뒤에 오는 조건과 반대 */
SELECT *
FROM CUSTOMER
WHERE NOT GENDER = 'MAN'
AND ADDR = 'GYEONGGI';

/*OR : 하나라도 만족 */
SELECT *
FROM CUSTOMER 
WHERE GENDER = 'MAN'
OR ADDR = 'GYEONGGI';


/********특수 연산자**********/

/*BETWEEN a AND b : A와 B의 값 사이 */
SELECT *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) BETWEEN 2010 AND 2011;

/*NOT BETWEEN a AND b : A와 B의 값 사이 */
SELECT *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) NOT BETWEEN 2010 AND 2011;

/*IN (List) : 리스트 값 */
select *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) IN (2010,2011);

/*NOT IN (List) : 리스트 값이 아님. */
select *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) NOT IN (2010,2011);

/*LIKE : 비교문자열 */
SELECT *
FROM CUSTOMER
WHERE ADDR LIKE 'D%';  /*D로 시작하는*/


SELECT *
FROM CUSTOMER
WHERE ADDR LIKE '%N';  /*N으로 끝나는*/


SELECT *
FROM CUSTOMER
WHERE ADDR LIKE '%EO%';  /*EO를 포함하는 */

/*NOT LIKE : 비교문자열, 포함되지 않는 */
SELECT *
FROM CUSTOMER
WHERE ADDR NOT LIKE '%EO%';  /*EO를 포함하지 않는(제외하는) */

/*IS NULL : NULL값 추출하기 */
SELECT *
FROM CUSTOMER AS A 
LEFT 
JOIN SALES AS B
     ON A.MEM_NO = B.MEM_NO
 WHERE B.MEM_NO IS NULL;    
 
 /*IS NOT NULL : NULL값이 아닌것 추출하기 */
SELECT *
FROM CUSTOMER AS A 
LEFT 
JOIN SALES AS B
     ON A.MEM_NO = B.MEM_NO
 WHERE B.MEM_NO IS NOT NULL;    


/**************산술 연산 ************************/

