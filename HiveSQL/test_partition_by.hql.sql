[ref 1](https://blog.safaribooksonline.com/2012/12/03/tip-partitioning-data-in-hive/)

-- ====== ====== ====== ====== ====== ====== ======　======　======
-- The following query works fine in small amount of dataset
CREATE TABLE grade_0611(name STRING, math FLOAT, physics FLOAT, english FLOAT, chemistry FLOAT, year STRING, month STRING, day STRING)
ROW FORMAT DELIMITED FIELD TERMINATED BY ','
;

SELECT
  year, month, day, name, Array(math, physics, english, chemistry) as major
FROM
  grade_0611
WHERE
  year=2015 AND
  month=03 AND
  day>=01
;


-- ====== ====== ====== ====== ====== ====== ======　======　======
[** to creat a randomly partitioned data] http://stackoverflow.com/questions/23060613/how-to-create-a-random-partitioned-data-in-hive
[About rand() func]  http://docs.treasuredata.com/articles/hive-functions
[how to use CAST]  https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Types#LanguageManualTypes-int
-- with PARTITIONED BY clause to partition data into 50 piece of set (without date)
CREATE TABLE grade_0611_partitioned(name STRING, major ARRAY<STRING>)
PARTITIONED BY (rID INT)
ROW FORMAT DELIMITED FIELD TERMINATED BY ','
;

INSERT OVERWRITE TABLE grade_0611_partitioned PARTITION(rID)
SELECT
  name, major, CAST(rand()*50 as INT) AS rID
FROM
  grade_0611
;

SELECT
  name, major
FROM
  grade_0611_partitioned
WHERE rID=CAST(rand()*50 as INT)
;