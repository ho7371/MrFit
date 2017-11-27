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
delete * from table board;
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
select * from board;

------------------------------ 샘플데이터 insert

--------------- 회원등급

insert into grade(grade, percent) values ('브론즈', 5);
insert into grade(grade, percent) values ('실버', 7);
insert into grade(grade, percent) values ('골드', 10);
 
--------------- 비밀번호 확인 질문

insert into question(qno,question) values (qno_seq.nextval,'당신이 태어난 곳은 어디입니까?');
insert into question(qno,question) values (qno_seq.nextval,'출신 초등학교는 어디입니까?');
insert into question(qno,question) values (qno_seq.nextval,'첫사랑의 이름은?');
insert into question(qno,question) values (qno_seq.nextval,'자신의 보물 1호는?');
insert into question(qno,question) values (qno_seq.nextval,'좋아하는 음료는?');

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

insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'java',-1000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'java',5000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'spring',2000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'spring',-2000, sysdate);

--------------- 권한

insert into auth(id, auth) values('java','ROLE_MEMBER');
insert into auth(id, auth) values('spring','ROLE_MEMBER');
insert into auth(id, auth) values('admin','ROLE_ADMIN');

--------------- 상품등록

insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'라운드넥맨투맨',23000,'라운드넥 맨투맨 상품 설명입니다','top');
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'옥스포드 셔츠',18000,'옥스포드 셔츠 상품 설명입니다','top');
	
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'빈티지 청바지',57000,'빈티지 청바지 상품 설명입니다','bottom');
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'생지 데님',47000,'생지 데님 상품 설명입니다','bottom');
	
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'라쿤 파카',180000,'라쿤 파카 상품 설명입니다','outer');

insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'롱패딩',165000,'롱패딩 상품 설명입니다','outer');
	
------------- 상품 색상 추가

insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'BLACK');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'RED');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'BLUE');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'GREEN');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'GREAY');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'YELLOW');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'SKY');

------------- 상품 치수 추가

insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',42,51,63,23,71);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',44,53,64,24,72);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',46,55,66,26,74);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,51,63,23,71);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,53,64,24,72);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'XL',46,55,66,26,74);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'XS',42,51,63,23,71);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',44,53,64,24,72);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',46,55,66,26,74);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',46,55,66,26,74);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'XL',46,55,66,26,74);

------------- 상품 상세 정보 추가

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 2,160);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 3,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 2,160);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 3,150);
--2번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 3, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 3, 2,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 3, 3,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 3, 4,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 3, 5,150);
--3번째 상품
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 1, 4,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 3, 5,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 5, 5,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 6, 5,190);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 7, 5,150);

-----------------------------------------------------------------------
-----------------------------------------------------------------------

insert into inquiry(iqno, content, regdate, security, id)
values(iqno_seq.nextval,'첫번째 고객문의 글 내용@!@!@!@', sysdate, 'public','java');

insert into inquiry(iqno, content, regdate, security, id)
values(iqno_seq.nextval,'두번째 고객문의 글 내용ㅂㄿㅇㅍ', sysdate, 'private','java');

insert into inquiry(iqno, content, regdate, security, id)
values(iqno_seq.nextval,'세번째 고객문의 글 내용ㅎㅎ', sysdate, 'public','spring');

insert into inquiry(iqno, content, regdate, security, id)
values(iqno_seq.nextval,'네번째 고객문의 글 내용ㅋㅋ', sysdate, 'private','spring');

--------------- 고객문의 답글 등록
insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(iqrno_seq.nextval,'고객문의 첫번째 답글 내용!@#ㅇ', sysdate, 'public',1);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(iqrno_seq.nextval,'고객문의 두번째 답글 내용~~~~', sysdate, 'private',2);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(iqrno_seq.nextval,'고객문의 세번째 답글 내용ㅋㄹㄴㅇㅎ', sysdate, 'public',3);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(iqrno_seq.nextval,'고객문의 네번째 답글 내용ㄼㄷㄹ호ㅜㅋ', sysdate, 'private',4);

--------------- 리뷰 등록

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,1,'java','이상품 짱이에요!!',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,1,'spring','이상품 별로네요',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,2,'java','이상품 짱이에요!!',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,2,'spring','이상품 별로네여',sysdate);

--------------- 상품 QnA 등록
insert into product_qna(pqno,id,content,regdate) 
values(pqno_seq.nextval,'java','이상품 괜찮아요??',sysdate);
insert into product_qna(pqno,id,content,regdate) 
values(pqno_seq.nextval,'java','이상품 괜찮아요 222 ??',sysdate);
insert into product_qna(pqno,id,content,regdate) 
values(pqno_seq.nextval,'java','이상품 괜찮아요 333 ??',sysdate);
insert into product_qna(pqno,id,content,regdate) 
values(pqno_seq.nextval,'spring','이상품 괜찮아요 4444 ??',sysdate);

--------------- 이미지 등록

insert into image(ino,pno,url) values(ino_seq.nextval,1,'thumb/이미지1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/이미지2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/이미지3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'thumb/oxford.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/oxford1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'thumb/vintage.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'bottom/vintage1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'bottom/vintage1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,4,'thumb/jean.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,5,'thumb/racoon.jpg');


--------------- 주문

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,60000,sysdate,'장바구니','java', '기본주소');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,12000,sysdate,'장바구니','spring', '기본주소');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,20000,sysdate,'입금대기','java', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,16000,sysdate,'입금대기','spring', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,30000,sysdate,'배송중','java', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,23000,sysdate,'배송중','spring', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,40000,sysdate,'배송완료','java', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,64000,sysdate,'배송완료','spring', '용인 수지');


--------------- 주문상품

insert into order_product(ono,pdno,quantity) values(1,1,3);

insert into order_product(ono,pdno,quantity) values(2,4,8);
insert into order_product(ono,pdno,quantity) values(2,5,6);
insert into order_product(ono,pdno,quantity) values(2,2,10);

insert into order_product(ono,pdno,quantity) values(3,1,2);
insert into order_product(ono,pdno,quantity) values(3,2,6);
insert into order_product(ono,pdno,quantity) values(3,7,2);
	

--------------- 게시판

insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'java1','글작성 테스트1','테스트중 1',sysdate,'on','공지');	

insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'java1','글작성 테스트2','테스트중 2',sysdate,'on','공지');	
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'java1','글작성 테스트3','테스트중 3',sysdate,'off','공지');	
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'java1','글작성 테스트4','테스트중 4',sysdate,'on','공지');	
select * from BOARD

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
select * from BOARD;

------------------------------ 테이블 만든 순서대로 select 종료