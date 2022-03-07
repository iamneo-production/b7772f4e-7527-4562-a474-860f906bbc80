-->Performance Quries Set 1 

-->1.Count the female passengers book an air ticket
CREATE OR REPLACE FUNCTION COUNT_FEMALE_PASSENGER
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
SELECT 
    COUNT(1) "Booking Count of Business Class" 
FROM 
    AIRLINE 
WHERE 
    CLASS = 'Business';

-->4. Count the kid passenger list? (kid = age is less than 13)
SELECT
    COUNT(AGE) "Kid Passenger"
FROM
    AIRLINE
WHERE
    AGE < 13;

-->5. Count the passenger list of each Travel type
SELECT
    TYPE_OF_TRAVEL,
    COUNT(1) "Passenger Count"
FROM
    AIRLINE
GROUP BY
    TYPE_OF_TRAVEL;

-->6. Count of passengers booking eco class
SELECT
    CLASS,
    COUNT(1) "Passenger Count"
FROM
    AIRLINE
WHERE
    CLASS = 'Eco'
GROUP BY
    CLASS;

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
    COUNT_FEMALE_PASSENGER() 
FROM 
    DUAL;

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