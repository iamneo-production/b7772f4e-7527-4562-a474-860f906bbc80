
--1. Count how many Female passengers book an air ticket?
CREATE OR REPLACE PROCEDURE F_PASSENGER
AS
F_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO F_COUNT
    FROM AIRLINE
    WHERE GENDER = 'Female';
    DBMS_OUTPUT.PUT_LINE('COUNT IF THE FEMALE PASSENGER BOOKED TICKETS: ' || F_COUNT);
END;
/

BEGIN
    F_PASSENGER();
END;
/
--END OF 1

--2. Count the passenger list class-wise

create index Index_Airine on AIRLINE (CLASS);

SELECT CLASS
FROM AIRLINE;

SELECT COUNT(CLASS),CLASS
FROM AIRLINE
GROUP BY CLASS;

-- 2. Count the passenger list class-wise?

CREATE OR REPLACE PROCEDURE CLASS_WISE_LIST
AS
CLASS_TOTAL NUMBER;
BEGIN
    FOR C IN ( SELECT  CLASS AS CLASS, COUNT(*) AS CLASS_TOTAL
                FROM AIRLINE
                GROUP BY CLASS)
    LOOP
        DBMS_OUTPUT.PUT_LINE(C.CLASS || ' : ' || C.CLASS_TOTAL);
    END LOOP;
END;
/

BEGIN
    CLASS_WISE_LIST();
END;
/
--END OF 2
                
--3. Display the passenger count who is all booking business Class;     

CREATE OR REPLACE PROCEDURE BUSINESS_PASSENGERS
AS
    PASS_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO PASS_COUNT
    FROM AIRLINE
    WHERE CLASS = 'Business';
    DBMS_OUTPUT.PUT_LINE('COUNT OF BUSINESS CLASS PASSENGER : '||PASS_COUNT);
END;
/
SELECT COUNT(*) AS BUSINESS_CLASS FROM AIRLINE WHERE CLASS='Business';

BEGIN
    BUSINESS_PASSENGERS();
END;
/
-- END OF 3

--4. Count the kid passenger list? (kid = age is less than 13)

CREATE OR REPLACE PROCEDURE KID_PASSENGER
AS
    KIDS_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO KIDS_COUNT
    FROM AIRLINE
    WHERE AGE < 13;
    DBMS_OUTPUT.PUT_LINE('COUNT OF THE KIS PASSENGER : '||KIDS_COUNT);
END;
/

BEGIN 
    KID_PASSENGER();
END;
/
-- END OF 4

-- 5. Count the passenger list of each Travel type?

CREATE OR REPLACE PROCEDURE TRAVEL_TYPE
AS
BEGIN
    FOR C IN (SELECT COUNT(*) AS TTYPE_COUNT, TYPE_OF_TRAVEL AS TRAVEL_TYPE_NAME
    FROM AIRLINE
    GROUP BY TYPE_OF_TRAVEL)
    LOOP
    DBMS_OUTPUT.PUT_LINE( C.TRAVEL_TYPE_NAME|| ' ' || C.TTYPE_COUNT);
    END LOOP;
END;
/

BEGIN 
    TRAVEL_TYPE();
END;
/

SELECT TYPE_OF_TRAVEL
FROM AIRLINE
GROUP BY TYPE_OF_TRAVEL;
-- END OF 5

-- 6. Display the count of passengers booking eco class?
CREATE OR REPLACE PROCEDURE ECO_PASSENGER
AS
    ECO_PASSENGER NUMBER;
BEGIN
    SELECT COUNT(*) INTO ECO_PASSENGER
    FROM AIRLINE
    WHERE CLASS = 'Eco';
    DBMS_OUTPUT.PUT_LINE('THE COUNT OF ECO PASSENGER : ' ||ECO_PASSENGER);
END;
/

BEGIN
    ECO_PASSENGER();
END;
/
-- END OF 6

--7. Count the passenger list above age 16 and book a business class?

CREATE OR REPLACE PROCEDURE BUSINESS_ADULT
AS
    ADULT_PASSENGER NUMBER;
BEGIN 
    SELECT COUNT(*) INTO ADULT_PASSENGER
    FROM AIRLINE
    WHERE AGE > 16 AND CLASS = 'Business';
    DBMS_OUTPUT.PUT_LINE(ADULT_PASSENGER);
END;
/

BEGIN 
    BUSINESS_ADULT();
END;
/

-- 8. Count the passenger list of each satisfaction? 

CREATE OR REPLACE PROCEDURE SATISFACTION
AS
BEGIN
    FOR C IN (SELECT SATISFACTION, COUNT(*) AS SATISFACTION_COUNT
                FROM AIRLINE
                GROUP BY SATISFACTION)
    LOOP
        DBMS_OUTPUT.PUT_LINE(C.SATISFACTION ||' : '|| C.SATISFACTION_COUNT);
    END LOOP;
END;
/

BEGIN
    SATISFACTION();
END;
/
-- END OF 8

-- 9. Display the customer type where gender is male and display them according to the class?

CREATE OR REPLACE PROCEDURE C_TYPE
AS
    TYPE C_LIST IS TABLE OF VARCHAR2(100);
    CUS_LIST C_LIST := C_LIST();
    CUS_LIST2 C_LIST := C_LIST();
    S_TIME NUMBER;
    E_TIME NUMBER;
BEGIN
    --s_TIME := DBMS_UTILITY.GET_TIME;
    SELECT CUSTOMER_TYPE
    BULK COLLECT INTO CUS_LIST         -- BULK COLLECT METHOOD --
    FROM AIRLINE
    WHERE GENDER = 'Male'
    ORDER BY CLASS;
    FOR C IN CUS_LIST.FIRST..CUS_LIST.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE(CUS_LIST(C));
    END LOOP;
    --E_TIME := DBMS_UTILITY.GET_TIME;
    --DBMS_OUTPUT.PUT_LINE(E_TIME-S_TIME);
END;
/

BEGIN
    C_TYPE();
END;
--END OF 9 

-- 10. Count the passenger list of each satisfaction?

CREATE OR REPLACE PROCEDURE COUNT_SATISFACTION
AS
BEGIN
    FOR C IN (SELECT SATISFACTION,COUNT(*) AS COUNT 
                FROM AIRLINE
                GROUP BY SATISFACTION)
    LOOP
        DBMS_OUTPUT.PUT_LINE(C.SATISFACTION || ' : ' || C.COUNT);
    END LOOP;
END;
/

BEGIN
    COUNT_SATISFACTION();
END;
/
--END OF 10
