--1.Count how many female passengers book an air ticket??

create or replace Procedure female_count
IS 
fcountt number;
BEGIN
    select count(GENDER) into fcountt from AIRLINE where GENDER='Female';
    dbms_output.put_line('Female count is: '||fcountt);
END;
/
begin 
    female_count();
end;
/
--END OF 1.

--2.Count the passenger list class_wise??

create or replace Procedure class_wise_passenger
as
BEGIN
for i in (
    select CLASS,count(*) as swathi from AIRLINE group by CLASS
)
loop
    dbms_output.put_line(i.CLASS||'--->'||i.swathi);
end loop;
END;
/
begin 
    class_wise_passenger();
end;
/
--END OF 2.

--3.Display the passenger count who is all booking the business class??

create or replace Procedure business_class
IS 
bcountt number;
BEGIN
    select count(*) into bcountt from AIRLINE where class='Business';
    dbms_output.put_line('Business class: '||bcountt);
END;
/
begin 
    business_class();
end;
/
--END OF 3.

--4 Count the Kid passenger list??

create or replace Procedure kid_passengers
IS 
kcountt number;
BEGIN
    select count(*) into kcountt from AIRLINE where age<13;
    dbms_output.put_line('kid passengers: '||kcountt);
END;
/
begin 
    kid_passengers();
end;
/
--END OF 4.

--5.Count the passenger list of each travel type??

create or replace Procedure travel_types
as
BEGIN
for i in (
    select TYPE_OF_TRAVEL,count(*) as swathi from AIRLINE group by TYPE_OF_TRAVEL
)
loop
dbms_output.put_line(i.TYPE_OF_TRAVEL||'--->'||i.swathi);
end loop;
END;
/
begin 
travel_types();
end;
/
--END OF 5.

--6.Display the count of the passengers booking the ecoclass??

create or replace Procedure eco_classes
IS 
ecountt number;
BEGIN
    select count(*) into ecountt from AIRLINE where CLASS='Eco';
    dbms_output.put_line('ECO CLASS: '||ecountt);
END;
/
begin 
eco_classes();
end;
/
--END OF 6.

--7.Count the passenger list above age 16 and book a business class??

create or replace Procedure businessclass_age
IS 
mcountt number;
BEGIN
    select count(*) into mcountt from AIRLINE where AGE>16 and CLASS='Business';
    dbms_output.put_line('Female co: '||mcountt);
END;
/
begin 
businessclass_age();
end;
/
--END OF 7.

--8.Count the passenger list of each satisfaction???

create or replace Procedure satisfaction_passenger
as
BEGIN
for i in (
    select SATISFACTION,count(*) as swathi from AIRLINE group by SATISFACTION
)
loop
dbms_output.put_line(i.SATISFACTION||'-->'||i.swathi);
end loop;
END;
/
begin 
satisfaction_passenger();
end;
/
--END OF 8.

--9.Display the customertype where gender is male and display them according to the class??

create or replace Procedure customertype_gender_male
as
BEGIN
for i in (
    select  CLASS,CUSTOMER_TYPE from AIRLINE WHERE GENDER='Female' order by CLASS
)
loop
dbms_output.put_line(i.CLASS||'-->'||i.CUSTOMER_TYPE);
end loop;
END;
/
begin 
customertype_gender_male();
end;
/
--END OF 9.

--10.Count the passenger list of each satisfaction??

create or replace Procedure satisfaction_passenger
as
BEGIN
for i in (
    select SATISFACTION,count(*) as swathi from AIRLINE group by SATISFACTION
)
loop
dbms_output.put_line(i.SATISFACTION||'-->'||i.swathi);
end loop;
END;
/
begin 
satisfaction_passenger();
end;
/
--END OF 10.