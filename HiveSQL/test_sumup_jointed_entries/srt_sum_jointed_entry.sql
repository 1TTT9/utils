
SELECT sum(money)
FROM (
	SELECT 
	  a.label,
	  a.age,
	  a.money 
	FROM 
	  test_jointbl_b b 
	left outer join 
	  test_jointbl_a a 
	on a.label=b.label AND a.age=b.age 
	WHERE b.money>a.money
) t1
group by t1.label, t1.age
;

