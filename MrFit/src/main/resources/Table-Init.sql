--------------- 테이블 데이터 삭제

delete from PRODUCT_SIZE;
delete from ORDER_PRODUCT;
delete from PRODUCT_DETAIL;
delete from ORDERS;
delete from IMAGE;
delete from PRODUCT_REPLY;
delete from PRODUCT_BOARD;
delete from PRODUCT;
delete from INQUIRY_REPLY;
delete from INQUIRY;
delete from MEMBER_SIZE;
delete from AUTH;
delete from POINT; 
delete from MEMBER;
delete from QUESTION;
delete from GRADE;

------------------------------ 테이블 만든 순서대로 select 종료

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

insert into member(id, password, name, phone, address, email, answer, qno)
  values('java','1234','현진호','010-1111-1111','판교','kosta@naver.com', '제주도', 1);
  
 insert into member(id, password, name, phone, address, email, answer, qno)
  values('spring','1234','김석환','010-1584-5678','분당','kosta2@naver.com','사당초등학교', 2);
  
insert into member(id, password, name, phone, address, email, answer, qno)
  values('jquery','1234','유정현','010-9754-5678','수지','hhh16745@naver.com','김태희', 3);

insert into member(id, password, name, phone, address, email, answer, qno)
  values('mybatis','1234','진영훈','010-7556-5678','용인','hhh079@naver.com','갤럭시7엣지', 4);
  
insert into member(id, password, name, phone, address, email, answer, qno)
  values('html','1234','이현민','010-8313-5678','야탑','hhh179@naver.com','포카리스웨트', 5);
  
insert into member(id, password, name, phone, address, email, answer, qno)
  values('css','1234','신재현','010-3865-5678','장지','hhh432@naver.com','원주', 1);
  
insert into member(id, password, name, phone, address, email, answer, qno)
  values('kosta','1234','관리자','010-3429-3578','분당','kosta3@naver.com','수지초등학교',2);
 
--------------- 포인트

insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'java',-1000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'spring',2000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'jquery',-3000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'mybatis',4000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'html',5000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'css',-6000, sysdate);
insert into point(point_no, id, updown, change_date) values(point_no_seq.nextval,'kosta',7000, sysdate);

--------------- 권한

insert into auth(id, auth) values('java','고객');
insert into auth(id, auth) values('spring','고객');
insert into auth(id, auth) values('jquery','고객');
insert into auth(id, auth) values('mybatis','고객');
insert into auth(id, auth) values('html','고객');
insert into auth(id, auth) values('css','고객');
insert into auth(id, auth) values('spring','관리자');
insert into auth(id, auth) values('jquery','관리자');
insert into auth(id, auth) values('kosta','관리자');

--------------- 회원치수

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(42,51,63,23,71,37,25,23,14,91,'java');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(44,53,64,24,72,39,26,25,15,92,'spring');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(45,54,65,25,73,40,27,26,16,93,'jquery');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(46,55,66,26,74,41,28,27,17,94,'mybatis');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(47,56,67,27,75,42,29,28,18,95,'html');

insert into member_size(shoulder,chest,sleeve, armhole, toplength, waist, crotch, thigh, hem, bottomlength, id) 
values(48,57,68,28,76,43,30,29,19,96,'css');

------------------------------- 진호 : [11/19][01:22]

--------------- 상품등록

insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'라운드넥맨투맨',23000,'라운드넥 맨투맨 상품 설명입니다','상의');
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'옥스포드 셔츠',18000,'옥스포드 셔츠 상품 설명입니다','상의');
	
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'빈티지 청바지',57000,'빈티지 청바지 상품 설명입니다','하의');
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'생지 데님',47000,'생지 데님 상품 설명입니다','하의');
	
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'라쿤 파카',180000,'라쿤 파카 상품 설명입니다','아우터');

insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'롱패딩',165000,'롱패딩 상품 설명입니다','아우터');
	
	
--------------- 이미지 등록

insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/mantoman1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/mantoman2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/mantoman3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/oxford1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/oxford2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'bottom/vintage1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'bottom/vintage2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'bottom/vintage3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,4,'bottom/jean1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,5,'outer/racoon1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,6,'outer/longpadding1.jpg');



	/*    기존 상품 상세 정보 등록
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'회색',1);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'검정',1);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'녹색',1);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'흰색',2);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'하늘색',2);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'먹색',2);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'블루블랙',3);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'블랙',4);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'빨강',5);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'보라',5);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'검정',6);
	insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'흰색',6);
	*/

	/* 기존 상품 사이즈
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,12);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,11);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,10);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,9);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,8);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,7);
	
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,36,45,57,17,65,'M',76,6);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,37,46,58,18,66,'L',65,6);
	
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,31,44,56,18,67,'FREE',76,5);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,49,59,18,69,'FREE',76,4);
	
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,35,44,56,16,64,'S',14,3);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,36,45,57,17,65,'M',76,3);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,37,46,58,18,66,'L',65,3);
	
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,47,59,19,67,'S',43,2);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,40,49,61,21,69,'M',18,2);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,38,47,59,19,67,'L',120,2);
	
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,42,51,63,23,71,'S',15,1);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,44,53,64,24,72,'M',23,1);
	
	insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
		values(psno_seq.nextval,46,55,66,26,74,'L',125,1);
	*/
	
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



	
/*
--------------- 상의 맨투맨 빨강 사이즈 S/M/L

insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'빨강',pno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',99,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',98,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',101,pdno_seq.currval);


--------------- 상의 맨투맨 검정 사이즈 S/M/L

insert into product_detail(pdno,color,pno)
	values(pdno_seq.nextval,'검정',pno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
	values(psno_seq.nextval,42,51,63,23,71,'s',30,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
	values(psno_seq.nextval,44,53,64,24,72,'m',50,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
	values(psno_seq.nextval,44,53,64,24,72,'l',60,pdno_seq.currval);


--------------- 상품등록

insert into product(pno,name,price,content,category)
values(pno_seq.nextval,'청바지',15000,'청바지입니다','하의');


--------------- 이미지 등록

insert into image(ino,pno,url)
	values(ino_seq.nextval,pno_seq.currval,'C:\Users\kosta\Desktop\파이널프로젝트\사진\2017.11.10\nana.jpg');

insert into image(ino,pno,url)
	values(ino_seq.nextval,pno_seq.currval,'C:\Users\kosta\Desktop\파이널프로젝트\사진\2017.11.10\kosta.jpg');


--------------- 상의 맨투맨 노랑색 사이즈 S/M/L

insert into product_detail(pdno,color,pno) values(pdno_seq.nextval,'청청',pno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',50,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',50,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',40,pdno_seq.currval);


--------------- 상의 맨투맨 빨강 사이즈 S/M/L

insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'진청',pno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',60,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',70,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',80,pdno_seq.currval);


--------------- 상의 맨투맨 검정 사이즈 S/M/L

insert into product_detail(pdno,color,pno)
values(pdno_seq.nextval,'검정',pno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,42,51,63,23,71,'s',90,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'m',89,pdno_seq.currval);

insert into product_size(psno,size1,size2,size3,size4,size5,size_type,inventory,pdno)
values(psno_seq.nextval,44,53,64,24,72,'l',111,pdno_seq.currval);

*/
-----------------------------------------------------------------------------------------------

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


--- [주문상품] 수정한 테이블  (수정자:현진호)

insert into order_product(ono,pdno,quantity) values(1,1,3);

insert into order_product(ono,pdno,quantity) values(2,4,8);
insert into order_product(ono,pdno,quantity) values(2,5,6);
insert into order_product(ono,pdno,quantity) values(2,2,10);

insert into order_product(ono,pdno,quantity) values(3,1,2);
insert into order_product(ono,pdno,quantity) values(3,2,6);
insert into order_product(ono,pdno,quantity) values(3,7,2);


--- [주문상품] 기존 테이블  (수정자:현진호)
--- [테이블 변경이유] : 	주문 상품 테이블에 나온 데이터(pdno)만으로는  [상품치수테이블]로 가는 연결고리(외래키)를 발견할 수 없음.
--               	따라서 pdno를 가지고 상품치수를 가지고 오는 select문이 한번 더 돌아야 함.

	/* 기존 데이터
	--입금대기, java 회원
	insert into order_product(ono,pdno,quantity) values(1,3,3);
	insert into order_product(ono,pdno,quantity) values(1,2,3);
	insert into order_product(ono,pdno,quantity) values(1,5,3);
	
	insert into order_product(pdno,ono,quantity) values(pdno_seq.nextval, 2,4);
	--배송중, java 회원
	insert into order_product(pdno,ono,quantity) values(pdno_seq.nextval, 3,5);
	--배송완료, java 회원
	insert into order_product(pdno,ono,quantity) values(pdno_seq.nextval, 4,2);
	--입금대기, spring 회원
	insert into order_product(pdno,ono,quantity) values(pdno_seq.nextval, 6,1);
	--배송중, spring 회원
	insert into order_product(pdno,ono,quantity) values(pdno_seq.nextval, 7,9);
	--배송완료, spring 회원
	insert into order_product(pdno,ono,quantity) values(pdno_seq.nextval, 8,10);
	*/

--------------------------------- 진호 : [11/19][23:07]

--------------- 게시판

-- 고객문의 샘플데이터
/*
insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '고객문의 카테고리입니다.',sysdate,'공개글','고객문의','java');

insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '고객문의 카테고리입니다.(비밀)',sysdate,'비밀글','고객문의','java');

insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '고객문의 카테고리입니다.',sysdate,'공개글','고객문의','spring');

insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '고객문의 카테고리입니다.(비밀)',sysdate,'비밀글','고객문의','spring');

-- 공지사항
insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '공지사항 카테고리입니다.',sysdate,'공개글','공지사항','kosta');

insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '공지사항2 카테고리입니다.',sysdate,'공개글','공지사항','kosta');

insert into member_board(mbno,content,regdate,security,category,id) 
	values(mbno_seq.nextval, '공지사항3 카테고리입니다.',sysdate,'공개글','공지사항','kosta');

	
-- 상품문의

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품문의1 카테고리입니다.',sysdate,'비밀글','상품문의','java',1);

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품문의2 카테고리입니다.',sysdate,'비밀글','상품문의','java',2);

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품문의3 카테고리입니다.',sysdate,'비밀글','상품문의','spring',1);

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품문의4 카테고리입니다.',sysdate,'비밀글','상품문의','spring',2);


-- 상품리뷰

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품리뷰1 카테고리입니다.',sysdate,'공개글','상품리뷰','java',1);

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품리뷰2 카테고리입니다.',sysdate,'공개글','상품리뷰','java',2);

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품리뷰3 카테고리입니다.',sysdate,'공개글','상품리뷰','spring',1);

insert into common_board(bno,content,regdate,security,category,id,pno) 
	values(bno_seq.nextval, '상품리뷰4 카테고리입니다.',sysdate,'공개글','상품리뷰','spring',2);
	
 */
	
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
