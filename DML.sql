
use practice_sql;
-- 데이터 조작어(DML)
-- 테이블에 레코드를 삽입,조회,수정,삭제 할 때 사용

-- insert : 테이블에 레코드를 삽입하는 명령어

-- 1.모든 컬럼에 대하여 삽입
-- insert into 테이블명 values(데이터1,데이터2,...);
-- 테이블 구조의 컬럼 순서에 맞게 모든 데이터를 입력해야 한다
insert into example_table values('데이터1','데이터2');

-- 2.특정컬럼을 선택하여 삽입
-- insert into 테이블명 (컴럼명1,컬럼명2,...) values (데이터1,데이터2,....)
-- 지정한 컬럼의 순서와 데이터의 순서가 동일해야한다.
insert into example_table (example_column2)  values ('선택 데이터 1');

-- select : 테이블에서 레코드르 조회하고자 할때 사용
-- 1. 모든데이터 조회
-- select * from 테이블명;
select * from example_table;

-- 2.특정 컬럼 선택 데이터 조회
-- SELECT column1, column2... FROM table_name;

select column1 from example_table;

-- 3.조건에 맞는 데이터 조회
-- select * from 테이블명 where 조건;

select * from example_table where column1 = '데이터1';

-- update : 테이블에서 레코드를 수정하는 명령어
-- update 테이블명 set 컬럼명1 = 데이터1,데이터2,데이터3,....;
-- update 테이블명 set 컬렴명1 = e데이터1,... where 조건;'

update example_table set column1 = '수정데이터';
select column1 from example_table;
update example_table set column1 = '선택수정데이터' where example_column2 = '데이터2';
select column1 from example_table;

insert into example_table (example_column2)  values ('선택 데이터 1');
insert into example_table (example_column2)  values ('선택 데이터 1');
select column1 from example_table;
update example_table set column1 = '수정데이터';
update example_table set column1 = '선택수정데이터' where example_column2 = '데이터2';

--  delete 테이블에서 레코드를 삭제 할때 사용
-- delete from 테이블명 where 조건
delete from example_table where column1 = '수정데이터';

-- delete from 테이블명
delete from example_table;
select * from example_table;

create table auto_table(
	inx int primary key auto_increment,
    number int
);

insert into auto_table (number
) values (0);

select * from auto_table;

delete from auto_table;
select * from auto_table;

truncate table auto_table;

-- drop table : DDL 테이블구조전체를 제거함
-- truncate table: DDL 테이블 구조만 남기고 형태를 초기화
-- delete from : DML 테이블 레코드만 제거

-- insert into select : 삽입 작업시에 조회 결과를 사용하여 삽입
insert into example_table
select * from example_table where column1 is null;

select * from example_table;

-- update select : 수정 작업시 조회결과를 사용하여 수정
update example_table A set A.column1 = (select B.number 
from auto_table B
where B.inx = 1);