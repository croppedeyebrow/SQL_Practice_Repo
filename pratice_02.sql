use practice;

SELECT *
FROM PRODUCT;

SELECT * 
FROM sales;

SELECT * 
FROM CUSTOMER;
/**************INNER JOIN***************/

/* INNER JOIN : 두 테이블의 공통 값이 매칭되는 데이터만 결합 */

/*CUSTOMER + SALES INNER JOIN */
SELECT * 
FROM CUSTOMER AS CS
INNER 
  JOIN SALES AS MONEY
  ON CS.MEM_NO = MONEY.MEM_NO;
  
  /*CUSTOMER 및 SALES 테이블은 MEM_NO(회원번호) 기준으로 1:N 관계 */
  SELECT *
  FROM CUSTOMER AS CS
  INNER 
  JOIN SALES AS MONEY
  ON CS.MEM_NO = MONEY.MEM_NO
  WHERE CS.MEM_NO = '1000970';
  
  
  
  /**************lEFT JOIN***************/
    /*LEFT JOIN : 두 테이블의 공통 값이 매칭되는 데이터만 결합 + 왼쪽 테이블과 매칭되지 않는 데이터는 NULL값 처리. */
    
    /*Customer + Sales LEFT JOIN */
    SELECT *
    FROM CUSTOMER AS CS
    LEFT
    JOIN SALES AS S
    ON CS.MEM_NO = S.MEM_NO;
    /* NULL은 회원가입만하고 주문은 하지 ㅇ낳은 회원을 의미*/
  
    
  /**************RIGHT JOIN***************/
    /*RIGHT JOIN : 두 테이블의 공통 값이 매칭되는 데이터만 결합 + 오른쪽 테이블과 매칭되지 않는 데이터는 NULL값 처리. */
    
      /*Customer + Sales RIGHT JOIN */
    SELECT *
    FROM CUSTOMER AS CS
    RIGHT
    JOIN SALES AS S
    ON CS.MEM_NO = S.MEM_NO
    WHERE CS.MEM_NO IS NULL;
    /* 회원번호 9999999SMS 비회원*/
    /* IS NULL : 비교 연산자 / NULL인 값만 */
    
    
      /**************테이블 경합(JOIN) + 데이터 조회(SELECT)***************/
      
    /*회원(CUSTOMER) 및 주문(SALES) 테이블 INNER JOIN 결합 */    
    SELECT *
    FROM CUSTOMER AS CS
    INNER 
    JOIN SALES AS S
    ON CS.MEM_NO = S.MEM_NO;
    
    /*임시 테이블 생성하여 저장 */
    CREATE TEMPORARY TABLE CUTOMER_SALES_INNER_JOIN
    SELECT CS.*
    ,S.ORDER_NO
    FROM CUSTOMER AS CS
    INNER 
    JOIN SALES AS S
    ON CS.MEM_NO = S.MEM_NO ;   
    
    /*임시 테이블 조회*/
    SELECT *
    FROM CUTOMER_SALES_INNER_JOIN;

   /*임시 테이블에서 성별이 남성 조건으로 필터링 */
   SELECT * 
   FROM CUTOMER_SALES_INNER_JOIN
   WHERE GENDER = 'MAN';
    
    
   /*거주지역별로 구매횟수 집계 */
   SELECT ADDR , COUNT(ORDER_NO) AS 구매횟수
   FROM CUTOMER_SALES_INNER_JOIN
   WHERE GENDER = 'MAN'
   GROUP
   BY ADDR;
   
      /*거주지역별로 구매횟수 집계 , 구매횟수 100회 미만*/
   SELECT ADDR , COUNT(ORDER_NO) AS 구매횟수
   FROM CUTOMER_SALES_INNER_JOIN
   WHERE GENDER = 'MAN'
   GROUP
   BY ADDR
   HAVING COUNT(ORDER_NO) < 100;
   
         /*거주지역별로 구매횟수 집계 , 구매횟수 100회 미만, 구매수가 낮은 순으로*/
   SELECT ADDR , COUNT(ORDER_NO) AS 구매횟수
   FROM CUTOMER_SALES_INNER_JOIN
   WHERE GENDER = 'MAN'
   GROUP
   BY ADDR
   HAVING COUNT(ORDER_NO) < 100
   ORDER BY COUNT(ORDER_NO) ASC;
   
   
   
   /************3개 이상 테이블 결합**************/
   /* 주문(SALES) 테이블 기준, 회원(CUSTOMER) 및 상품(PRODUCT) 테이블 LEFT JOIN 결합 */
   
   SELECT * 
   FROM SALES AS S
   LEFT 
   JOIN CUSTOMER AS CS
   ON S.MEM_NO = CS.MEM_NO
   LEFT
   JOIN PRODUCT AS P
   ON S.PRODUCT_CODE = P.PRODUCT_CODE;
   
   
   ---------------------
   
   /******************SELECT절 서브 쿼리 *************************/
   /*SELECT 명령문 안에 SELECT 명령문 */
   
   SELECT *
   ,(SELECT GENDER FROM CUSTOMER WHERE A.MEM_NO = MEM_NO) AS GENDER
   FROM SALES AS A;
    
/* 확인 */
  SELECT *
  FROM CUSTOMER 
  WHERE MEM_NO = '1000970';
  
  /*SELECT 절 서브 쿼리 VS 데이터결합(JOIN절) 처리 속도 비교*/
  SELECT A.* ,
  B.GENDER
  FROM SALES AS A
  LEFT JOIN CUSTOMER AS B
  ON A.MEM_NO = B.MEM_NO;
  
  /* SELECT 절 서브쿼리는 실행소곧가 느리기 때문에, 잘 사용하지 않고 JOIN을 사용함 */
    