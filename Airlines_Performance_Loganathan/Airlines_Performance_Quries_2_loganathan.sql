--------------------------------------Performance Quries Set 2---------------------------------------
-->INDEX
CREATE INDEX AIRLINES_GEN_I
ON AIRLINE(GENDER);
-----------------------------------------------------------------------------------------------------
-->1. Count the Female Passengers who are all booking 'Business' Class

-->Qurie
SELECT
    COUNT(1)
FROM
    AIRLINE
WHERE
    GENDER = 'Female' AND CLASS = 'Business';

-->Function
CREATE OR REPLACE FUNCTION TOTAL_FEMALE_BUSINESS
RETURN VARCHAR
IS
    cnt NUMBER;
BEGIN
    SELECT
        COUNT(1)
    INTO
        cnt
    FROM
        AIRLINE
    WHERE
        GENDER = 'Female' AND CLASS = 'Business';
    RETURN 'Total Female passengers who booked Business class '||cnt;
END;
/
-----------------------------------------------------------------------------------------------------
-->2. Count The Male Passengers list of each booking class Wise

-->Qurie
SELECT
    CLASS,
    COUNT(1)
FROM
    AIRLINE
WHERE
    GENDER ='Male'
GROUP BY
    CLASS;

-->Procedure
CREATE OR REPLACE PROCEDURE TOTAL_MALE_PASSENGER_CLASS_WISE
IS
    TYPE class_name IS TABLE OF VARCHAR(32);
    TYPE cnt IS TABLE OF NUMBER;
    clsname class_name;
    Total_Count cnt;
BEGIN
    SELECT
        CLASS,
        COUNT(1)
    BULK COLLECT INTO
    clsname,
    Total_Count
    FROM
        AIRLINE
    WHERE
        GENDER ='Male'
    GROUP BY
        CLASS;
    DBMS_OUTPUT.PUT_LINE('Class Name'||'               '||'Total Passengers');
    FOR I IN  1 .. clsname.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(clsname(I)||'          '||'            '||Total_Count(I));
    END LOOP;
END;
/
-----------------------------------------------------------------------------------------------------
-->3. Find The Passengers who are all booking a ticket age above 15 in Business class

-->Query
SELECT 
    ID
FROM
    AIRLINE
WHERE
    CLASS = 'Business' AND AGE > 15;

-->Procedure
CREATE OR REPLACE PROCEDURE PASSENGER_BUSINESS_AGE15
IS
    TYPE pass_id IS TABLE OF NUMBER;
    passid pass_id;
BEGIN
    SELECT 
        ID
    BULK COLLECT INTO
        passid
    FROM
        AIRLINE
    WHERE
        CLASS = 'Business' AND AGE > 15;
    FOR I IN  1 .. passid.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(passid(I));
    END LOOP;
END;
/
-----------------------------------------------------------------------------------------------------
-->4. Count the Passengers in each Customer Type

-->Query
SELECT
    CUSTOMER_TYPE,
    COUNT(1)
FROM
    AIRLINE
GROUP BY
    CUSTOMER_TYPE;

-->Procedure    
CREATE OR REPLACE PROCEDURE TOTAL_PASS_CUSTOMER_TYPE
IS
    TYPE cus_type IS TABLE OF VARCHAR(32);
    TYPE cnt IS TABLE OF NUMBER;
    custype cus_type;
    Total_Count cnt;
BEGIN
    SELECT
        CUSTOMER_TYPE,
        COUNT(1)
    BULK COLLECT INTO
        custype,
        Total_Count
    FROM
        AIRLINE
    GROUP BY
        CUSTOMER_TYPE;
    DBMS_OUTPUT.PUT_LINE('Customer Type'||'               '||'Total Passengers');
    FOR I IN  1 .. custype.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(custype(I)||'          '||'            '||Total_Count(I));
    END LOOP;
END;
/
-----------------------------------------------------------------------------------------------------
-->5. Display the passenger details who are all booking Eco class

-->Query
SELECT
    ID 
FROM
    AIRLINE
WHERE
    CLASS ='Eco';

-->Procedure
CREATE OR REPLACE PROCEDURE PASSENGERS_ECO_CLASS
IS
    TYPE pass_id IS TABLE OF NUMBER;
    passid pass_id;
BEGIN
    SELECT
        ID
    BULK COLLECT INTO
        passid
    FROM
        AIRLINE
    WHERE
        CLASS ='Eco';
    FOR I IN  1 .. passid.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(passid(I));
    END LOOP;
END;
/
-----------------------------------------------------------------------------------------------------
-->Reference Quries

SELECT
    TOTAL_FEMALE_BUSINESS()
FROM
    DUAL;

EXEC TOTAL_MALE_PASSENGER_CLASS_WISE();
EXEC PASSENGER_BUSINESS_AGE15();
EXEC TOTAL_PASS_CUSTOMER_TYPE();

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
    SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
    PASSENGERS_ECO_CLASS();
    SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/
--Without Index Time taken by executing Query = Time = +000000000 00:00:00.064029000
--With Index Time taken by executing Query = Time = +000000000 00:00:00.061098000

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
    SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
    TOTAL_PASS_CUSTOMER_TYPE();
    SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/
/*
Customer Type                       Total Passengers
Loyal Customer                          84923
disloyal Customer                       18981
Time = +000000000 00:00:00.020853000
*/