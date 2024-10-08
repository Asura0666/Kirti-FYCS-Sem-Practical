-- Salary Update Based on Hiredate 
DECLARE
  ENO FY_EMP_51.EMPNO%TYPE := &RNO;
  EMP_REC FY_EMP_51%ROWTYPE;
  CURSOR C1 IS SELECT * FROM FY_EMP_51 WHERE EMPNO = ENO;
BEGIN
  OPEN C1;
  LOOP
    FETCH C1 INTO EMP_REC;
    EXIT WHEN C1%NOTFOUND;
    
    IF EMP_REC.HIREDATE < TO_DATE('&HIREDATE', 'DD-MM-YYYY') THEN
      UPDATE FY_EMP_51 SET SAL = SAL + (SAL * 0.15) WHERE EMPNO = ENO;
      DBMS_OUTPUT.PUT_LINE('RECORD UPDATED WITH 15% INCREASE');
    ELSE
      UPDATE FY_EMP_51 SET SAL = SAL + (SAL * 0.05) WHERE EMPNO = ENO;
      DBMS_OUTPUT.PUT_LINE('RECORD UPDATED WITH 5% INCREASE');
    END IF;
    
  END LOOP;
  CLOSE C1;
END;
/
SELECT * FROM FY_EMP_51;

-- Insert Multiple Department Records
DECLARE 
  N NUMBER := &N;
  I NUMBER := 1;
BEGIN 
  WHILE (I <= N)
  LOOP
    INSERT INTO DEPT (DEPTNO, DNAME, LOC)
    VALUES (&SID, '&SNAME', '&SADD');
    I := I + 1;
  END LOOP;
END;
/

-- Update Employee Salary by EMPNO
DECLARE
  V_ENO FY_EMP_51.EMPNO%TYPE;
BEGIN 
  V_ENO := &ENO;
  UPDATE FY_EMP_51
  SET SAL = SAL + 1000 
  WHERE EMPNO = V_ENO;
  
  IF SQL%ROWCOUNT > 0 THEN
    DBMS_OUTPUT.PUT_LINE('RECORD UPDATED');
  ELSE 
    DBMS_OUTPUT.PUT_LINE('RECORD NOT FOUND');
  END IF;
END;
/
SELECT * FROM FY_EMP_51;

-- Display Employee Information from Cursor
DECLARE
  EMP_NO FY_EMP_51.EMPNO%TYPE; 
  EMP_NAME FY_EMP_51.ENAME%TYPE;
  EMP_SALARY FY_EMP_51.SAL%TYPE;
  
  CURSOR EMP_CURSOR IS
    SELECT EMPNO, ENAME, SAL
    FROM FY_EMP_51; 
BEGIN
  OPEN EMP_CURSOR;

  LOOP
    FETCH EMP_CURSOR INTO EMP_NO, EMP_NAME, EMP_SALARY;
    EXIT WHEN EMP_CURSOR%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(EMP_NAME || ' ' || EMP_SALARY);
  END LOOP;

  CLOSE EMP_CURSOR;
END;
/
SELECT * FROM FY_EMP_51;

-- Display All Programmer Names from Cursor
DECLARE
  CURSOR C1 IS
    SELECT NAME
    FROM PROGRAMMER;
BEGIN
  FOR REC IN C1 LOOP
    DBMS_OUTPUT.PUT_LINE(REC.NAME);
  END LOOP;
END;
/
SELECT * FROM PROGRAMMER;

-- Count Employees in a Specific Department
DECLARE
  DN DEPT.DNAME%TYPE := '&DN';
  C NUMBER := 0;
  CURSOR C1 IS
    SELECT ENAME, DNAME
    FROM FY_EMP_51 E, DEPT D
    WHERE DNAME = DN AND D.DEPTNO = E.DEPTNO;
BEGIN
  FOR I IN C1 LOOP
    C := C + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('TOTAL NO. OF EMP IN THE DEPARTMENT ' || DN || ' IS ' || C);
END;
/
