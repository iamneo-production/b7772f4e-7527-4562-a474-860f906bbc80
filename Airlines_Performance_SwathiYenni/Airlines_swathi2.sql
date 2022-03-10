--1.Count the female passengers who all are booking the business class??

create or replace PROCEDURE female_businesscls
as
fcount NUMBER;
BEGIN
    select count(*) into fcount from AIRLINE where GENDER='Female' and CLASS='Business';
    dbms_output.put_line('Female passengers booking the business class: '||fcount);
END;
/
BEGIN
female_businesscls();
END;
/
--END OF 1.

--2.Count the male passenger list of each booking class wise??

create or replace Procedure class_wise_passengermale
as
BEGIN
for i in (
    select CLASS,count(*) as count_passenger from AIRLINE where GENDER='Male' group by CLASS
)
loop
    dbms_output.put_line(i.CLASS||'--->'||i.count_passenger);
end loop;
END;
/
begin 
    class_wise_passengermale();
end;
/
select count(*),CLASS from AIRLINE where GENDER='Male' group by CLASS;
--END OF 2.

--3.Find the passengers who are all booking a ticket age above 15 in business class??


create or replace Procedure passenger_business_aboveage15
as
    
BEGIN
    for i in(
    select ID from AIRLINE where AGE>15 and CLASS='Business')
    loop
    dbms_output.put_line(i.ID);
    end loop;

END;
/
begin 
    passenger_business_aboveage15();
end;
/
select ID from AIRLINE where AGE>15 and CLASS='Business';

--4.Count the passenger in each customertype??


create or replace Procedure passenger_customer_type
as
BEGIN
for i in (
    select CUSTOMER_TYPE,count(*) as count_customer from AIRLINE  group by CUSTOMER_TYPE
)
loop
    dbms_output.put_line(i.CUSTOMER_TYPE||'--->'||i.count_customer);
end loop;
END;
/
begin 
    passenger_customer_type();
end;
/
--END OF 4.

--5.Display the passenger details who are  all booking eco class??

create or replace Procedure passenger_eco_class
as
BEGIN
for i in (
    select ID  from AIRLINE where CLASS='Eco'
)
loop
    dbms_output.put_line(i.ID);
end loop;
END;
/
begin 
    passenger_eco_class();
end;
/