set @mytable='member',
@mytag='(name, address, age, city, birday)',
@myvalue='("harold", "brooklin", 49, "D.C", curdate())',
@myquery=concat('insert into ', @mytable , @mytag, ' values ', @myvalue);
PREPARE stmt from @myquery;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @mycond='city="tokyo" AND age>30',
@myquery=concat('select * from ', @mytable, ' where ', @mycond);
PREPARE stmt from @myquery;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


set @myanswer="none", @mycond='city="tokyo" AND age>30',
@myquery=concat('select * from ', @mytable, ' where ', @mycond); 
PREPARE stmt from @myquery; EXECUTE stmt; DEALLOCATE PREPARE stmt;

set @myanswername='myanswer',
@myquery=concat('drop table ', @myanswername);
PREPARE stmt from @myquery; EXECUTE stmt; DEALLOCATE PREPARE stmt;

set @ds='(name varchar(50), address varchar(50), age int, city varchar(50), birday datetime)',
@myquery=concat('create table ', @myanswername, @ds);

set @mytable='member',
@mycond='city="tokyo" AND age>30', 
@myquery=concat('select * from ', @mytable, ' where ', @mycond);
PREPARE stmt from @myquery; EXECUTE stmt; DEALLOCATE PREPARE stmt;
select @myanswer;

# select * from @mytable where @mycond;

set @mytable='member', @mycond='city="tokyo" AND age<30'; 
set @myquery=concat('select * from ', @mytable, ' where ', @mycond);  
set @myanswername='myanswer'; 
set @myquery2=concat('create temporary table ', @myanswername, ' as select * from (', @myquery, ' ) t'); 
PREPARE stmt from @myquery2; EXECUTE stmt; DEALLOCATE PREPARE stmt;
select @myanswer;




set @mycond='city="tokyo" AND age>30', 
@myquery=concat('select * from ', @mytable, ' where ', @mycond);

@myquery=concat('insert overwrite table ', @myanswername, ' ', @myquery);
PREPARE stmt from @myquery; EXECUTE stmt; DEALLOCATE PREPARE stmt;
select @myanswer;




set @mycond='city="tokyo" AND age>30', 
@myquery=concat('select * from ', @mytable, ' where ', @mycond, ' INTO @mycond');
#set @myquery=concat('select * into @myanswer from (', @myquery, ')old;'); 
PREPARE stmt from @myquery; EXECUTE stmt; DEALLOCATE PREPARE stmt;
select @myanswer;




USE test;
DELIMITER $$
CREATE PROCEDURE GETNID()
BEGIN
  SET @query = 'SELECT 100 INTO @nid';
  PREPARE statement1 FROM @query;
  EXECUTE statement1;
END$$
DELIMITER ; 
And to call the procedure:

CALL GETNUMBER();
SELECT @nid;
