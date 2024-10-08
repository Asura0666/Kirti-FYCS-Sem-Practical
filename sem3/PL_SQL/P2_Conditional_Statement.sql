-- SALES REVENUE CHECK (100K THRESHOLD)
DECLARE
  N_SALES NUMBER := 200000;
BEGIN
  IF (N_SALES > 100000) THEN
    DBMS_OUTPUT.PUT_LINE('Sales revenue is greater than 100K');
  END IF;
END;
/

-- COMMISSION CALCULATION (300K SALES)
DECLARE
  N_SALES NUMBER := 300000;
  N_COMMISSION NUMBER(10,2);
BEGIN
  IF (N_SALES > 200000) THEN
    N_COMMISSION := N_SALES * 0.1;
  ELSE
    N_COMMISSION := N_SALES * 0.05;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Commission = ' || N_COMMISSION);
END;
/

-- SALES REVENUE CHECK (100K THRESHOLD - REPEATED)
DECLARE
  N_SALES NUMBER := 200000;
BEGIN
  IF (N_SALES > 100000) THEN
    DBMS_OUTPUT.PUT_LINE('Sales revenue is greater than 100K');
  END IF;
END;
/

-- COMMISSION CALCULATION (GENERAL)
DECLARE
  N_SALES NUMBER := 300000;
  N_COMMISSION NUMBER(10,2);
BEGIN
  IF (N_SALES > 200000) THEN
    N_COMMISSION := N_SALES * 0.1;
  ELSE
    N_COMMISSION := N_SALES * 0.05;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Commission = ' || N_COMMISSION);
END;
/
