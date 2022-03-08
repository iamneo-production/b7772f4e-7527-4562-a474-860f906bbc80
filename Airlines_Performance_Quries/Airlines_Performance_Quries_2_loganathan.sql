--> Performance Quries Set 2

-->1. Count the Female Passengers who are all booking 'Business' Class
SELECT
    COUNT(1) "Female and Business Class Passenger Count"
FROM
    AIRLINE
WHERE
    GENDER = 'Female' AND CLASS = 'Business';

-->2. Count The Male Passengers list of each booking class Wise
SELECT
    CLASS,
    COUNT(1) "Total Passenger"
FROM
    AIRLINE
WHERE
    GENDER ='Male'
GROUP BY
    CLASS;

-->3. Find The Passengers who are all booking a ticket age above 15 in Business class
SELECT 
    ID
FROM
    AIRLINE
WHERE
    CLASS = 'Business' AND AGE > 15;

-->4. Count the Passengers in each Customer Type
SELECT
    CUSTOMER_TYPE,
    COUNT(1) "Total Passengers"
FROM
    AIRLINE
GROUP BY
    CUSTOMER_TYPE;

-->5. Display the passenger details who are all booking Eco class
SELECT
    ID
FROM
    AIRLINE
WHERE
    CLASS ='Eco';


SELECT ST_NAME,SUM(COUNT(ST_NAME)),ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) FROM ELECTION WHERE PARTYABBRE = 'BJP'
GROUP BY ST_NAME HAVING ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) > 20;

SELECT * FROM ELECTION;

SELECT YEAR,TOTVOTPOLL,ELECTORS,PARTYABBRE FROM ELECTION WHERE PARTYABBRE ='BJP' 
GROUP BY YEAR,TOTVOTPOLL,ELECTORS,PARTYABBRE;

SELECT 