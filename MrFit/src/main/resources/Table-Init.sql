
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
------------- 비밀번호 암호화가 적용되므로, 테스트할 회원은 직접 회원가입해야 함 -------------
-- 관리자용 테스트  id: admin / pwd:1
-- 회원용 테스트  id: test1 / pwd:1
-- 회원용 테스트  id: test2 / pwd:1
-- 회원용 테스트  id: test3 / pwd:1
insert into MEMBER(id,password,name,phone,address,email,point,totalspent,status,answer,qno,grade) 
values('admin','$2a$10$UYkkG4AOyJ8aQbouh8t6ZuBIOtgUYPU1jmyMvF7IWyhW5kklIhmOG','관리자','031','판교','kosta',999999,0,'2','21',1,'골드'); 

insert into MEMBER(id,password,name,phone,address,email,point,totalspent,status,answer,qno,grade) 
values('test1','$2a$10$UYkkG4AOyJ8aQbouh8t6ZuBIOtgUYPU1jmyMvF7IWyhW5kklIhmOG','테스터1','031','지구','kosta',0,0,'1','21',1,'브론즈'); 
insert into MEMBER(id,password,name,phone,address,email,point,totalspent,status,answer,qno,grade) 
values('test2','$2a$10$UYkkG4AOyJ8aQbouh8t6ZuBIOtgUYPU1jmyMvF7IWyhW5kklIhmOG','테스터2','031','한국','kosta',0,0,'1','21',1,'브론즈'); 
insert into MEMBER(id,password,name,phone,address,email,point,totalspent,status,answer,qno,grade) 
values('test3','$2a$10$UYkkG4AOyJ8aQbouh8t6ZuBIOtgUYPU1jmyMvF7IWyhW5kklIhmOG','테스터3','031','성남','kosta',0,0,'0','21',1,'브론즈'); 

-- admin status 2로 변경
update MEMBER set status=1 where id='admin'

commit
--------------- 권한---------------
insert into auth(id, auth) values('admin','ROLE_ADMIN');

insert into auth(id, auth) values('test1','ROLE_MEMBER');
insert into auth(id, auth) values('test2','ROLE_MEMBER');



------------------------------------------ 상품등록--------------------------
------------상의 등록
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'빅사이즈 꽈배기 터틀넥 니트',23000,'다양한 꽈배기 패턴디테일로 색다른 느낌을
느껴보실 수 있는 제품!
계절감있는 두꺼운 두께감과 터틀넥으로 제작되어
한 겨울 추위걱정없이 입을 수 있는 니트!!
무엇보다 L(95-100)-3XL(110-115)까지의 사이즈와
기본 블랙 그레이 화이트 3가지 컬러감으로
누구나 입을 수 있어 저희 겐조샵에서 추천드리는 제품이에요^^!

tip.
최대한 세탁을 하지 않는편이 좋구요, 
뭔가 묻었다면 그부분만 닦아내고,계절이 바뀔 때 드라이클리닝을 해주시면 됩니다! 
단, 울 수트는 드라이클리닝을 하면 섬유속에 기름성분이 빠진다는 점을 참고하셔야됩니다! 
옷걸이에 걸어둔채 스프레이로 물을 뿌려주고 자연건조해도 어지간한 주름은 금세펴진답니다 
고열의 열로 다리면 광택이 나고 색의 변질을 초래할 수 있으니, 너무 자주 하시면 안되요!

','top');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'옆지퍼 오리털 패딩 남자 맨투맨',33000,'오리털 안감으로 보온성까지 갖춘 겨울에도
착용가능한 남자 맨투맨티셔츠를 소개해드려요
옆라인 지퍼디테일로 세련함과 캐주얼함까지
다양한 분위기 연출이 가능하며
베이직한 색상 그레이,블랙색상으로
누구나 부담없이 착용가능한 제품이에요!!
슬랙스나 청바지와 함께 코디하여
데일리룩을 완성하실수있는 코디하기 수월한
활용성높은 남자 옆지퍼 오리털 패딩 맨투맨입니다^^
','top');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'전산 프린팅 맨투맨 티셔츠',28000,' 프린팅 자수 맨투맨입니다.
세 가지 컬러로 취향에 맞춰 다양한 연출이 가능하며
루즈핏으로 제작되어 어깨가 더욱 넓어보이며
활동성이 뛰어난 제품입니다.
면소재로 일상 속 편안하게 착용이 가능하시며
다른 아이템 없이 자수 프린팅만으로 포인트 연출이 가능합니다.
','top');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'지퍼 오버핏 남자 레이어드 티셔츠',36000,'가슴부분에 포켓 지퍼 포인트와 레이어드 디테일로
빈티지함과 캐주얼함 두가지를 갖춘
데일리 아이템으로 제격인 제품인데요~
적절함 두께감과 오버핏으로 제작되어
누구나 부담없이 착용이 가능한 활용성 높은 티셔츠입니다
다양한 코디를 완성 하실수 있는
남자 오버핏 레이어드 티셔츠에요~!!','top');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'네오프렌 옆지퍼 트레이닝후드',27000,'베이직한 디자인에 옆라인 지퍼포인트가 들어가있어
캐주얼함을 살린 제품이에요~!
청바지와 함께 코디하셔도 어색함없는 코디를 완성하실수있으며
커플룩으로도 많이들 찾으시는 후드티셔츠입니다
올 가을 데일리 아이템으로 제격인 
활용성높은 네오프렌 트레이닝 후드티셔츠입니다','top');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'아노락 지퍼 네오프렌 트레이닝 후드',45000,'네오프렌소재로 제작된 남자 트레이닝 후드티셔츠입니다
기본색상 그레이 브랙 두가지 컬러로 구성되어 있으며
지퍼,밑단 트임과 포켓까지 달려있어
실용적이기 까지한 유용하게 활용할수있는 제품이에요
적절한 두께감으로 지금부터 입기 딱 좋은
보온성까지 지닌 최고의 가성비를 자랑하는 트레이닝후드티로
청바지와 함께 코디하여 캐주얼룩을 완성해보세요','top');


insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'쫀득쫀득 분또 슬랙스',26000,'구김이 잘들지 않아요','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'센서블 밴딩팬츠',46000,'일반적인 평범한 면바지 느낌','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'에브리바디 린넨 밴딩팬츠',33000,'단정하지만 편하게 고무줄이 들어간 바지','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'따뜻한건 역시 기모데님팬츠',42000,'겨울에는 역시 기모 데님 팬츠!
따뜻함이 달라요','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'후끈후끈한 융털본딩 워싱데님팬츠',25000,'후끈후끈!
겨울철 핫한 융털 팬츠 겉으로는 티 1도 안남','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'특수가공 매직 코팅 팬츠',31000,'일반 진과는 다른 윤기 좔좔 매직코팅 팬츠!!
반질반질해서 더 눈에 띈다구!','bottom');
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'블랙 쫀쫀 데일리 데님 팬츠',29000,'이거입고 격한 운동도 가능!
미친듯이 뛰어봅시다 하지만 통풍은 보장 못합니다.','bottom');

	
	
insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'센트 웰론 오버핏 남자 롱 패딩',230000,'롱 기장과 웬론 충전재로 제작되어 뛰어난 보온성과
가격대비 높은 퀄리티로 제작된 롱 패딩 점퍼!
허리조임 디테일과 오버핏으로 제작되어
다양한 코디가 가능한 웰론 오버핏 롱 패딩
tip.
드라이클리닝보다는 손세탁을 권장
미지근한 물에 중성세제를 풀어 손세탁하는 편
얼룩진 부분은 솔로 살살 문질러 주는것이 좋음 
물을 짤땐 여러 겹으로 접어 꼭꼭 눌러 주면 물기가 잘빠지게 됨
어느정도 마르면 손바닥이나 옥걸이 등으로 두드려 주시면
 뭉쳐있던 털들이 다시 빵빵하게 살아남!!','outer');
	insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'라이더 자켓',53000,'전체적인 퀄리티가 우수하게 나와
리얼 못지않은 퀄리티로 제작
육안상 차이 없이 나왔으며 소매부분 지퍼 및 전체적인 
지퍼 디테일이 많이 들어간 제품
슬랙스 청바지 등등 코디하시기 좋은 제품','outer');
	insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'블루종점퍼',43000,'free(95-105)사이즈로 부담없이 착용이 가능하며
베이직한 색상 카키,블랙색상으로 구성되어있습니다
쌀쌀해진 날씨에 살짝 걸쳐 코디하기 좋은
활용성 높은 제품
','outer');
	insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'오버핏 울 코트',125000,'넉넉한 free 사이즈와 오버핏으로 제작되어
누구나 부담없이 입으실 수 있으며
기본 베이직한 디자인으로 제작된 제품이랍니다
울 혼방 소재로 제작되어 부드러운 터치감을
자랑하는 남자 겨울 울 코트입니다','outer');
	insert into product(pno,name,price,content,category) 
	values(pno_seq.nextval,'겨울 항공 롱 패딩 점퍼',143000,'웰론 충전재로 가벼운 중량감과
높은 보온성을 지닌 
가격대비 퀄리티 좋은 제품으로
최고의 가성비를 자랑하는 제품이랍니다','outer');
------------- 상품 색상 추가
----------------------------------------------상의 -----------
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'블랙');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'그레이');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'화이트');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'브라운');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'베이지');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'레드');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'카키');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'스카이');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'네이비');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'차콜');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'아이보리');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'진청');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'청');
insert into product_color(pcno, color_name)	values(pcno_seq.nextval,'연청');


------------- 상품 치수 추가 -------------------
------------------------------상의  어깨 가슴 소매 암홀 상의 총기장-------------------
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',42,52,76,23,74);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',46,54,77,24,75);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',50,56,78,25,76);


insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',49,56,64,23,71);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',51,58,65,24,72);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',65,59,51,26,73);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',61,68,58,28,74);

insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',56,57,53,22,66);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',56,57,53,24,66);	
	
-------------------------------하의 사이즈-------------------------
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',40,30,28,18,96);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,30,19,97);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,34,32,20,98);
	

insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,30,19,97);

	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',40,31,27,24,92);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,28,25,94);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,33,29,26,96);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',40,30,28,18,96);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,30,19,97);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,34,32,20,98);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',40,30,28,18,96);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,30,19,97);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,34,32,20,98);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',40,30,28,18,96);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,30,19,97);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,34,32,20,98);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'S',40,30,28,16,92);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',42,32,30,17,94);
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',44,34,32,18,96);
	
--------------------------------------------아우터------------------
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',58,65,58,30,106);
	insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',60,57,59,32,107);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',47,44,59,27,61);
	insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',49,46,60,28,62);
	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',45,59,66,30,66);

	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',48,59,77,30,103);

	
insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'M',43,60,63,28,103);
	insert into product_size(psno,size_name,size1,size2,size3,size4,size5)
	values(psno_seq.nextval,'L',45,62,64,30,104);
	
commit
	
------------- 상품 상세 정보 추가-------------
--------------상의----------------------
-------1번째 상품 -----------------------
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 2,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 1, 3,150);

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 2,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 2, 3,150);

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 3, 1,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 3, 2,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 1, 3, 3,150);
-------2번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 4, 4,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 4, 5,170);

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 5, 4,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 2, 5, 5,180);
-------3번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 6, 6,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 7, 6,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 3, 8, 6,180);
-------4번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 4, 9, 7,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 4, 10, 7,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 4, 11, 7,180);
-------5번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 5, 12, 8,152);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 5, 13, 8,170);

-------6번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 6, 14, 9,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 6, 12, 9,170);

--------------하의
-------1번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 7, 1, 10,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 7, 1, 11,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 7, 1, 12,150);

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 7,2, 10,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 7,2, 11,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 7,2, 12,150);

-------2번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 6, 13,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 7, 13,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 8, 13,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 9, 13,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 3, 13,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 10, 13,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 1, 13,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 8, 5, 13,180);
-------3번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 9, 11, 14,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 9, 11, 15,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 9, 11, 16,180);
-------4번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 12, 17,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 13, 17,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 14, 17,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 1, 17,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 2, 17,180);

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 12, 18,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 13, 18,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 1, 18,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 2, 18,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 14, 18,180);

insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 12, 19,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 13, 19,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 1, 19,180);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 2, 19,175);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 10, 14, 19,180);
-------5번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 12, 20,152);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 13, 20,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 14, 20,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 12, 21,152);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 13, 21,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 14, 21,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 12, 22,152);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 13, 22,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 11, 14, 22,170);
-------6번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 12, 1, 23,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 12, 12, 23,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 12, 1, 24,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 12, 12, 24,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 12, 1, 25,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 12, 12, 25,170);

-------7번째 상품 -----------
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 13, 1, 26,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 13, 1, 27,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 13, 1, 28,150);


--------------아우터--------------
-------1번째 상품 ---------------
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 14, 1, 29,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 14, 1, 30,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 14, 2, 29,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 14, 2, 30,150);

-------2번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 15, 1, 31,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 15, 1, 32,170);

-------3번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 16, 1, 33,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 16, 7, 33,170);

-------4번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 17, 1, 34,150);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 17, 5, 34,175);

-------5번째 상품 
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 18, 1, 35,152);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 18, 1, 36,170);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 18, 7, 35,152);
insert into product_detail(pdno,pno,pcno,psno,inventory) values(pdno_seq.nextval, 18, 7, 36,170);



--------------- 상품 이미지 등록
---------------------상의 이미지 등록
insert into image(ino,pno,url) values(ino_seq.nextval,1,'thumb/1-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/1-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/1-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,1,'top/1-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,2,'thumb/2-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/2-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/2-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/2-4.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,2,'top/2-5.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,3,'thumb/3-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'top/3-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'top/3-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,3,'top/3-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,4,'thumb/4-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,4,'top/4-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,4,'top/4-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,4,'top/4-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,5,'thumb/5-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,5,'top/5-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,5,'top/5-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,5,'top/5-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,6,'thumb/6-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,6,'top/6-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,6,'top/6-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,6,'top/6-4.jpg');
----------------------------------------하의 등록
insert into image(ino,pno,url) values(ino_seq.nextval,7,'thumb/b1-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,7,'bottom/1-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,7,'bottom/1-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,7,'bottom/1-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,8,'thumb/b2-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,8,'bottom/2-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,8,'bottom/2-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,8,'bottom/2-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,9,'thumb/b3-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,9,'bottom/3-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,9,'bottom/3-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,9,'bottom/3-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,10,'thumb/b4-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,10,'bottom/4-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,10,'bottom/4-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,10,'bottom/4-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,11,'thumb/b5-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,11,'bottom/5-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,11,'bottom/5-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,11,'bottom/5-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,12,'thumb/b6-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,12,'bottom/6-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,12,'bottom/6-3.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,13,'thumb/b7-1.gif');
insert into image(ino,pno,url) values(ino_seq.nextval,13,'bottom/7-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,13,'bottom/7-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,13,'bottom/7-4.jpg');


------------------------------------------아우터
insert into image(ino,pno,url) values(ino_seq.nextval,14,'thumb/o1-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,14,'outer/1-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,14,'outer/1-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,14,'outer/1-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,15,'thumb/o2-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,15,'outer/2-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,15,'outer/2-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,15,'outer/2-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,16,'thumb/o3-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,16,'outer/3-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,16,'outer/3-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,16,'outer/3-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,17,'thumb/o4-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,17,'outer/4-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,17,'outer/4-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,17,'outer/4-4.jpg');

insert into image(ino,pno,url) values(ino_seq.nextval,18,'thumb/o5-1.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,18,'outer/5-2.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,18,'outer/5-3.jpg');
insert into image(ino,pno,url) values(ino_seq.nextval,18,'outer/5-4.jpg');

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
values(rno_seq.nextval,1,'test1','test1 기본상의상품1에 작성한 리뷰내용',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,1,'test2','test2 기본상의상품1에 작성한 리뷰내용',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,2,'test1','test1 기본하의상품1에 작성한 리뷰내용',sysdate);

insert into review(rno, pdno, id, content, regdate)
values(rno_seq.nextval,2,'test2','test2 기본하의상품1에 작성한 리뷰내용',sysdate);

--------------- 상품 QnA 등록
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',1,'test1이 기본상의상품1에 작성한 상품QnA내용',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',1,'test2이 기본상의상품1에 작성한 상품QnA내용',sysdate,'public');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',1,'test1이 기본하의상품1에 작성한 상품QnA내용',sysdate,'public');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',1,'test2이 기본아우터상품1에 작성한 상품QnA내용',sysdate,'private');

insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',2,'test1이 기본상의상품1에 작성한 상품QnA내용',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',2,'test2이 기본상의상품1에 작성한 상품QnA내용',sysdate,'public');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',2,'test1이 기본하의상품1에 작성한 상품QnA내용',sysdate,'public');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',2,'test2이 기본아우터상품1에 작성한 상품QnA내용',sysdate,'private');
--------------- 주문
/*
insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,60000,sysdate,'장바구니','java', '기본주소');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,12000,sysdate,'장바구니','spring', '기본주소');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,20000,sysdate,'입금대기','test1', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,16000,sysdate,'입금대기','test2', '용인 수지');

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

insert into order_product(ono,pdno,quantity) values(44,4,8);
insert into order_product(ono,pdno,quantity) values(45,5,6);
insert into order_product(ono,pdno,quantity) values(2,2,10);

insert into order_product(ono,pdno,quantity) values(3,1,2);
insert into order_product(ono,pdno,quantity) values(3,2,6);
insert into order_product(ono,pdno,quantity) values(3,7,2);
	*/

--------------- 게시판

select * from orders

insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','첫번째 공지사항 제목','첫번째 공지사항 본문',sysdate,'public','공지');	
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','2번째 공지사항 제목','2번째 공지사항 본문',sysdate,'public','공지');		
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','3번째 공지사항 제목','3번째 공지사항 본문',sysdate,'public','공지');	
insert into board(bno,id,title,content,regdate,security,category) 
values(bno_seq.nextval,'admin','4번째 공지사항 제목','4번째 공지사항 본문',sysdate,'public','공지');	

--상품문의
insert into product_qna(pqno,id,pno,content,regdate,security)
values(pqno_seq.nextval,'test1','상품문의 게시글 1',sysdate,'public');

insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?1',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?2',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?3',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?4',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?5',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?6',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?7',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?8',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?9',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?10',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?11',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?12',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?13',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?14',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?15',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test1',12,'이옷 왜 비싼거죠?16',sysdate,'private');
insert into product_qna(pqno,id,pno,content,regdate,security) 
values(pqno_seq.nextval,'test2',12,'이옷 왜 비싼거죠?17',sysdate,'private');


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
--test
insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,60000,sysdate,'장바구니','test4', '기본 주소');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,12000,sysdate,'장바구니','test4', '기본 주소');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,20000,sysdate,'입금대기','test3', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,16000,sysdate,'입금대기','test3', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,30000,sysdate,'배송중','test3', '용인 수지');

insert into orders(ono,totalprice,ordertime,status,id, destination) 
values(ono_seq.nextval,23000,sysdate,'배송중','test3', '용인 수지');






insert into order_product(ono,pdno,quantity) values(1,1,3);

insert into order_product(ono,pdno,quantity) values(2,4,8);
insert into order_product(ono,pdno,quantity) values(2,5,6);
insert into order_product(ono,pdno,quantity) values(2,2,10);

insert into order_product(ono,pdno,quantity) values(6,1,2);
insert into order_product(ono,pdno,quantity) values(6,2,6);
insert into order_product(ono,pdno,quantity) values(6,7,2);


update inquiry_reply set content='etg' where iqrno=3;

SELECT rnum, pno, name, price, category
FROM(
	select row_number() over(order by hit desc) as rnum, pno, name, price, category,status 
	from product
	where status='판매중'
)
WHERE rnum between 1 and 2;

select * from product order by hit desc;




SELECT p.rnum, p.pno, p.name, p.price, p.category, i.url
	FROM(
		select row_number() over(order by hit desc) as rnum, pno, name, price, category
		from product
		where status='판매중'
	) p, image i
where p.rnum between 1 and 2
and i.pno = p.pno
and i.url like '%' || 'thumb' || '%';

