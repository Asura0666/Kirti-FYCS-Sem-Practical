SET SERVEROUTPUT ON

-- 1. PROCEDURE TO SWAP TWO NUMBERS
CREATE OR REPLACE PROCEDURE SWAP 
IS 
  A NUMBER := &A;
  B NUMBER := &B;
  C NUMBER := 0;

BEGIN 
  DBMS_OUTPUT.PUT_LINE('Before swapping values of A: ' || A);
  DBMS_OUTPUT.PUT_LINE('Before swapping values of B: ' || B);
  
  C := A;
  A := B;
  B := C;
  
  DBMS_OUTPUT.PUT_LINE('After swapping values of A: ' || A);
  DBMS_OUTPUT.PUT_LINE('After swapping values of B: ' || B);
END;
/
EXECUTE SWAP();


-- 2. PROCEDURE TO INSERT RECORD INTO SOFTWARE TABLE
CREATE OR REPLACE PROCEDURE SOFT
IS 
BEGIN
  INSERT INTO SOFTWARE
  VALUES('&NAME', '&TITLE', '&DEV_IN', &SCOST, &DCOST, &SOLD);
END;
/
EXECUTE SOFT();

-- Query to check the inserted record
SELECT * FROM SOFTWARE WHERE NAME = 'PRANITA';


-- 3. PROCEDURE TO DISPLAY ALL EMPLOYEES FROM SY_EMP_65
CREATE OR REPLACE PROCEDURE EMPLOYEE
IS
  CURSOR C1 IS SELECT * FROM SY_EMP_65;
BEGIN
  DBMS_OUTPUT.PUT_LINE('EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO');
  FOR I IN C1
  LOOP
    DBMS_OUTPUT.PUT_LINE(I.EMPNO || ' ' || I.ENAME || ' ' || I.JOB || ' ' || I.MGR || ' ' || I.HIREDATE || ' ' || I.SAL || ' ' || I.COMM || ' ' || I.DEPTNO);
  END LOOP;
END;
/
EXECUTE EMPLOYEE();


-- 4. PROCEDURE TO FIND EMPLOYEES BY DEPARTMENT NAME
CREATE OR REPLACE PROCEDURE EMP1(N1 IN VARCHAR2)
IS
  N SY_EMP_65.ENAME%TYPE;
  CURSOR C1 IS
    SELECT E.ENAME
    FROM SY_EMP_65 E, DEPT D
    WHERE D.DNAME = N1 AND E.DEPTNO = D.DEPTNO;
BEGIN
  OPEN C1;
  LOOP
    FETCH C1 INTO N;
    EXIT WHEN C1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(N);
  END LOOP;
  CLOSE C1;
END;
/
EXECUTE EMP1('&N1');


-- 5. PROCEDURE TO DISPLAY EMPLOYEES WITH SALARY BETWEEN 2000 AND 5000
CREATE OR REPLACE PROCEDURE EMP2
IS
  CURSOR C1 IS
    SELECT *
    FROM SY_EMP_65
    WHERE SAL BETWEEN 2000 AND 5000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO');
  FOR I IN C1
  LOOP
    DBMS_OUTPUT.PUT_LINE(I.EMPNO || ' ' || I.ENAME || ' ' || I.JOB || ' ' || I.MGR || ' ' || TO_CHAR(I.HIREDATE, 'DD-MON-YYYY') || ' ' || I.SAL || ' ' || I.COMM || ' ' || I.DEPTNO);
  END LOOP;
END;
/
EXECUTE EMP2();
