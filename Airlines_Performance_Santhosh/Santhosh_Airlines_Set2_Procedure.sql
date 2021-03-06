--1. Count the Female Passengers who are all booking 'Business' Class?
CREATE OR REPLACE FUNCTION FEMALE_BUSINESS_CLASS
RETURN VARCHAR
IS
    FEMALE_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO FEMALE_COUNT
    FROM AIRLINE
    WHERE GENDER = 'Female' AND CLASS = 'Business';
    RETURN 'THE COUNT OF FEMALE BUSINESS CLASS PASSENGERS : '||FEMALE_COUNT;
    DBMS_OUTPUT.PUT_LINE('THE COUNT OF FEMALE BUSINESS CLASS PASSENGERS : '||FEMALE_COUNT);
END;

DECLARE
    A VARCHAR(1000);
BEGIN
    A:=FEMALE_BUSINESS_CLASS();
    DBMS_OUTPUT.PUT_LINE(A);
END;

--2. Count The Male Passengers list of each booking class Wise?

CREATE OR REPLACE PROCEDURE CLASS_MALE_PASSENGER
AS
BEGIN
    FOR C IN (SELECT CLASS, COUNT(*) AS COUNT_PASSENGER
                FROM AIRLINE
                WHERE GENDER = 'Male' 
                GROUP BY CLASS)
    LOOP
        DBMS_OUTPUT.PUT_LINE(C.CLASS||' '||C.COUNT_PASSENGER);
    END LOOP;
END;
/

BEGIN
    CLASS_MALE_PASSENGER();
END;
--END OF 2

--3. Find The Passengers who are all booking a ticket age above 15 in Business class?

CREATE OR REPLACE PROCEDURE ADULT_BUSINESS_PASSENGER
AS
    TYPE A_PASS IS TABLE OF VARCHAR(100);
    AB_PASS A_PASS := A_PASS();
BEGIN
    SELECT ID
    BULK COLLECT INTO AB_PASS
    FROM AIRLINE
    WHERE AGE > 15 AND CLASS = 'Business';

    FOR C IN AB_PASS.FIRST..AB_PASS.LAST
    LOOP
        DBMS_OUTPUT.PUT_LINE(AB_PASS(C));
    END LOOP;
END;
/

BEGIN
    ADULT_BUSINESS_PASSENGER();
END;

--4. Count the Passengers in each Customer Type?

CREATE OR REPLACE PROCEDURE TYPE_PASSENGER
AS
BEGIN
    FOR C IN (SELECT CUSTOMER_TYPE,COUNT(*) AS COUNT_CUSTOMER_TYPE
                FROM AIRLINE
                GROUP BY CUSTOMER_TYPE)
    LOOP
        DBMS_OUTPUT.PUT_LINE(C.CUSTOMER_TYPE||' '||C.COUNT_CUSTOMER_TYPE);
    END LOOP;
END;
/

BEGIN
    TYPE_PASSENGER();
END;

--END OF 4

--5. Display the passenger details who are all booking Eco class?

CREATE OR REPLACE PROCEDURE ECO_PASSENGER_DETAILS
AS
    TYPE ECO_PASSENGER IS TABLE OF VARCHAR(100);
    ECO_DETAILS ECO_PASSENGER := ECO_PASSENGER();
BEGIN
    SELECT ID
    BULK COLLECT INTO ECO_DETAILS
    FROM AIRLINE
    WHERE CLASS = 'Eco';
    
    FOR C IN ECO_DETAILS.FIRST..ECO_DETAILS.LAST
    LOOP
        DBMS_OUTPUT.PUT_LINE(ECO_DETAILS(C));
    END LOOP;
END;
/
BEGIN
    ECO_PASSENGER_DETAILS();
END;
--END OF 5