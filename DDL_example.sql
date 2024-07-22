-- 카타르 아시안컵 데이터

-- 참가국(국가명, 조, 감독, 피파랭킹)
-- 선수(이름, 나이, 포지션, 등번호, 국가)
-- 경기장(경기장 이름, 수용인원, 주소)
-- 심판(이름, 나이, 국적, 포지션)

-- 1,카타르아시안컵 데이터베이스 생성
-- qatar_asian_cup
create database qatar_asian_cup;
use qatar_asian_cup;
-- 2. 개발자 계정 생성
-- qatar_developer / 모든 곳에서 접근 가능 / qatar123
create user 'qatar_developer'@'%' identified by 'qatar123';

-- 3. 테이블생성
-- 3.1. 참가국 : country(name[가변문자열 30], group_name[가변문자열 5], manager[가변문자열 30], lanking[정수])

create table country(
	name varchar(30),
    group_name varchar(5),
    manager varchar(30),
    lanking int
);
-- 3.2 선수: player(name[가변문자열30], age[정수], position[가변 문자열 10], uniform_number[정수], country[가변문자열30])
create table player(
	name varchar(30),
    age int,
	position varchar(10),
    uniform_number int,
    country varchar(30)
);


-- 3.3 경기장 : stadium(name[가변문자열30], volume[정수], address[문자열])
create table stadium(
	name varchar(30),
    volume int,
    address text
);
-- 3.4 심판 : referee (name[가변문자열30], age[정수], country[가변문자열30]), position[가변문자열 10])
create table referee(
	name varchar(30),
	age int,
    country varchar(30),
    position varchar(10)
);
