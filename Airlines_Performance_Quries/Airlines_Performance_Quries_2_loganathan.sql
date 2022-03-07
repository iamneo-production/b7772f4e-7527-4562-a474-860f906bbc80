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
