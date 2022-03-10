--1.Find how many Percentages of male passengers book an air ticket??

create or replace Procedure Percentage_male
as
    total_cust number;
    male_cust number;
    percent number;
BEGIN
    select count(*) into total_cust from AIRLINE;
    select count(*) into male_cust from AIRLINE where GENDER='Male';
    percent:=round((male_cust/total_cust)*100);
    dbms_output.put_line(percent);
END;
/
begin 
Percentage_male();
end;
/

--2.Find how many Percentages of female passengers book an air ticket??

create or replace Procedure Percentage_female
as
    total_cust number;
    female_cust number;
    percent number;
BEGIN
    select count(*) into total_cust from AIRLINE;
    select count(*) into female_cust from AIRLINE where GENDER='Female';
    percent:=round((female_cust/total_cust)*100);
    dbms_output.put_line(percent);
END;
/
begin 
Percentage_female();
end;
/

--3.Find how many percentages of passengers book a business class ticket??

create or replace Procedure Percentage_Business_class
as
    total_cust number;
    busines number;
    percent number;
BEGIN
    select count(*) into total_cust from AIRLINE;
    select count(*) into busines from AIRLINE where CLASS='Business';
    percent:=round((busines/total_cust)*100);
    dbms_output.put_line(percent);
END;
/
begin 
Percentage_Business_class();
end;
/

--4.Find how many percentages of passengers book a eco class ticket??

create or replace Procedure Percentage_eco_class
as
    total_cust number;
    eco number;
    percent number;
BEGIN
    select count(*) into total_cust from AIRLINE;
    select count(*) into eco from AIRLINE where CLASS='Eco';
    percent:=round((eco/total_cust)*100);
    dbms_output.put_line(percent);
END;
/
begin 
Percentage_eco_class();
end;
/

--5.Find how many percentages of male passengers book a business class ticket??

create or replace Procedure Percentage_Business_class
as
    total_cust number;
    busines number;
    percent number;
BEGIN
    select count(*) into total_cust from AIRLINE;
    select count(*) into busines from AIRLINE where CLASS='Business' and GENDER='Male';
    percent:=round((busines/total_cust)*100);
    dbms_output.put_line(percent);
END;
/
begin 
Percentage_Business_class();
end;
/
