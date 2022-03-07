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

-->4.


--Reference Quries
SELECT 
    COUNT_FEMALE_PASSENGER() 
FROM 
    DUAL;

SELECT 
    * 
FROM 
    AIRLINE;

DESC AIRLINE;

--To view all Indexies from Table AIRLINE
