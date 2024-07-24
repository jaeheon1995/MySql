-- 데이터베이스생성
-- officetel
create database officetel;
use officetel;

-- 이메일 인증 테이블
create table email_auth (
	email varchar(100) primary key check (email REGEXP 
	'^[a-zA-Z0-9]*@([-.]?[a-zA-Z0-9])*\.[a-zA-Z]{2,4}$'),
	auth_number varchar(4) not null check (auth_number REGEXP '^[0-9]{4}$')
);

-- 회원테이블
create table user (
	id varchar(20) primary key,
    password varchar(255) not null,
    email varchar(100) not null unique,
    join_path varchar(5) not null default 'HOME',
    role varchar(6) not null default 'NORMAL',
    
    constraint user_email_fk foreign key (email) 
    references email_auth (email)
);

-- 게시물테이블

create table board (
	receipt_number int primary key auto_increment,
    title varchar(50) not null,
    status boolean not null default false,
    writer_id varchar(20) not null,
    writer_date datetime not null default now(),
    view_count int not null default 0,
    contents varchar(1000) not null,
    reply text,
    
    constraint writer_fk foreign key (writer_id) 
    references user (id)
);

-- 로그인
select * from user where id = 'a123' and password = 'a123';

select * from user where id = 'a123';

-- 아이디 중복확인 
select * from user where id = 'a123';

-- 이메일인증
insert into email_auth values ('a123@qwer.com', '1234');

-- 이메일인증확인
select * from email_auth where email = 'a123@qwer.com' and auth_number = '1234';

-- 회원가입
insert into user (id,password,email) values ('a123', 'a123', 'a123@qwer.com');

-- 게시물리스트
select
	receipt_number,
    status,
    title,
    writer_id,
    writer_date,
    view_count
from board
where title like '%%'
order by receipt_number desc
limit 0, 10;

-- 게시물 작성
insert into board(title,contents,writer_id)
values ('열두번째 게시물', '안녕하세요', 'a123');

-- 게시물상세보기
update board set view_count = view_count + 1
where receipt_number = 1;

select
	receipt_number,
    title,
    writer_id,
    writer_date,
    view_count,
    contents,
    reply
from board 
where receipt_number = 1;

-- 답글작성
update board set reply = '반갑습니다', status = true
where receipt_number = 1;

-- 게시물수정
update board set title = '게시물수정', contents = '안녕'
where receipt_number = 1;

-- 게시물삭제
delete from board where receipt_number = 4;