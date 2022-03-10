--------------------------------------Performance Quries Set 3-----------------------------------------

-->1. Find how many Percentages of male Passengers book an air ticket

CREATE OR REPLACE FUNCTION MALE_PERCENT
RETURN VARCHAR
IS
     male_pass NUMBER;
     pass_percent NUMBER;
BEGIN
     SELECT 
          COUNT(GENDER)
     INTO 
          male_pass
     FROM
          AIRLINE        
     WHERE 
          GENDER = 'Male'; 
     
     SELECT
          ROUND(male_pass/COUNT(GENDER)*100,2) 
     INTO
          pass_percent
     FROM 
          AIRLINE; 
     RETURN 'Total Male Percent : '|| pass_percent;
END;
/

SELECT 
     MALE_PERCENT() 
FROM 
     DUAL;
------------------------------------------------------------------------------------------------------
-->2. Find how many Percentages of female Passengers book an air ticket?

CREATE OR REPLACE FUNCTION FEMALE_PERCENT
RETURN VARCHAR
IS
     female_pass NUMBER;
     pass_percent NUMBER;
BEGIN
     SELECT 
          COUNT(GENDER)
     INTO 
          female_pass
     FROM
          AIRLINE       
     WHERE 
          GENDER = 'Female'; 
     SELECT
          ROUND(female_pass/COUNT(GENDER)*100,2) 
     INTO
          pass_percent
     FROM 
          AIRLINE; 
     RETURN 'Total Female Percent : '|| pass_percent;
END;
/

SELECT 
    FEMALE_PERCENT() 
FROM 
     DUAL;
------------------------------------------------------------------------------------------------------
-->3. Find how many Percentages of Passengers book a business class Ticket?

CREATE OR REPLACE PROCEDURE BUS_CLS_PER
IS
     bus_cls NUMBER;
     tot_per NUMBER;
BEGIN
     SELECT 
          COUNT(ID)
     INTO
          bus_cls        
     FROM 
          AIRLINE
     WHERE
          CLASS='Business';         
     SELECT
          ROUND(bus_cls/COUNT(ID)*100,2) 
     INTO
          tot_per
     FROM
          AIRLINE;       
     DBMS_OUTPUT.PUT_LINE('Business Class Ticket Passengers in Percentage : '|| tot_per);      
END;
/

BEGIN
     BUS_CLS_PER();
END;
/
------------------------------------------------------------------------------------------------------
-->4.Find how many Percentages of passengers book an Eco class Ticket?
 
CREATE OR REPLACE PROCEDURE ECO_CLS_PER
IS
     eco_cls NUMBER;
     tot_per NUMBER;
BEGIN
     SELECT 
          COUNT(ID)
     INTO
          eco_cls        
     FROM 
          AIRLINE
     WHERE
          CLASS ='Eco';         
     SELECT
          ROUND(eco_cls/COUNT(ID)*100,2) 
     INTO
          tot_per
     FROM
          AIRLINE;       
     DBMS_OUTPUT.PUT_LINE('Eco Class Ticket Passengers in Percentage : '|| tot_per);      
END;
/

BEGIN
     ECO_CLS_PER();
END;
/
------------------------------------------------------------------------------------------------------
-->5. Find how many Percentages of male Passengers book a business class Ticket?

CREATE OR REPLACE PROCEDURE BUS_CLS_MALE
IS
     bus_cls NUMBER;
     tot_per NUMBER;
BEGIN
     SELECT 
          COUNT(ID)
     INTO
          bus_cls        
     FROM 
          AIRLINE
     WHERE
          CLASS ='Business'
     AND
          GENDER ='Male';         
     
     SELECT
          ROUND(bus_cls/COUNT(ID)*100,2) 
     INTO
          tot_per
     FROM
          AIRLINE;       
     DBMS_OUTPUT.PUT_LINE('Business Class Ticket Male Passengers in Percentage : '|| tot_per);      
END;
/

BEGIN
     BUS_CLS_MALE();
END;
/
SELECT * FROM AIRLINE;
-------------------------------------------------------------------------------------------------------