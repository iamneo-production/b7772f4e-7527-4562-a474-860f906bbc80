CREATE INDEX INDEX_AIRLINES  ON AIRLINE(GENDER,CLASS);

-- AIRLINE_CODEDROP INDEX INDEX_BUSINESS_FEMALE_CNT;


-- PERFORMANCE QUERIES SET 3
-- 1 PERCENTAGE OF MALE PASSENGERS
CREATE OR REPLACE PROCEDURE MALEPERCENT AS
CNTTOTAL NUMBER;
CNTMALE NUMBER;
RES NUMBER(5,2);
BEGIN
SELECT COUNT(GENDER) INTO CNTTOTAL FROM AIRLINE;
SELECT COUNT(GENDER) INTO CNTMALE FROM AIRLINE WHERE GENDER='Male';
RES:=CNTMALE/CNTTOTAL*100;
DBMS_OUTPUT.PUT_LINE('THE TOTAL PERCENTAGE OF MALE PASSENGERS ARE : '||RES);
END;
/

BEGIN
MALEPERCENT();
END;
/
-- 2 PERCENTAGE OF FEMALE PASSENGERS
CREATE OR REPLACE PROCEDURE FEMALEPERCENT AS
CNTTOTAL NUMBER;
CNTFEMALE NUMBER;
RES NUMBER(5,2);
BEGIN
SELECT COUNT(GENDER) INTO CNTTOTAL FROM AIRLINE;
SELECT COUNT(GENDER) INTO CNTFEMALE FROM AIRLINE WHERE GENDER='Female';
RES:=CNTFEMALE/CNTTOTAL*100;
DBMS_OUTPUT.PUT_LINE('THE TOTAL PERCENTAGE OF FEMALE PASSENGERS ARE : '||RES);
END;
/

BEGIN
FEMALEPERCENT();
END;
/


--3 PERCENTAGE OF BUSINESS CLASS PASSENGERS

CREATE OR REPLACE PROCEDURE BUSINESSCLSPERCENT AS
CNTTOTAL NUMBER;
CNTBUSINESSCLS NUMBER;
RES NUMBER(5,2);
BEGIN
SELECT COUNT(CLASS) INTO CNTTOTAL FROM AIRLINE;
SELECT COUNT(CLASS) INTO CNTBUSINESSCLS FROM AIRLINE WHERE CLASS='Business';
RES:=CNTBUSINESSCLS/CNTTOTAL*100;
DBMS_OUTPUT.PUT_LINE('THE TOTAL PERCENTAGE OF BUSINESS CLASS PASSENGERS ARE : '||RES);
END;
/

BEGIN
BUSINESSCLSPERCENT();
END;
/


--4 PERCENTAGE OF PASSENGERS WHO BOOK AN ECO CLASS TICKET

CREATE OR REPLACE PROCEDURE ECOCLSPERCENT AS
CNTTOTAL NUMBER;
CNTECOCLS NUMBER;
RES NUMBER(5,2);
BEGIN
SELECT COUNT(CLASS) INTO CNTTOTAL FROM AIRLINE;
SELECT COUNT(CLASS) INTO CNTECOCLS FROM AIRLINE WHERE CLASS='Eco';
RES:=CNTECOCLS/CNTTOTAL*100;
DBMS_OUTPUT.PUT_LINE('THE TOTAL PERCENTAGE OF ECO CLASS PASSENGERS ARE : '||RES);
END;
/

BEGIN
ECOCLSPERCENT();
END;
/

--5 PERCENTAGE OF MALE PASSENGERS WHO BOOK AN BUSINESS CLASS TICKET

CREATE OR REPLACE PROCEDURE BUSINESSCLSMALEPERCENT AS
CNTTOTAL NUMBER;
CNTBUSINESSCLSMALE NUMBER;
RES NUMBER(5,2);
BEGIN
SELECT COUNT(CLASS) INTO CNTTOTAL FROM AIRLINE;
SELECT COUNT(CLASS) INTO CNTBUSINESSCLSMALE FROM AIRLINE WHERE CLASS='Business' AND GENDER='Male';
RES:=CNTBUSINESSCLSMALE/CNTTOTAL*100;
DBMS_OUTPUT.PUT_LINE('THE TOTAL PERCENTAGE OF BUSINESS CLASS MALE PASSENGERS ARE : '||RES);
END;
/

BEGIN
BUSINESSCLSMALEPERCENT();
END;
/