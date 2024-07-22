-- 주석
-- 데이터 정의어(DDL)
-- 데이터 베이스,테이블,사용자 등(스키마)을 정의하는데 사용되는 언어
-- CREAT : 구조를 생성하는 명령어
-- CREAT 생성할구조 구조이름[...구조의 정의];

-- 데이터베이스 생성
CREATE DATABASE practice_sql;
-- 데이터베이스 사용 : 데이터베이스 작업을 수행하기 전에 반드시 작업할데이터 베이스를 선택해야함
USE practice_sql;

-- 테이블 생성
CREATE TABLE example_table (
	example_column1 INT, 
    example_column2 BOOLEAN
);

-- 컬럼데이터 타입
CREATE TABLE data_type (
-- INT : 정수 타입
	int_column int,
-- double : 실수타입
	double_column double,
-- float : 실수타입
	float_column float,
-- boolean : 논리타입
	boolean_column boolean,
-- varchar(문자열길이):가변길이 문자열
	string_column varchar(10),
-- text : 단순 장문 문자열 
	text_column text,
-- date: 날짜
	date_column date,
-- datetime : 날짜및시간
	datetime_column datetime
);

-- 사용자 생성
-- CREATE USER '사용자명''@''접속ip' IDENTIGIED BY '비밀번호';
CREATE USER 'developer'@'127.0.0.1' identified BY 'p!ssw0rd';

CREATE USER 'deverloper'@'%' identified by 'p!ssw0rd';

-- drop : 데이터 구조(스키마)를 삭제하는 명령어
-- drop 스키마명

-- 사용자 삭제
drop user 'deverloper'@'%';

-- 테이블 삭제
-- 해당테이블을 참조하고 있는 다른테이블이 존재하면 테이블 삭제 불가
DROP table exaple_table;

-- 데이터베이스 삭제
drop database practice_sql;

-- alter : 구조를 변경하는 명령어
-- 테이블의 컬럼 추가
alter table example_table 
ADD example_coloumn3 varchar(10);

-- 테이블 컬럼 삭제
alter table example_table
Drop column example_coloumn3;

-- 테이블 컬럼 타입수정
alter table example_table
modify column example_column2 TEXT;

-- 테이블 컬럼 전체수정
alter table example_table
change example_column1 column1 varchar(20);

-- 데이터베이스 문자셋 수정
alter database practice_sql default character set utf8;

 









