-- 테이블 찾기 
select * from MEMBER;
select * from MEMBER_SIZE;
select * from AUTH;
select * from GRADE;
select * from PRODUCT;
select * from product_size;
select * from IMAGE;
select * from ORDER_PRODUCT;
select * from ORDERS;
select * from POINT; 
select * from product_detail;
select * from common_board;
select * from reply;


-- 시퀀스 생성
create sequence point_no_seq;
create sequence gno_seq;
create sequence msno_seq;
create sequence ono_seq;
create sequence bno_seq;
create sequence rno_seq;
create sequence pdno_seq;
create sequence psno_seq;
create sequence ino_seq;
create sequence pno_seq;

--시퀀스 삭제
drop sequence point_no_seq;
drop sequence gno_seq;
drop sequence msno_seq;
drop sequence ono_seq;
drop sequence bno_seq;
drop sequence rno_seq;
drop sequence pdno_seq;
drop sequence psno_seq;
drop sequence ino_seq;
drop sequence pno_seq;

-- 테이블 삭제
drop table POINT;
drop table AUTH;
drop table IMAGE;
drop table MEMBER_SIZE;
drop table PRODUCT_SIZE;
drop table PRODUCT;
drop table ORDER_PRODUCT;
drop table ORDERS;
drop table MEMBER;
drop table GRADE;

--회원테이블 중 권한칼럼을 회원상태(활성/비활성)로 변경
alter table member rename column auth to status;

insert into product (product_no, name, price, content, category)
values(product_seq.nextval, '옷',10000,'멋잇네','아우터');
-- 회원등급
insert into grade(gno, grade, percent)
 values (gno_seq.nextval, '브론즈', 5);
insert into grade(gno, grade, percent)
 values (gno_seq.nextval, '실버', 7);
insert into grade(gno, grade, percent)
 values (gno_seq.nextval, '골드', 10);

--회원
insert into member(id, password, name, phone, address, email, point, totalspent, status, gno)
 values('java','1234','핫식스','010-1111-1111','판교','kosta@naver.com',1500,200,'활성','1');
insert into member(id, password, name, phone, address, email, point, totalspent, status, gno)
 values('spring','1234','아무개','010-1234-5678','분당','kosta2@naver.com',2000,20000,'활성','2');

--포인트
insert into point(point_no, id, updown) 
values(point_no_seq.nextval,'java',1000);
insert into point(point_no, id, updown) 
values(point_no_seq.nextval,'spring',5000);

--권한
insert into auth(auth, id) 
values('고객','java');
insert into auth(auth, id) 
values('고객','spring');

--회원치수
insert into member_size(msno,shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(msno_seq.nextval, 42,51,63,23,71,37,25,23,14,91,'java');
insert into member_size(msno,shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(msno_seq.nextval, 44,53,64,24,72,39,26,25,15,92,'spring');