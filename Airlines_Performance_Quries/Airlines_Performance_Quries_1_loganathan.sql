-->Performance Quries Set 1 

-->1.Count the female passengers book an air ticket
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

-->2. Count the passenger list class-wise
SELECT 
    CLASS "Travel Class", 
    COUNT(1) "Passenger Count" 
FROM 
    AIRLINE 
GROUP BY 
    CLASS;

-->3.The passenger count who is all booking business Class
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

-->4. Count the kid passenger list? (kid = age is less than 13)
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

-->5. Count the passenger list of each Travel type
SELECT
    TYPE_OF_TRAVEL,
    COUNT(1) "Passenger Count"
FROM
    AIRLINE
GROUP BY
    TYPE_OF_TRAVEL;

-->6. Count of passengers booking eco class
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

-->7. Count the passenger list above age 16 and book a business class
SELECT
    COUNT(1) "Passenger Count Age > 16 and Business class"
FROM
    AIRLINE
WHERE
    AGE > 16 AND CLASS = 'Business';

-->8. Count the passenger list of each satisfaction
SELECT
    SATISFACTION,
    COUNT(1) "Passenger Count"
FROM
    AIRLINE
GROUP BY
    SATISFACTION;    

-->9. Display the customer type where gender is male and display them according to the class
SELECT
    CUSTOMER_TYPE,
    CLASS
FROM
    AIRLINE
WHERE 
    GENDER = 'Male'
ORDER BY
    CLASS DESC;


-->10. Count the passenger list of each satisfaction? 

SELECT
    SATISFACTION,
    COUNT(1) "Passenger Count"
FROM
    AIRLINE
GROUP BY
    SATISFACTION;    

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

DESC AIRLINE;

--To view all Indexies from Table AIRLINE