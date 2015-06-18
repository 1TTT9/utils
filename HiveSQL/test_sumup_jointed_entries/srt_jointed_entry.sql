

-- (1) this query from tb_a (left) join tbl_b (right), it spent much time than (2).
SELECT a.money FROM test_jointbl_a a left join test_jointbl_b b on a.label=b.label AND a.age=b.age WHERE b.money>a.money;
-- (2)
SELECT a.money FROM test_jointbl_b b left outer join test_jointbl_a a on a.label=b.label AND a.age=b.age WHERE b.money>a.money;
