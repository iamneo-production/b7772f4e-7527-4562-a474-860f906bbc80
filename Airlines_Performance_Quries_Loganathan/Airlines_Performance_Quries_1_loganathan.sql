
--------------------------------Performance Quries Set 1 ------------------------------------
-->INDEX
CREATE INDEX AIRLINES_SATIS_I 
ON AIRLINE(ID,CLASS,SATISFACTION,CUSTOMER_TYPE,TYPE_OF_TRAVEL); 

CREATE INDEX AIRLINES_ID_I 
ON AIRLINE(ID);
SELECT * FROM AIRLINE;
---------------------------------------------------------------------------------------------
-->1.Count the female passengers book an air ticket

-->Qurie
SELECT 
    COUNT(1)
FROM
    AIRLINE
WHERE
    GENDER = 'Female';

-->Function
CREATE OR REPLACE FUNCTION TOTAL_FEMALE_PASSENGER
RETURN VARCHAR
IS
    Female_Count NUMBER := 0;
BEGIN
    SELECT 
        COUNT(1) 
    INTO 
        Female_Count
    FROM 
        AIRLINE 
    WHERE 
        GENDER = 'Female';
    RETURN 'TOTAL FEMALE PASSENGERS '||Female_Count;
END;
/
---------------------------------------------------------------------------------------------
-->2. Count the passenger list class-wise

-->Qurie
SELECT
    CLASS,
    COUNT(1)
FROM
    AIRLINE
GROUP BY 
    CLASS;

-->Procedure    
CREATE OR REPLACE PROCEDURE TOTAL_PASSENGER_CLASS_WISE
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
    GROUP BY 
        CLASS;
    DBMS_OUTPUT.PUT_LINE('Class Name'||'               '||'Total Passengers');
    FOR I IN  1 .. clsname.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(clsname(I)||'          '||'            '||Total_Count(I));
    END LOOP;
END;
/
---------------------------------------------------------------------------------------------
-->3.The passenger count who is all booking business Class

-->Qurie
SELECT
    /*+NO_INDEX(AIRLINE)*/COUNT(1)
FROM
    AIRLINE
WHERE 
    CLASS = 'Business';

-->EXPLAIN PLAN

EXPLAIN PLAN FOR
SELECT
    /*+NO_INDEX(AIRLINE)*/COUNT(1)
FROM
    AIRLINE
WHERE 
    CLASS = 'Business';

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY);
/*
--------------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
--------------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 1 | 7 | 73 (2)| 00:00:01 |
	
| 1 | SORT AGGREGATE | | 1 | 7 | | |
	
|* 2 | INDEX FAST FULL SCAN| INDEX_AIRINE | 49665 | 339K| 73 (2)| 00:00:01 |
	
-------------------------------------------------------------------------------------- 
*/

-->Function
CREATE OR REPLACE FUNCTION TOTAL_BUSINESS_CLASS_PASS
RETURN VARCHAR
IS
    Business_Total NUMBER;
BEGIN
    SELECT 
        COUNT(1)
    INTO
        Business_Total
    FROM 
        AIRLINE 
    WHERE 
        CLASS = 'Business';
    RETURN 'Total Bussiness class Passengers '||Business_Total;
END;
/
---------------------------------------------------------------------------------------------
-->4. Count the kid passenger list? (kid = age is less than 13)

-->Qurie
SELECT
    COUNT(AGE)
FROM
    AIRLINE
WHERE
    AGE < 13;

-->Function
CREATE OR REPLACE FUNCTION TOTAL_KID_PASSENGER
RETURN VARCHAR
IS
    Kid_Total NUMBER;
BEGIN
    SELECT
        COUNT(AGE)
    INTO
        Kid_Total
    FROM
        AIRLINE
    WHERE
        AGE < 13;
    RETURN 'Total Kid Passengers '||Kid_Total;
END;
/
---------------------------------------------------------------------------------------------
-->5. Count the passenger list of each Travel type

-->Qurie
SELECT
    TYPE_OF_TRAVEL,
    COUNT(1)
FROM
    AIRLINE
GROUP BY
    TYPE_OF_TRAVEL;

-->Procedure
CREATE OR REPLACE PROCEDURE TOTAL_PASS_TRAVEL_TYPE
IS
    TYPE type_name IS TABLE OF VARCHAR(32);
    TYPE cnt IS TABLE OF NUMBER;
    typename type_name;
    Total_Count cnt;
BEGIN    
    SELECT
        TYPE_OF_TRAVEL,
        COUNT(1)
    BULK COLLECT INTO
        typename,
        Total_Count
    FROM
        AIRLINE
    GROUP BY
        TYPE_OF_TRAVEL;
    DBMS_OUTPUT.PUT_LINE('Travel Type'||'               '||'Total Passengers');
    FOR I IN  1 .. typename.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(typename(I)||'          '||'            '||Total_Count(I));
    END LOOP;
END;
/
---------------------------------------------------------------------------------------------
-->6. Count of passengers booking eco class

-->Qurie
SELECT
    COUNT(1)
FROM
    AIRLINE
WHERE
    CLASS = 'Eco'
GROUP BY
    CLASS;

-->Function
CREATE OR REPLACE FUNCTION TOTAL_ECO_CLASS_PASS
RETURN VARCHAR
IS
    Eco_Total NUMBER;
BEGIN
    SELECT
        COUNT(1)
    INTO
        Eco_Total
    FROM
        AIRLINE
    WHERE
        CLASS = 'Eco'
    GROUP BY
        CLASS;
    RETURN 'Total Eco Class Passengers '||Eco_Total;
END;
/
---------------------------------------------------------------------------------------------
-->7. Count the passenger list above age 16 and book a business class

-->Qurie
SELECT
    COUNT(1) 
FROM
    AIRLINE
WHERE
    AGE > 16 AND CLASS = 'Business';

-->Function
CREATE OR REPLACE FUNCTION TOTAL_PASSENGER_AGE16
RETURN VARCHAR
IS
    Age_Total NUMBER;
BEGIN
    SELECT
        COUNT(1) 
    INTO
        Age_Total
    FROM
        AIRLINE
    WHERE
        AGE > 16 AND CLASS = 'Business';
    RETURN 'Total Passengers Under age > 16 = '||Age_Total;
END;
/
---------------------------------------------------------------------------------------------
-->8. Count the passenger list of each satisfaction

-->Qurie
SELECT
    SATISFACTION,
    COUNT(1)
FROM
    AIRLINE
GROUP BY
    SATISFACTION;    

-->Procedure
CREATE OR REPLACE PROCEDURE TOTAL_PASS_SATISFACTION
IS
    TYPE type_name IS TABLE OF VARCHAR(32);
    TYPE cnt IS TABLE OF NUMBER;
    typename type_name;
    Total_Count cnt;
BEGIN    
    SELECT
        SATISFACTION,
        COUNT(1)
    BULK COLLECT INTO
        typename,
        Total_Count
    FROM
        AIRLINE
    GROUP BY
        SATISFACTION;    
    DBMS_OUTPUT.PUT_LINE('Satisfaction'||'               '||'Total Passengers');
    FOR I IN  1 .. typename.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(typename(I)||'          '||'            '||Total_Count(I));
    END LOOP;
END;
/
---------------------------------------------------------------------------------------------
-->9. Display the customer type where gender is male and display them according to the class

-->Qurie
SELECT
    CUSTOMER_TYPE,
    CLASS
FROM
    AIRLINE
WHERE 
    GENDER = 'Male'
GROUP BY
    CLASS,CUSTOMER_TYPE
ORDER BY
    CLASS DESC;

-->Procedure
CREATE OR REPLACE PROCEDURE TOTAL_PASS_CUSTYPE_MALE
IS
    TYPE type_name IS TABLE OF VARCHAR(32);
    typename type_name;
    class_name type_name;
BEGIN    
    SELECT
        CUSTOMER_TYPE,
        CLASS
    BULK COLLECT INTO
        typename,
        class_name
    FROM
        AIRLINE
    WHERE 
        GENDER = 'Male'
    GROUP BY
        CLASS,CUSTOMER_TYPE
    ORDER BY
        CLASS DESC;
    DBMS_OUTPUT.PUT_LINE('Customer Type'||'               '||'Total Passengers');
    FOR I IN  1 .. typename.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(typename(I)||'          '||'            '||class_name(I));
    END LOOP;
END;
/
---------------------------------------------------------------------------------------------
-->10. Count the passenger list of each satisfaction? 

-->Qurie
SELECT
    SATISFACTION,
    COUNT(1)
FROM
    AIRLINE
GROUP BY
    SATISFACTION;    

-->Procedure    
CREATE OR REPLACE PROCEDURE TOTAL_PASS_SATISFACTION
IS
    TYPE type_name IS TABLE OF VARCHAR(32);
    TYPE cnt IS TABLE OF NUMBER;
    typename type_name;
    Total_Count cnt;
BEGIN    
    SELECT
        SATISFACTION,
        COUNT(1)
    BULK COLLECT INTO
        typename,
        Total_Count
    FROM
        AIRLINE
    GROUP BY
        SATISFACTION;    
    DBMS_OUTPUT.PUT_LINE('Satisfaction'||'               '||'Total Passengers');
    FOR I IN  1 .. typename.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(typename(I)||'          '||'            '||Total_Count(I));
    END LOOP;
END;
/
---------------------------------------------------------------------------------------------

--Reference Quries
SELECT 
    TOTAL_FEMALE_PASSENGER() 
FROM 
    DUAL;

SELECT 
    TOTAL_BUSINESS_CLASS_PASS() 
FROM 
    DUAL;

SELECT 
    TOTAL_KID_PASSENGER() 
FROM 
    DUAL;

SELECT
    TOTAL_ECO_CLASS_PASS()
FROM
    DUAL;

SELECT
    TOTAL_PASSENGER_AGE16()
FROM
    DUAL;


DROP FUNCTION COUNT_FEMALE_PASSENGER;

SELECT 
    * 
FROM 
    AIRLINE;

SELECT
    *
FROM
    AIRLINE
WHERE
    GENDER = 'Male';

EXEC TOTAL_PASSENGER_CLASS_WISE();
EXEC TOTAL_PASS_TRAVEL_TYPE();
EXEC TOTAL_PASS_SATISFACTION();
EXEC TOTAL_PASS_CUSTYPE_MALE();

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
    SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
    TOTAL_PASS_SATISFACTION();
    SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
    SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
    TOTAL_PASS_TRAVEL_TYPE();
    SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/
/*
>>Before Index created OUTPUT
Travel Type               Total Passengers
Business travel                      71655
Personal Travel                      32249
Time = +000000000 00:00:00.016265000

>>After Index created OUTPUT
Travel Type               Total Passengers
Business travel                      71655
Personal Travel                      32249
Time = +000000000 00:00:00.015924000
*/

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
    SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
    TOTAL_PASS_CUSTYPE_MALE();
    SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/

DESC AIRLINE;

SELECT * FROM AIRLINE;

-->View all INDEX
SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'AIRLINE';