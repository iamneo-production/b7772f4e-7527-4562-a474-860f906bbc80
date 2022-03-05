/*1. TABLE NAME: PASSENGER*/
CREATE TABLE PASSENGER (PASSENGER_ID	NUMBER, 
                        FIRST_NAME         	VARCHAR(32)	NOT NULL, 
                        MIDDLE_NAME      	VARCHAR(32),
                        LAST_NAME           	VARCHAR(32)  	NOT NULL, 
                        DOB 			DATE 		NOT NULL,
                        AGE 			NUMBER 	NOT NULL, 
                        GENDER 		VARCHAR(32) 	NOT NULL, 
                        PASSENGER_TYPE 	VARCHAR(32),
                        PRIMARY KEY(PASSENGER_ID));
drop table passenger;
/*2. TABLE NAME: PADDRESS_DETAILS*/
CREATE TABLE PADDRESS_DETAILS (PASSENGER_ID	NUMBER	NOT NULL, 
                                EMAIL        		VARCHAR(32)	NOT NULL,
                                PHONE		      	VARCHAR(32) 	NOT NULL,
                                COUNTRY           		VARCHAR(32)  	NOT NULL, 
 		                        STATE			VARCHAR(32),
                                CITY 			VARCHAR(32) 	NOT NULL, 
                                ZIP_CODE 		VARCHAR(32) 	NOT NULL, 
                                FOREIGN KEY(PASSENGER_ID)
                                REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE);

/*3. TABLE NAME: VACCINATION_DETAILS*/
CREATE TABLE VACCINATION_DETAILS (  VACCIN_ID		NUMBER, 
                                    PASSENGER_ID        	NUMBER	NOT NULL,
                                    VACCIN_NAME	      	VARCHAR(32) 	NOT NULL,
                                    VACCIN_STATUS          	VARCHAR(32)  	NOT NULL, 
                                    PRIMARY KEY(VACCIN_ID), 
                                    FOREIGN KEY(PASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE );

/*4. TABLE NAME: TRAVEL_AGENCY*/
CREATE TABLE TRAVEL_AGENCY (TRAVELAGENCY_ID		NUMBER, 
                            AGENCY_NAME           		VARCHAR(32)  	NOT NULL,
                            AGENCY_PHONE      		VARCHAR(32) 	NOT NULL,
                            AGENCY_ADDRESS		VARCHAR(50)  	NOT NULL,
                            AGENCY_DISCODE        		VARCHAR(32)	NOT NULL UNIQUE,
                            AGENCY_DISAMOUNT		NUMBER	NOT NULL, 
                            PRIMARY KEY(TRAVELAGENCY_ID));

/*5. TABLE NAME: TRAVELAGENCY_PASSENGERS*/
CREATE TABLE TRAVELAGENCY_PASSENGERS (  TPASSENGER_ID		NUMBER	NOT NULL,
						                TRAVELAGENCY_ID		NUMBER	NOT NULL,
                                        FOREIGN KEY(TPASSENGER_ID) REFERENCES 
                                        PASSENGER(PASSENGER_ID) ON DELETE CASCADE,
                                        FOREIGN KEY(TRAVELAGENCY_ID) REFERENCES TRAVEL_AGENCY(TRAVELAGENCY_ID) ON DELETE CASCADE);

/*6. TABLE NAME: MILITARY_PASSENGER*/
CREATE TABLE MILITARY_PASSENGER     (MPASSENGER_ID		NUMBER,
                                    TRAVELAGENCY_ID		NUMBER	NOT NULL,
                                    MILITARYDISCOUNT_CODE	NUMBER	NOT NULL,
                                    MILITARYDISCOUNT_AMT	NUMBER	NOT NULL,
                                    FOREIGN KEY(MPASSENGER_ID) REFERENCES
                                    PASSENGER(PASSENGER_ID) ON DELETE CASCADE,
                                    FOREIGN KEY(TRAVELAGENCY_ID) REFERENCES
                                    TRAVEL_AGENCY(TRAVELAGENCY_ID) ON DELETE CASCADE);

/*7. TABLE NAME: FREQUENT_PASSENGER*/
CREATE TABLE FREQUENT_PASSENGER    (FPASSENGER_ID		NUMBER,
                                    FPASSENGER_MILEAGE		NUMBER	NOT NULL,
                                    FREQFLYCOUNT		NUMBER	NOT NULL,
                                    MILEAGEEXPDATE		DATE		NOT NULL,
                                    MILEAGEBALANCE		NUMBER	NOT NULL,
                                    PRIMARY KEY(FPASSENGER_ID),
                                    FOREIGN KEY(FPASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE);

/*8. TABLE NAME: CREDITCARD_DETAILS*/

CREATE TABLE CREDITCARD_DETAILS(CREDITCARDNUM	NUMBER,
                                MERCHANT_NAME	VARCHAR(32)		NOT NULL,
                                EXPDATE		DATE			NOT NULL,
                                PRIMARY KEY(CREDITCARDNUM));

/*9. TABLE NAME: PCREDITCARD_DETAILS*/
CREATE TABLE PCREDITCARD_DETAILS(   CREDITCARDNUM	NUMBER	NOT NULL,
                                    CPASSENGER_ID	NUMBER	NOT NULL,
                                    FOREIGN KEY(CREDITCARDNUM) REFERENCES CREDITCARD_DETAILS(CREDITCARDNUM),
                                    FOREIGN KEY(CPASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE);
/*10. TABLE NAME: TRANSACTIONS*/
CREATE TABLE TRANSACTIONS(  TRANS_ID		NUMBER,
                            TOTAL_AMOUNT	NUMBER	NOT NULL,
                            CHARGES		NUMBER	NOT NULL,
                            DISCOUNT		NUMBER,	
                            PRIMARY KEY(TRANS_ID));

/*11. TABLE NAME: PASSENGER_TRANSACTIONS*/
CREATE TABLE PASSENGER_TRANSACTIONS(TRANS_ID	    NUMBER,
                                    TPASSENGER_ID 	NUMBER,
                                    FLIGHT_NUMBER	VARCHAR2(5),
                                    DEPARTURE_DATE	DATE,
                                    BOOKING_DATE	DATE,
                                    PRIMARY KEY(TRANS_ID),
                                    FOREIGN KEY(TPASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID) ON DELETE CASCADE);

select *
from tab;
