
--1. TABLE NAME: PASSENGER

CREATE TABLE PASSENGER (PASSENGER_ID	NUMBER, 
                        FIRST_NAME      VARCHAR(32)	NOT NULL, 
                        MIDDLE_NAME    	VARCHAR(32),
                        LAST_NAME      	VARCHAR(32) NOT NULL, 
                        DOB 			DATE 		NOT NULL,
                        AGE 			NUMBER 	    NOT NULL, 
                        GENDER 	    	VARCHAR(32) NOT NULL, 
                        PASSENGER_TYPE 	VARCHAR(32),
                        PRIMARY KEY(PASSENGER_ID) );

--2.TABLE NAME: PADDRESS_DETAILS

CREATE TABLE PADDRESS_DETAILS ( PASSENGER_ID	NUMBER      	NOT NULL, 
                                EMAIL        	VARCHAR(32)	    NOT NULL,
                                PHONE		    VARCHAR(32) 	NOT NULL,
                                COUNTRY         VARCHAR(32)  	NOT NULL, 
 		                        STATE			VARCHAR(32),
                                CITY 			VARCHAR(32) 	NOT NULL, 
                                ZIP_CODE 		VARCHAR(32) 	NOT NULL, 
                                FOREIGN KEY(PASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE  );

--3. TABLE NAME: VACCINATION_DETAILS

CREATE TABLE VACCINATION_DETAILS (  VACCIN_ID		    NUMBER, 
                                    PASSENGER_ID        NUMBER	        NOT NULL,
                                    VACCIN_NAME	      	VARCHAR(32) 	NOT NULL,
                                    VACCIN_STATUS       VARCHAR(32)  	NOT NULL, 
                                    PRIMARY KEY(VACCIN_ID), 
                                    FOREIGN KEY(PASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE  );

--4. TABLE NAME: TRAVEL_AGENCY

CREATE TABLE TRAVEL_AGENCY (TRAVELAGENCY_ID		NUMBER, 
                            AGENCY_NAME         VARCHAR(32)  	NOT NULL,
                            AGENCY_PHONE      	VARCHAR(32) 	NOT NULL,
                            AGENCY_ADDRESS		VARCHAR(50)  	NOT NULL,
                            AGENCY_DISCODE      VARCHAR(32)	    NOT NULL UNIQUE,
                            AGENCY_DISAMOUNT	NUMBER	        NOT NULL, 
                            PRIMARY KEY(TRAVELAGENCY_ID));

--5. TABLE NAME: TRAVELAGENCY_PASSENGERS

CREATE TABLE TRAVELAGENCY_PASSENGERS (  TPASSENGER_ID		NUMBER	NOT NULL,
                						TRAVELAGENCY_ID		NUMBER	NOT NULL,
                                        FOREIGN KEY(TPASSENGER_ID) REFERENCES 
                                        PASSENGER(PASSENGER_ID) ON DELETE CASCADE,
                                        FOREIGN KEY(TRAVELAGENCY_ID) REFERENCES
                                        TRAVEL_AGENCY(TRAVELAGENCY_ID) ON DELETE CASCADE);



--6. TABLE NAME: MILITARY_PASSENGER

CREATE TABLE MILITARY_PASSENGER (   MPASSENGER_ID		    NUMBER,
                                    TRAVELAGENCY_ID		    NUMBER	NOT NULL,
                                    MILITARYDISCOUNT_CODE	NUMBER	NOT NULL,
                                    MILITARYDISCOUNT_AMT	NUMBER	NOT NULL,
                                    FOREIGN KEY(MPASSENGER_ID) REFERENCES
                                    PASSENGER(PASSENGER_ID) ON DELETE CASCADE,
                                    FOREIGN KEY(TRAVELAGENCY_ID) REFERENCES
                                    TRAVEL_AGENCY(TRAVELAGENCY_ID) ON DELETE CASCADE);


--7. TABLE NAME: FREQUENT_PASSENGER

CREATE TABLE FREQUENT_PASSENGER(FPASSENGER_ID		NUMBER,
                                FPASSENGER_MILEAGE	NUMBER	NOT NULL,
                                FREQFLYCOUNT		NUMBER	NOT NULL,
                                MILEAGEEXPDATE		DATE	NOT NULL,
                                MILEAGEBALANCE		NUMBER	NOT NULL,
                                PRIMARY KEY(FPASSENGER_ID),
                                FOREIGN KEY(FPASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE)

--8. TABLE NAME: CREDITCARD_DETAILS

CREATE TABLE CREDITCARD_DETAILS(CREDITCARDNUM	NUMBER,
                                MERCHANT_NAME	VARCHAR(32)		NOT NULL,
                                EXPDATE		    DATE			NOT NULL,
                                PRIMARY KEY(CREDITCARDNUM))

--9. TABLE NAME: PCREDITCARD_DETAILS

CREATE TABLE PCREDITCARD_DETAILS(   CREDITCARDNUM	NUMBER	NOT NULL,
                                    CPASSENGER_ID	NUMBER	NOT NULL,
                                    FOREIGN KEY(CREDITCARDNUM) REFERENCES CREDITCARD_DETAILS(CREDITCARDNUM),
                                    FOREIGN KEY(CPASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE)
--10. .TABLE NAME: TRANSACTIONS

CREATE TABLE TRANSACTIONS(  TRANS_ID		NUMBER,
                            TOTAL_AMOUNT	NUMBER	NOT NULL,
                            CHARGES		    NUMBER	NOT NULL,
                            DISCOUNT		NUMBER,	
                            PRIMARY KEY(TRANS_ID))

--11. TABLE NAME: PASSENGER_TRANSACTIONS

CREATE TABLE PASSENGER_TRANSACTIONS(TRANS_ID	    NUMBER,
                                    TPASSENGER_ID 	NUMBER,
                                    FLIGHT_NUMBER	VARCHAR2(5),
                                    DEPARTURE_DATE	DATE,
                                    BOOKING_DATE	DATE,
                                    PRIMARY KEY(TRANS_ID),
                                    FOREIGN KEY(TPASSENGER_ID) REFERENCES 
                                    PASSENGER(PASSENGER_ID) ON DELETE CASCADE);


--12. TABLE NAME: AIRLINES

	CREATE TABLE AIRLINES(AIRLINE_CODE		VARCHAR(32),
				AIRLINE_NAME		        VARCHAR(50)		NOT NULL,
                HEAD_ADDRESS	            VARCHAR(100)	NOT NULL,
                PRIMARY KEY(AIRLINE_CODE))

--13. TABLE NAME: AIRPORT

CREATE TABLE AIRPORT(   AIRPORT_CODE	VARCHAR(32),
                        AIRPORT_NAME	VARCHAR(50)		NOT NULL,
                        STATE			VARCHAR(30)		NOT NULL,
                        CITY			VARCHAR(30)		NOT NULL,
                        PRIMARY KEY(AIRPORT_CODE));


--14. TABLE NAME: FLIGHTS

CREATE TABLE FLIGHTS(   FLIGHT_NUMBER	    VARCHAR(5),
                        AIRLINE_CODE		VARCHAR(32)		NOT NULL,
                        DESTINATION		    VARCHAR(32)		NOT NULL,
                        SEAT_CAPACITY	    NUMBER		    NOT NULL,
                        FLIGHT_TYPE		    VARCHAR(32)		NOT NULL,
                        PRIMARY KEY(FLIGHT_NUMBER),
                        FOREIGN KEY(AIRLINE_CODE) REFERENCES
                        AIRLINES(AIRLINE_CODE) ON DELETE CASCADE);


--15. TABLE NAME: FLIGHT_DESTINATION_AIRPORT

CREATE TABLE FLIGHT_DESTINATION_AIRPORT(FLIGHT_NUMBER	    VARCHAR2(5)	NOT NULL,
                                        AIRPORT_CODE		VARCHAR(32)	NOT NULL,	
                                        FOREIGN KEY(FLIGHT_NUMBER) REFERENCES
                                        FLIGHTS(FLIGHT_NUMBER) ON DELETE CASCADE,
                                        FOREIGN KEY(AIRPORT_CODE) REFERENCES
                                        AIRPORT(AIRPORT_CODE) ON DELETE CASCADE)

--16. TABLE NAME: FLIGHT_ARRIVAL_AIRPORT

CREATE TABLE FLIGHT_ARRIVAL_AIRPORT(    FLIGHT_NUMBER	    VARCHAR2(5)	NOT NULL,
                                        AIRPORT_CODE		VARCHAR(15)	NOT NULL,
                                        FOREIGN KEY(FLIGHT_NUMBER) REFERENCES
                                        FLIGHTS(FLIGHT_NUMBER) ON DELETE CASCADE,
                                        FOREIGN KEY(AIRPORT_CODE) REFERENCES
                                        AIRPORT(AIRPORT_CODE) ON DELETE CASCADE)



--17. TABLE NAME: PRICE_DETAILS

CREATE TABLE PRICE_DETAILS( AIRLINE_CODE 	VARCHAR(15)	NOT NULL,
                            FLIGHT_NUMBER	VARCHAR2(5)	NOT NULL,
                            CLASS1			NUMBER	NOT NULL,
                            CLASS2			NUMBER	NOT NULL,
                            CLASS3			NUMBER	NOT NULL,
                            FOREIGN KEY(FLIGHT_NUMBER) REFERENCES
                            FLIGHTS(FLIGHT_NUMBER) ON DELETE CASCADE,
                            FOREIGN KEY(AIRLINE_CODE) REFERENCES
                            AIRLINES(AIRLINE_CODE) ON DELETE CASCADE);

  
--18. TABLE NAME: DISCOUNTS

CREATE TABLE DISCOUNTS( AIRLINE_CODE	VARCHAR(15)	    NOT NULL,
                        FLIGHT_NUMBER	VARCHAR2(15)	NOT NULL,
                        DISCOUNT		NUMBER	        DEFAULT 0,
                        FOREIGN KEY(AIRLINE_CODE) REFERENCES AIRLINES(AIRLINE_CODE) ON DELETE CASCADE,
                        FOREIGN KEY(FLIGHT_NUMBER) REFERENCES FLIGHTS(FLIGHT_NUMBER) ON DELETE CASCADE); 


SELECT TO_CHAR(SYSDATE,'HH:MM:SS'),TO_CHAR(SYSDATE+INTERVAL '24' HOUR,'HH24:MI:SS AM') FROM DUAL

--19. TABLE NAME: FLIGHT_TIMINGS

CREATE TABLE FLIGHT_TIMINGS(FLIGHT_NUMBER		VARCHAR2(5),
                            FLIGHT_TIME		TIMESTAMP	NOT NULL,
                            FLIGHT_DATE		DATE		NOT NULL,
                            ARRIVAL_TIME		TIMESTAMP	NOT NULL,
                            DEPARTURE_TIME		TIMESTAMP	NOT NULL,
                            FOREIGN KEY(FLIGHT_NUMBER) REFERENCES FLIGHTS(FLIGHT_NUMBER) ON DELETE CASCADE);
				

--20. TABLE NAME: INSURANCE

CREATE TABLE INSURANCE( INSURANCE_ID		NUMBER,
                        IPASSENGER_ID		NUMBER,
                        INSURANCE_AMT		NUMBER	NOT NULL,
                        INSURANCEDATE	    DATE	NOT NULL,
                        INSURANCEEXPDATE	DATE	NOT NULL,
                        PRIMARY KEY (INSURANCE_ID),
                        FOREIGN KEY (IPASSENGER_ID) REFERENCES PASSENGER (PASSENGER_ID) ON DELETE CASCADE);      

--DROP TABLE INSURANCE;

--21. TABLE NAME: RESERVATION

CREATE TABLE RESERVATION(   RESERVATION_ID	NUMBER,
                            FLIGHT_NUMBER	VARCHAR2(5),
                            PASSENGER_ID	NUMBER,
                            TARVELCLASS_ID	NUMBER	NOT NULL,
                            COST			NUMBER	NOT NULL,
                            SEAT_NUMBER		NUMBER	NOT NULL,
                            INSURANCE_ID	NUMBER,
                            LUGGAGE_ID		NUMBER	UNIQUE,
                            FOOD_ID		    NUMBER 	UNIQUE,
                            RESERVATION_DATE	DATE		NOT NULL,
                            PRIMARY KEY(RESERVATION_ID),
                            FOREIGN KEY (FLIGHT_NUMBER) REFERENCES FLIGHTS (FLIGHT_NUMBER) ON DELETE CASCADE,
                            FOREIGN KEY (PASSENGER_ID) REFERENCES PASSENGER (PASSENGER_ID) ON DELETE CASCADE,
                            FOREIGN KEY (INSURANCE_ID) REFERENCES INSURANCE (INSURANCE_ID) ON DELETE CASCADE);
----DROP TABLE RESERVATION;


--22. TABLE NAME: FOOD_PRICE

CREATE TABLE FOOD_PRICE(FOOD_TYPEID	NUMBER,
                        FCLASS1_PRICE	NUMBER	NOT NULL,
                        FCLASS2_PRICE	NUMBER	NOT NULL,
                        FCLASS3_PRICE	NUMBER	NOT NULL,
                        PRIMARY KEY (FOOD_TYPEID));


--23. TABLE NAME: FOOD

CREATE TABLE FOOD(  FOOD_ID		    NUMBER,
                    RESERVATION_ID	NUMBER,
                    FOOD_TYPEID		NUMBER,
                    FOOD_CLASS		NUMBER	NOT NULL,
                    PRIMARY KEY (FOOD_ID),
                    FOREIGN KEY (RESERVATION_ID) REFERENCES RESERVATION (RESERVATION_ID) ON DELETE CASCADE,
                    FOREIGN KEY(FOOD_TYPEID) REFERENCES FOOD_PRICE(FOOD_TYPEID) ON DELETE CASCADE);
--DROP TABLE FOOD;




--24. TABLE NAME: RESERVATION_STATUS

CREATE TABLE RESERVATION_STATUS(RESERVATION_ID		    NUMBER,
                                RESERVATION_STATUS		VARCHAR(32)	NOT NULL,
                                FOREIGN KEY (RESERVATION_ID) REFERENCES RESERVATION (RESERVATION_ID) ON DELETE CASCADE);



--25. "_ALL_SQLSET_STATEMENTS_PHV"TABLE NAME: LUGGAGE_DETAILS

CREATE TABLE LUGGAGE_DETAILS(   RESERVATION_ID	NUMBER,
                                LUGGAGE_ID		NUMBER,
                                LUGGAGE_WEIGHT	NUMBER	NOT NULL,
                                LPRICE			NUMBER	NOT NULL,
                                PRIMARY KEY (LUGGAGE_ID),
                                FOREIGN KEY (RESERVATION_ID) REFERENCES RESERVATION (RESERVATION_ID) ON DELETE CASCADE);

--26. TABLE NAME: COST_DETAILS
	
CREATE TABLE COST_DETAILS(  RESERVATION_ID		NUMBER,
                            LUGGAGE_ID		    NUMBER,
                            FOOD_ID		        NUMBER,
                            INSURANCE_ID	    NUMBER,	
                            FOREIGN KEY (RESERVATION_ID) REFERENCES RESERVATION (RESERVATION_ID) ON DELETE CASCADE,
                            FOREIGN KEY (LUGGAGE_ID) REFERENCES LUGGAGE_DETAILS (LUGGAGE_ID) ON DELETE CASCADE,
                            FOREIGN KEY (FOOD_ID) REFERENCES FOOD (FOOD_ID) ON DELETE CASCADE,
                            FOREIGN KEY (INSURANCE_ID) REFERENCES INSURANCE (INSURANCE_ID) ON DELETE CASCADE);


