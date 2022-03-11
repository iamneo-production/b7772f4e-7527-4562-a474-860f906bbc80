-- SET -1 Selection Queries

-- 1. Count how many Female passengers book an air ticket?
SELECT COUNT(*) INTO F_COUNT
FROM AIRLINE
WHERE GENDER = 'Female';

-- 2. Count the passenger list class-wis
SELECT  CLASS AS CLASS, COUNT(*) AS CLASS_TOTAL
FROM AIRLINE
GROUP BY CLASS;

-- 3. Display the passenger count who is all booking business Class
SELECT COUNT(*) INTO PASS_COUNT
FROM AIRLINE
WHERE CLASS = 'Business';

-- 4. Count the kid passenger list? (kid = age is less than 13)
SELECT COUNT(*) INTO KIDS_COUNT
FROM AIRLINE
WHERE AGE < 13;

-- 5. Count the passenger list of each Travel type?
SELECT COUNT(*) AS TTYPE_COUNT, TYPE_OF_TRAVEL AS TRAVEL_TYPE_NAME
FROM AIRLINE
GROUP BY TYPE_OF_TRAVEL;

-- 6. Display the count of passengers booking eco class?
SELECT COUNT(*) INTO ECO_PASSENGER
FROM AIRLINE
WHERE CLASS = 'Eco';

-- 7. Count the passenger list above age 16 and book a business class?
SELECT COUNT(*) INTO ADULT_PASSENGER
FROM AIRLINE
WHERE AGE > 16 AND CLASS = 'Business';

-- 8. Count the passenger list of each satisfaction? 
SELECT SATISFACTION, COUNT(*) AS SATISFACTION_COUNT
FROM AIRLINE
GROUP BY SATISFACTION;

-- 9. Display the customer type where gender is male and display them according to the class?
SELECT CUSTOMER_TYPE
FROM AIRLINE
WHERE GENDER = 'Male'
ORDER BY CLASS;

-- 10. Count the passenger list of each satisfaction?
SELECT SATISFACTION,COUNT(*) AS COUNT 
FROM AIRLINE
GROUP BY SATISFACTION;


-- SET - 2
--1. Count the Female Passengers who are all booking 'Business' Class?
SELECT COUNT(*) INTO FEMALE_COUNT
FROM AIRLINE
WHERE GENDER = 'Female' AND CLASS = 'Business';

-- 2. Count The Male Passengers list of each booking class Wise?
SELECT CLASS, COUNT(*) AS COUNT_PASSENGER
FROM AIRLINE
WHERE GENDER = 'Male' 
GROUP BY CLAS;

-- 3. Find The Passengers who are all booking a ticket age above 15 in Business class?
SELECT ID
BULK COLLECT INTO AB_PASS
FROM AIRLINE
WHERE AGE > 15 AND CLASS = 'Business';

-- 4. Count the Passengers in each Customer Type?
SELECT CUSTOMER_TYPE,COUNT(*) AS COUNT_CUSTOMER_TYPE
FROM AIRLINE
GROUP BY CUSTOMER_TYPE;

-- 5. Display the passenger details who are all booking Eco class?
SELECT ID
FROM AIRLINE
WHERE CLASS = 'Eco';

-- SET - 3
-- 1. Find how many Percentages of male Passengers book an air ticket?
SELECT COUNT(GENDER) INTO TOTAL_GENDER
FROM AIRLINE;
SELECT COUNT(*) INTO TOTAL_MALE
FROM AIRLINE
WHERE GENDER = 'Male';

-- 2. Find how many Percentages of female Passengers book an air ticket?
 SELECT COUNT(*) INTO TOTAL_GENDER
FROM AIRLINE;
SELECT COUNT(*) INTO TOTAL_FEMALE
FROM AIRLINE
WHERE GENDER = 'Female';

-- 3. Find how many Percentages of Passengers book a business class Ticket?
SELECT COUNT(CLASS) INTO TOTAL_PASSENGER
FROM AIRLINE;
SELECT COUNT(*) INTO TOTAL_BUSINESS
FROM AIRLINE
WHERE CLASS = 'Business';

-- 4. Find how many Percentages of passengers book an Eco class Ticket?
 SELECT COUNT(*) INTO TOTAL_PASSENGER
FROM AIRLINE;
SELECT COUNT(*) INTO TOTAL_ECO
FROM AIRLINE
WHERE CLASS = 'Eco';

-- 5. Find how many Percentages of male Passengers book a business class Ticket?
SELECT COUNT(GENDER) INTO TOTAL_GENDER
FROM AIRLINE;
SELECT COUNT(*) INTO TOTAL_MALE
FROM AIRLINE
WHERE GENDER = 'Male' AND CLASS = 'Business';

