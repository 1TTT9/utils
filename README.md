# Utility tool-set 
---
===
Provide some auxiliary tools or hints with sample codes, such as 'replace one column in a file', 'parse CSV file', 'display n line with condition in a file' and so on.

## 2015/06/18

## ■ Appended
- in HiveSQL, 
  - Folder `test_sumup_jointed_entries/` are uploaded. These scripts in fodler demonstrate how 'left join' and 'right join' query work, and provide an exmaple to sum up the jointed entries on both table.
  - Remember, syntax `left outer join` means map tbl_left.value to tbl_right.value, tbl_right. And `right outer join` map tbl_right.value to tbl_left.value (it may occur NULL because we often put larger table on the right hand side)

## 2015/06/09

## ■ Appended
- in shellscript, 
  - `blanks2tab.py`, (015) sum up assigned column in file

## 2015/05/28

## ■ Appended
- in python, 
  - `blanks2tab.py` uploaded. It demonstrates how to replace multiple blanks between words with tab key. 

## 2015/05/08

## ■ Appended
- in shellscript,  
  - (013) display all results retrieved from `ps` and `grep`, and exclude `grep` itself. ([ref](http://unix.stackexchange.com/questions/74185/how-can-i-prevent-grep-from-showing-up-in-ps-results))  
  - (014) run command through `grep` results in one line.  
    1. '-f3-' in `cut`: means the rest args listing from 3rd arg.  
    2. why use `tr`: to make sure all strings were conjunected along with single space.  
    3. how to execute: here I use `awk` and its parameter $0. but there should be other better ways to do.

## 2015/04/30

## ■ Appended
- in shellscript, (012) kill processes which execute same task.

## 2015/04/25

## ■ Appended
- in shellscript, (1) check user identity. (2) debian version

## 2015/04/04

## ■ Appended
- add Perl/ and Python/ folders
- add sampling.pl and example_draw files

## 2015/03/16

## ■ Appended
- updated utility.sh (008-010)

## ■ Comment
- noted CONTROL CHARACTER (ex. ^B) are typed as `ctrl+v` + `ctrl+b`

## 2015/03/16

## ■ Appended
- examples of `partitioned by` and `explode` clauses in HQL

## ■ Comment
- なし

## 2015/03/15

## ■ Appended
- なし

## ■ Comment
- Classified files by Shell, HQL and SQL and place them into corresponding folders.

===
