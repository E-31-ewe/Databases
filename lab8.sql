--1. a. Increments given values by 1 and returns it.
CREATE FUNCTION inc(val integer) RETURNS integer AS
$$
BEGIN 
    RETURN val + 1;
END;
$$
    LANGUAGE PLPGSQL;
    
select inc(val: 6);
--2.b.Returns sum of 2 numbers.
CREATE FUNCTION summ(a NUMERIC, b NUMERIC)
  RETURNS NUMERIC AS 
$$
BEGIN
   RETURN a + b;
END;
$$
    LANGUAGE PLPGSQL;

select summ(a: 3, b: 2);
--5.e. Returns two outputs, but has one input.
CREATE  FUNCTION sum_avg(
     VARIADIC List NUMERIC[], 
     OUT total NUMERIC, 
            OUT averagе NUMERIC) 
AS $$ 
BEGIN 
   SELECT INTO total SUM(List[i]) 
   FROM generate_subscripts(list, 1) g(i);
   
    SELECT INTO average AVG (List[i]) 
    FROM generate_subscripts (list, 1) g(i); 
END; $$ 
LANGUAGE plpgsql;

--TRIGGERS

--2.a.Return timestamp of the occured action within the database.


CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   AFTER INSERT
   ON table_name
   NEW.last_date := current_timestamp;
   RETURN NEW;
END;
$$



--2.b.Computes the age of a person when persons’ date of birth is inserted.
CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   AFTER INSERT
   ON table_name
   NEW.age := ;
   RETURN NEW;
END;
$$
--2.d предотвращает удаление
CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   BEFORE UPDATE 
   ON table_name
   NEW.age := ;
   RETURN NEW;
END;
$$

--3.What is the difference between procedure and function?
--A procedure has no return value, while a function does.
--1. The stored procedure can optionally return values ​​using out parameters, but it can also be written in such a way that it does not return a value. But the function must return a value.

--2. A stored procedure cannot be used in a SELECT statement, while a function can be used in a SELECT statement.

    