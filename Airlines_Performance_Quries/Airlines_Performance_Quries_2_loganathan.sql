--> Performance Quries Set 2

-->1. Count the Female Passengers who are all booking 'Business' Class
SELECT
    COUNT(1)
FROM
    AIRLINE
WHERE
    GENDER = 'Female' AND CLASS = 'Business';

-->2. Count The Male Passengers list of each booking class Wise
SELECT
    COUNT(1),
    CLASS
FROM
    AIRLINE
WHERE
    GENDER ='Male'
GROUP BY
    CLASS;