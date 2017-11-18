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

----------------------------------------------------------------------------------------------------------

-- 시퀀스 생성
create sequence point_no_seq;
create sequence msno_seq;
create sequence ono_seq;
create sequence bno_seq;
create sequence rno_seq;
create sequence pdno_seq;
create sequence psno_seq;
create sequence ino_seq;
create sequence pno_seq;
create sequence mbno_seq;
create sequence mrno_seq;
create sequence qno_seq;

--시퀀스 삭제
drop sequence point_no_seq;
drop sequence msno_seq;
drop sequence ono_seq;
drop sequence bno_seq;
drop sequence rno_seq;
drop sequence pdno_seq;
drop sequence psno_seq;
drop sequence ino_seq;
drop sequence pno_seq;
drop sequence mbno_seq;
drop sequence mrno_seq;
drop sequence qno_seq;


----------------------------------------------------------------------------------------------------------

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
-----------------------------------------------------------------------------------------------------------

--회원테이블 중 권한칼럼을 회원상태(활성/비활성)로 변경
alter table member rename column auth to status;

------------------------------------------------------------------------------------------------------------
--샘플데이터

-- 회원등급
insert into grade(gno, grade, percent)
 values (gno_seq.nextval, '브론즈', 5);
insert into grade(gno, grade, percent)
 values (gno_seq.nextval, '실버', 7);
insert into grade(gno, grade, percent)
 values (gno_seq.nextval, '골드', 10);
 
  -- 비밀번호확인질문
 insert into question(qno,question)
 values (qno_seq.nextval,'사용자의 태어난 곳');
  insert into question(qno,question)
 values (qno_seq.nextval,'출신 초등학교는 어디입니까?');
  insert into question(qno,question)
 values (qno_seq.nextval,'첫사랑의 이름은?');
  insert into question(qno,question)
 values (qno_seq.nextval,'자신의 보물 1호는?');
  insert into question(qno,question)
 values (qno_seq.nextval,'좋아하는 음료는?');

--회원
insert into member(id, password, name, phone, address, email, point, totalspent, status, gno)
 values('java','1234','핫식스','010-1111-1111','판교','kosta@naver.com',1500,200,'1','1');
insert into member(id, password, name, phone, address, email, point, totalspent, status, gno)
 values('spring','1234','아무개','010-1234-5678','분당','kosta2@naver.com',2000,20000,'1','2');
 
insert into member(id, password, name, phone, address, email, point, totalspent, status, gno)
 values('kosta','1234','관리자다','010-1464-3578','분당','kosta3@naver.com',2000,20000,'1','3');
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
insert into auth(auth, id) 
values('관리자','kosta');

--회원치수
insert into member_size(msno,shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(msno_seq.nextval, 42,51,63,23,71,37,25,23,14,91,'java');
insert into member_size(msno,shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(msno_seq.nextval, 44,53,64,24,72,39,26,25,15,92,'spring');

---------------------------------------------------------------------------------------------------------------------

-- 상품등록
insert into product(pno,name,price,content,category)
values(pno_seq.nextval,'맨투맨',15000,'맨투맨입니다','상의');
-- 이미지 등록
insert into image(ino,pno,url)
values(ino_seq.nextval,pno_seq.currval,'C:\Users\kosta\Desktop\파이널프로젝트\사진\2017.11.10\nana.jpg');
insert into image(ino,pno,url)
values(ino_seq.nextval,pno_seq.currval,'C:\Users\kosta\Desktop\파이널프로젝트\사진\2017.11.10\kosta.jpg');

-- 상의 맨투맨 노랑색 사이즈 S/M/L
insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'노랑',pno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',150,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',100,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',125,pdno_seq.currval);
-- 상의 맨투맨 빨강 사이즈 S/M/L
insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'빨강',pno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',99,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',98,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',101,pdno_seq.currval);
-- 상의 맨투맨 검정 사이즈 S/M/L
insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'검정',pno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',30,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',50,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',60,pdno_seq.currval);


-- 상품등록
insert into product(pno,name,price,content,category)
values(pno_seq.nextval,'청바지',15000,'청바지입니다','하의');
-- 이미지 등록
insert into image(ino,pno,url)
values(ino_seq.nextval,pno_seq.currval,'C:\Users\kosta\Desktop\파이널프로젝트\사진\2017.11.10\nana.jpg');
insert into image(ino,pno,url)
values(ino_seq.nextval,pno_seq.currval,'C:\Users\kosta\Desktop\파이널프로젝트\사진\2017.11.10\kosta.jpg');

-- 상의 맨투맨 노랑색 사이즈 S/M/L
insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'청청',pno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',50,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',50,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',40,pdno_seq.currval);
-- 상의 맨투맨 빨강 사이즈 S/M/L
insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'진청',pno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',60,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',70,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',80,pdno_seq.currval);
-- 상의 맨투맨 검정 사이즈 S/M/L
insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'검정',pno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',90,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',89,pdno_seq.currval);
insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',111,pdno_seq.currval);

-----------------------------------------------------------------------------------------------

--주문
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,60000,sysdate,'장바구니','java');
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,20000,sysdate,'입금대기','java');
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,30000,sysdate,'배송중','java');
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,40000,sysdate,'배송완료','java');

insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,12000,sysdate,'장바구니','spring');
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,16000,sysdate,'입금대기','spring');
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,23000,sysdate,'배송중','spring');
insert into orders(ono,totalprice,ordertime,status,id) 
values(ono_seq.nextval,64000,sysdate,'배송완료','spring');

-- 주문상품
	--입금대기, java 회원
insert into order_product(pdno,ono,quantity) 
values(pdno_seq.nextval, 2,4);
	--배송중, java 회원
insert into order_product(pdno,ono,quantity) 
values(pdno_seq.nextval, 3,5);
	--배송완료, java 회원
insert into order_product(pdno,ono,quantity) 
values(pdno_seq.nextval, 4,2);
	--입금대기, spring 회원
insert into order_product(pdno,ono,quantity) 
values(pdno_seq.nextval, 6,1);
	--배송중, spring 회원
insert into order_product(pdno,ono,quantity) 
values(pdno_seq.nextval, 7,9);
	--배송완료, spring 회원
insert into order_product(pdno,ono,quantity) 
values(pdno_seq.nextval, 8,10);

-------------------------------------------------------------------------------------------------------------------
-- 게시판
-- 고객문의 샘플데이터
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '고객문의 카테로리입니다.',sysdate,'공개글','고객문의','java');
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '고객문의 카테로리입니다.(비밀)',sysdate,'비밀글','고객문의','java');
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '고객문의 카테로리입니다.',sysdate,'공개글','고객문의','spring');
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '고객문의 카테로리입니다.(비밀)',sysdate,'비밀글','고객문의','spring');

-- 공지사항
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '공지사항 카테로리입니다.',sysdate,'공개글','공지사항','kosta');
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '공지사항2 카테로리입니다.',sysdate,'공개글','공지사항','kosta');
insert into member_board(mbno,content,regdate,security,category,id) 
values(mbno_seq.nextval, '공지사항3 카테로리입니다.',sysdate,'공개글','공지사항','kosta');

-- 상품문의
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품문의1 카테로리입니다.',sysdate,'비밀글','상품문의','java',1);
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품문의2 카테로리입니다.',sysdate,'비밀글','상품문의','java',2);
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품문의3 카테로리입니다.',sysdate,'비밀글','상품문의','spring',1);
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품문의4 카테로리입니다.',sysdate,'비밀글','상품문의','spring',2);

-- 상품리뷰
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품리뷰1 카테로리입니다.',sysdate,'공개글','상품리뷰','java',1);
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품리뷰2 카테로리입니다.',sysdate,'공개글','상품리뷰','java',2);
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품리뷰3 카테로리입니다.',sysdate,'공개글','상품리뷰','spring',1);
insert into common_board(bno,content,regdate,security,category,id,pno) 
values(bno_seq.nextval, '상품리뷰4 카테로리입니다.',sysdate,'공개글','상품리뷰','spring',2);
