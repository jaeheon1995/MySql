use practice_sql;

-- 거래내역 테이블
-- 거래번호 정수
-- 거래일자 날짜
-- 거래구분 가변문자열10
-- 내역 장문의문자열
-- 금액 정수
-- 세금 정수 
-- 비고 장문의 문자열 

create table transaction(
	transaction_number int,
    transaction_date date,
    transaction_type varchar(10),
    breakdown TEXT,
    amount int,
	tax int,
	note text
);

INSERT INTO transaction 
VALUES (1, '2024-07-10', '구매', '기타자재', 100000, 0, null);

INSERT INTO transaction 
VALUES (2, '2024-07-10', '판매', '영양제', 700000, 70000, '종합 비타민');

INSERT INTO transaction 
VALUES (3, '2024-07-12', '판매', '영양제', 1200000, 120000, '종합 비타민');

INSERT INTO transaction 
VALUES (4, '2024-07-13', '구매', '책상', 4000000, 0, '4개 구매');

INSERT INTO transaction 
VALUES (5, '2024-07-13', '구매', '노트북', 10000000, 0, '4대 구매');

INSERT INTO transaction 
VALUES (6, '2024-07-17', '판매', '의약외품', 2000000, 200000, '소염진통제');

INSERT INTO transaction 
VALUES (7, '2024-07-18', '구매', '기타자재', 100000, 0, '볼펜 및 노트');

INSERT INTO transaction 
VALUES (8, '2024-07-19', '판매', '의약외품', 1500000, 150000, '소염진통제');

INSERT INTO transaction 
VALUES (9, '2024-07-20', '판매', '의료기구', 8000000, 800000, '휠체어');

INSERT INTO transaction 
VALUES (10, '2024-07-21', '판매', '영양제', 400000, 40000, '오메가3');

-- 연산자 

-- 산술연산자
-- +,-,*,/,% 

select amount + tax, breakdown from transaction;

-- 비교연산자(where 절에서 자주사용)
-- 원하는 레코드를 정확히 조회하는데 중요한 역할

-- = : 좌항이 우항과 같으면 true 를 반환해줌
select * from transaction where transaction_type = '구매';

-- <>,!= : 좌항이 우항과 다르면 true
select * from transaction where transaction_type <> '구매';

select * from transaction where transaction_type != '구매';

-- < :좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
select * from transaction where amount < 1000000;
select * from transaction where amount <= 1000000;

-- > : 좌항이 우항보다 크면 true 
-- .= : 좌항이 우항보다 크거나 같으면 true
select * from transaction where amount > 1200000;
select * from transaction where amount >= 1200000;

alter table transaction
add complete boolean;

update transaction set complete = true
where (transaction_number % 3) = 1;

update transaction set complete = false
where (transaction_number % 3) = 2;
select * from transaction;

update transaction set note = null
where  transaction_number = 6;
select * from transaction;

-- <=> : 좌항과 우항이 모두 null 이면 true
select * from transaction where note <=> complete;

-- is :좌항이 우항과 같으면 true  (키워드)
-- is not : 좌항이 우항과 다르면 true (키워드)

select * from transaction  where complete is true;
select * from transaction where complete is null;
select * from transaction where complete is not null;
select * from transaction where complete is not true;

-- between a and b : 좌항이 a보다 크거나 같으면서 b보다 작거나 같으면 true
--  not between a and b : 좌항이 a보다 작거나 b보다 크면 true
select * from transaction where transaction_date between '2024-07-15' and '2024-07-20';
select * from transaction where transaction_date not between '2024-07-15' and '2024-07-20';

-- in() : 주어진 각 리스트 중 하나라도 일치하면 true
-- not in(): 주어진 리스트 중 하나도 일치하지 않을때 true

select * from transaction where breakdown in('노트북', '책상');

-- 논리연산자 
-- and (&&) : 좌항과 우항이 모두true 일때 true
select * from transaction where transaction_type ='판매' and amount >= 1500000;

-- or (||) : 좌항과 우항중 하나라도 true 일때 true
select * from transaction where transaction_date >= '2024-07-15' or transaction_type = '판매';

-- xor : 좌항과 우항이 서로 다르면 true
select * from transaction where transaction_date >= '2024-07-15' xor transaction_type = '판매';

-- like 연산자 :  문자열을 패턴을 기준으로 비교하고자 할 때 사용
-- % : 임의의 개수(0~무한대) 의 문자 표현
-- _ : 임의의 한 개 문자 표현

select * from transaction where transaction_date like '2024-07-%';
select * from transaction where transaction_date like '2024-07-__';
select * from transaction where breakdown like '의%';
select * from transaction where transaction_date like '%-10';
select * from transaction where transaction_date like '2024-__-13';

-- 정령
-- order by : 조회결과를 특정 컬럼 기준으로 정렬하는 방법 
-- asc : 오름차순 / desc: 내림차순
select * from transaction order by amount asc;
select * from transaction order by amount desc;

select * from transaction order by tax;
select * from transaction order by tax, amount desc;

-- 중복제거 
-- distinct : select 결과 테이블에서 컬럼의 조합의 중복을 제거하여 출력
select distinct breakdown from transaction;
select distinct breakdown, amount from transaction;