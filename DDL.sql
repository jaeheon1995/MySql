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
CREATE TABLE exaple_table (
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
CREATE USER 'developer''@''127.0.0.1' identified BY 'p!ssw0rd';

CREATE USER 'deverloper''@''%' identified by 'p!ssw0rd';







