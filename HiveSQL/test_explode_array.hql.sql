[ref 1](http://stackoverflow.com/questions/11373543/explode-the-array-of-struct-in-hive)
-- ====== ====== ====== ====== ====== ====== ======　======　======
-- TARGET: explode array from TBL_A and restore them to TBL_B
CREATE TABLE grade_0611(name STRING, math FLOAT, physics FLOAT, english FLOAT, chemistry FLOAT, year STRING, month STRING, day STRING)
ROW FORMAT DELIMITED FIELD TERMINATED BY ','
;

CREATE TABLE grade_0611_partition2(name STRING, major_date ARRAY<STRING>, year STRING, month STRING, day STRING) 
PARTITIONED BY(rID INT)
ROW FORMAT DELIMITED FIELD TERMINATED BY ','
;

INSERT OVERWRITE TABLE grade_0611
SELECT
  name, p2.math AS math, p2.physics as physics, p2.english as english, p2.chemistry as chemistry, year, month, day
FROM
  LATERAL VIEW explode(major_date) grade_0611_partition2 AS p2
;

-- ====== ====== ====== ====== ====== ====== ======　======　======
* inline(ARRAY<STRUCT[,STRUCT]>)