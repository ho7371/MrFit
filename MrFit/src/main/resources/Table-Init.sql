--------------- 테이블 데이터 삭제

delete * from table order_product;
delete * from table orders;
delete * from table image;
delete * from table product_qna;
delete * from table review;
delete * from table inquiry_reply;
delete * from table inquiry;
delete * from table product_detail;
delete * from table product_size;
delete * from table product_color;
delete * from table product;
delete * from table auth;
delete * from table point;
delete * from table member_size;
delete * from table member;
delete * from table question;
delete * from table grade;

------------------------------ 테이블 만든 순서대로 select 종료

select * from grade;
select * from question;
select * from member;
select * from member_size;
select * from point;
select * from auth;
select * from product;
select * from product_color;
select * from product_size;
select * from product_detail;
select * from inquiry;
select * from inquiry_reply;
select * from review;
select * from product_qna;
select * from image;
select * from orders;
select * from order_product;

------------------------------ 샘플데이터 insert

--------------- 회원등급

insert into grade(grade, percent) values ('브론즈', 5);
insert into grade(grade, percent) values ('실버', 7);
insert into grade(grade, percent) values ('골드', 10);
 
--------------- 비밀번호 확인 질문

insert into question(qno,question) values (1,'당신이 태어난 곳은 어디입니까?');
insert into question(qno,question) values (2,'출신 초등학교는 어디입니까?');
insert into question(qno,question) values (3,'첫사랑의 이름은?');
insert into question(qno,question) values (4,'자신의 보물 1호는?');
insert into question(qno,question) values (5,'좋아하는 음료는?');

--------------- 회원
/* 비밀번호 암호화가 적용되므로, 테스트할 회원은 직접 회원가입해야 함 */
insert into member(id, password, name, phone, address, email, answer, qno)
  values('java','1234','현진호','010-1111-1111','판교','kosta@naver.com', '제주도', 1);
  
 insert into member(id, password, name, phone, address, email, answer, qno)
  values('spring','1234','김석환','010-1584-5678','분당','kosta2@naver.com','사당초등학교', 2);
  

--------------- 회원 치수

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(42,51,63,23,71,37,25,23,14,91,'java');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(44,53,64,24,72,39,26,25,15,92,'spring');


--------------- 포인트

insert into point(point_no, id, updown, change_date) values(1,'java',-1000, sysdate);
insert into point(point_no, id, updown, change_date) values(2,'java',5000, sysdate);
insert into point(point_no, id, updown, change_date) values(3,'spring',2000, sysdate);
insert into point(point_no, id, updown, change_date) values(4,'spring',-2000, sysdate);

--------------- 권한

insert into auth(id, auth) values('java','ROLE_MEMBER');
insert into auth(id, auth) values('spring','ROLE_MEMBER');
insert into auth(id, auth) values('spring','ROLE_ADMIN');

--------------- 상품등록

insert into product(pno,name,price,content,category) 
	values(1,'라운드넥맨투맨',23000,'라운드넥 맨투맨 상품 설명입니다','상의');
	
insert into product(pno,name,price,content,category) 
	values(2,'옥스포드 셔츠',18000,'옥스포드 셔츠 상품 설명입니다','상의');
	
	
insert into product(pno,name,price,content,category) 
	values(3,'빈티지 청바지',57000,'빈티지 청바지 상품 설명입니다','하의');
	
insert into product(pno,name,price,content,category) 
	values(4,'생지 데님',47000,'생지 데님 상품 설명입니다','하의');
	
	
insert into product(pno,name,price,content,category) 
	values(5,'라쿤 파카',180000,'라쿤 파카 상품 설명입니다','아우터');

insert into product(pno,name,price,content,category) 
	values(6,'롱패딩',165000,'롱패딩 상품 설명입니다','아우터');
	
------------- 상품 색상 추가

insert into product_color(pcno, color_name)	values(1,'BLACK');
insert into product_color(pcno, color_name)	values(2,'RED');
insert into product_color(pcno, color_name)	values(3,'BLUE');
insert into product_color(pcno, color_name)	values(4,'GREEN');
insert into product_color(pcno, color_name)	values(5,'GREAY');
insert into product_color(pcno, color_name)	values(6,'YELLOW');
insert into product_color(pcno, color_name)	values(7,'SKY');

------------- 상품 치수 추가

insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(1,'S',42,51,63,23,71,150);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(2,'M',44,53,64,24,72,160);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(3,'L',46,55,66,26,74,170);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(4,'M',42,51,63,23,71,180);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(5,'L',44,53,64,24,72,190);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(6,'XL',46,55,66,26,74,200);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(7,'XS',42,51,63,23,71,210);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(8,'S',44,53,64,24,72,220);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(9,'M',46,55,66,26,74,230);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(10,'L',46,55,66,26,74,240);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5,inventory)
	values(11,'XL',46,55,66,26,74,250);

------------- 상품 상세 정보 추가

insert into product_detail(pdno,pno,pcno,psno) values(1, 1, 1, 1);
insert into product_detail(pdno,pno,pcno,psno) values(2, 1, 1, 2);
insert into product_detail(pdno,pno,pcno,psno) values(3, 1, 1, 3);
insert into product_detail(pdno,pno,pcno,psno) values(4, 1, 2, 1);
insert into product_detail(pdno,pno,pcno,psno) values(5, 1, 2, 2);
insert into product_detail(pdno,pno,pcno,psno) values(6, 1, 2, 3);
--2번째 상품 
insert into product_detail(pdno,pno,pcno,psno) values(7, 2, 3, 1);
insert into product_detail(pdno,pno,pcno,psno) values(8, 2, 3, 2);
insert into product_detail(pdno,pno,pcno,psno) values(9, 2, 3, 3);
insert into product_detail(pdno,pno,pcno,psno) values(10, 2, 3, 4);
insert into product_detail(pdno,pno,pcno,psno) values(11, 2, 3, 5);
--3번째 상품
insert into product_detail(pdno,pno,pcno,psno) values(12, 3, 1, 4);
insert into product_detail(pdno,pno,pcno,psno) values(13, 3, 3, 5);
insert into product_detail(pdno,pno,pcno,psno) values(14, 3, 5, 5);
insert into product_detail(pdno,pno,pcno,psno) values(15, 3, 6, 5);
insert into product_detail(pdno,pno,pcno,psno) values(16, 3, 7, 5);

-----------------------------------------------------------------------
-----------------------------------------------------------------------

insert into inquiry(iqno, content, regdate, security, id)
values(1,'첫번째 고객문의 글 내용@!@!@!@', sysdate, 'public','java');

insert into inquiry(iqno, content, regdate, security, id)
values(2,'두번째 고객문의 글 내용ㅂㄿㅇㅍ', sysdate, 'private','java');

insert into inquiry(iqno, content, regdate, security, id)
values(3,'세번째 고객문의 글 내용ㅎㅎ', sysdate, 'public','spring');

insert into inquiry(iqno, content, regdate, security, id)
values(4,'네번째 고객문의 글 내용ㅋㅋ', sysdate, 'private','spring');

--------------- 고객문의 답글 등록
insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(1,'고객문의 첫번째 답글 내용!@#ㅇ', sysdate, 'public',1);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(2,'고객문의 두번째 답글 내용~~~~', sysdate, 'private',2);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(3,'고객문의 세번째 답글 내용ㅋㄹㄴㅇㅎ', sysdate, 'public',3);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(4,'고객문의 네번째 답글 내용ㄼㄷㄹ호ㅜㅋ', sysdate, 'private',4);

--------------- 리뷰 등록

insert into review(rno, pdno, id, content, regdate)
values(1,1,'java','이상품 짱이에요!!',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(2,1,'spring','이상품 별로네요',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(3,2,'java','이상품 짱이에요!!',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(4,2,'spring','이상품 별로네여',sysdate);

--------------- 상품 QnA 등록
insert into product_qna(pqno,id,content,regdate) 
values(1,'java','이상품 괜찮아요??',sysdate);
insert into product_qna(pqno,id,content,regdate) 
values(2,'java','이상품 괜찮아요 222 ??',sysdate);
insert into product_qna(pqno,id,content,regdate) 
values(3,'java','이상품 괜찮아요 333 ??',sysdate);
insert into product_qna(pqno,id,content,regdate) 
values(4,'spring','이상품 괜찮아요 4444 ??',sysdate);

--------------- 이미지 등록

insert into image(ino,pno,url) values(1,1,'main/mantoman.jpg');
insert into image(ino,pno,url) values(2,1,'top/mantoman1.jpg');
insert into image(ino,pno,url) values(3,1,'top/mantoman2.jpg');
insert into image(ino,pno,url) values(4,2,'main/oxford.jpg');
insert into image(ino,pno,url) values(5,2,'top/oxford1.jpg');
insert into image(ino,pno,url) values(6,3,'main/vintage.jpg');
insert into image(ino,pno,url) values(7,3,'bottom/vintage1.jpg');
insert into image(ino,pno,url) values(8,3,'bottom/vintage1.jpg');
insert into image(ino,pno,url) values(9,4,'main/jean.jpg');
insert into image(ino,pno,url) values(10,5,'main/racoon.jpg');


--------------- 주문

insert into orders(ono,totalprice,ordertime,status,id) 
values(1,60000,sysdate,'장바구니','java');

insert into orders(ono,totalprice,ordertime,status,id) 
values(2,12000,sysdate,'장바구니','spring');

insert into orders(ono,totalprice,ordertime,status,id) 
values(3,20000,sysdate,'입금대기','java');

insert into orders(ono,totalprice,ordertime,status,id) 
values(4,16000,sysdate,'입금대기','spring');

insert into orders(ono,totalprice,ordertime,status,id) 
values(5,30000,sysdate,'배송중','java');

insert into orders(ono,totalprice,ordertime,status,id) 
values(6,23000,sysdate,'배송중','spring');

insert into orders(ono,totalprice,ordertime,status,id) 
values(7,40000,sysdate,'배송완료','java');

insert into orders(ono,totalprice,ordertime,status,id) 
values(8,64000,sysdate,'배송완료','spring');


--------------- 주문상품

insert into order_product(ono,pdno,quantity) values(1,1,3);

insert into order_product(ono,pdno,quantity) values(2,4,8);
insert into order_product(ono,pdno,quantity) values(2,5,6);
insert into order_product(ono,pdno,quantity) values(2,2,10);

insert into order_product(ono,pdno,quantity) values(3,1,2);
insert into order_product(ono,pdno,quantity) values(3,2,6);
insert into order_product(ono,pdno,quantity) values(3,7,2);
	
--------------- 테이블 select

select * from GRADE;
select * from QUESTION;
select * from MEMBER;
select * from POINT; 
select * from AUTH;
select * from MEMBER_SIZE;
select * from INQUIRY;
select * from INQUIRY_REPLY;
select * from PRODUCT;
select * from PRODUCT_BOARD;
select * from PRODUCT_REPLY;
select * from IMAGE;
select * from ORDERS;
select * from PRODUCT_DETAIL;
select * from ORDER_PRODUCT;
select * from PRODUCT_SIZE;

------------------------------ 테이블 만든 순서대로 select 종료
