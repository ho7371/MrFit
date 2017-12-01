
--------------- 테이블 데이터 삭제
delete from note;
delete from board;
delete from order_product;
delete from orders;
delete from image;
delete from product_qna;
delete from review;
delete from inquiry_reply;
delete from inquiry;
delete from product_detail;
delete from product_size;
delete from product_color;
delete from product;
delete from auth;
delete from point;
delete from member_size;
delete from member;
delete from question;
delete from grade;
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
-- 관리자용 테스트  id: admin / pwd:admin
-- 회원용 테스트  id: test1 / pwd:test1
-- 회원용 테스트  id: test2 / pwd:test2
commit
--------------- 권한
insert into auth(id, auth) values('admin','ROLE_ADMIN');

--------------- 회원 치수
/*
insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(42,51,63,23,71,37,25,23,14,91,'test1');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(44,53,64,24,72,39,26,25,15,92,'test2');
*/

------------------------------------------ 상품등록


--------------- 상품등록
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'기본 상의 상품1',23000,'기본 상의 상품 1 설명입니다','top');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'기본 하의 상품1',23000,'기본 하의 상품 1 설명입니다','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'기본 아우터 상품1',23000,'기본 아우터 상품 1 설명입니다','outer');
------------- 상품 색상 추가
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'기본 색상 1');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'기본 색상 2');
------------- 상품 치수 추가
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'기본S',42,51,63,23,71);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'기본M',44,53,64,24,72);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'기본L',46,55,66,26,74);
------------- 상품 상세 정보 추가
-------1번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 3,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 2,160);
-------2번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 1, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 1, 2,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 2, 3,180);
-------3번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 1, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 2, 2,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 2, 3,180);

--------------- 상품 이미지 등록
insert into image(ino,pno,url) values(ino_seq.nextval,1,'thumb/기본상의상품1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'thumb/기본하의상품1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'thumb/기본아우터상품1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/기본상의상품11.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'bottom/기본하의상품11.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'outer/기본아우터상품11.jpg');

----------------------------------------------------------------------- 상품등록 끝

--------------- 포인트

insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'test1',-1000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'test1',5000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'test2',2000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'test2',-2000, sysdate);




-----------------------------------------------------------------------

insert into inquiry(iqno, title, content, regdate, security, id)
values(iqno_seq.nextval,'첫번째 제목','test1이 작성한 첫번째 고객문의', sysdate, 'public','test1');

insert into inquiry(iqno, title, content, regdate, security, id)
values(iqno_seq.nextval,'두번째 제목','test2가 작성한 첫번째 고객문의', sysdate, 'private','test2');


--------------- 고객문의 답글 등록
insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(iqrno_seq.nextval,'test1이 작성한 1번째 고객문의에 대한 관리자의 답글 내용입니다.', sysdate, 'public',1);

insert into inquiry_reply(iqrno, content, regdate, security, iqno)
values(iqrno_seq.nextval,'test2이 작성한 1번째 고객문의에 대한 관리자의 답글 내용입니다.', sysdate, 'private',2);


--------------- 리뷰 등록

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,1,'test1','test1이 기본상의상품1에 작성한 리뷰내용',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,1,'test2','test2이 기본상의상품1에 작성한 리뷰내용',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,2,'test1','test1이 기본하의상품1에 작성한 리뷰내용',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,2,'test2','test2이 기본하의상품1에 작성한 리뷰내용',sysdate);

--------------- 상품 QnA 등록
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'java1',1,'test1이 기본상의상품1에 작성한 상품QnA내용',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'java1',1,'test2이 기본상의상품1에 작성한 상품QnA내용',sysdate,'public');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'java1',2,'test1이 기본하의상품1에 작성한 상품QnA내용',sysdate,'public');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'java1',3,'test2이 기본아우터상품1에 작성한 상품QnA내용',sysdate,'public');

--------------- 주문
/*
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
values(ono_seq.nextval,64000,sysdate,'배송완료','spring', '용인 수지');*/


--------------- 주문상품
/*
insert into order_product(ono,pdno,quantity) values(1,1,3);

insert into order_product(ono,pdno,quantity) values(2,4,8);
insert into order_product(ono,pdno,quantity) values(2,5,6);
insert into order_product(ono,pdno,quantity) values(2,2,10);

insert into order_product(ono,pdno,quantity) values(3,1,2);
insert into order_product(ono,pdno,quantity) values(3,2,6);
insert into order_product(ono,pdno,quantity) values(3,7,2);
	*/

--------------- 게시판

insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','첫번째 공지사항 제목','첫번째 공지사항 본문',sysdate,'public','공지');	
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','2번째 공지사항 제목','2번째 공지사항 본문',sysdate,'public','공지');		
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','3번째 공지사항 제목','3번째 공지사항 본문',sysdate,'public','공지');	
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','4번째 공지사항 제목','4번째 공지사항 본문',sysdate,'public','공지');		

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