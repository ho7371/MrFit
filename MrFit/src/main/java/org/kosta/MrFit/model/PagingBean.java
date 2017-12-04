package org.kosta.MrFit.model;
/**
 * 페이징 처리를 위한 비즈니스 계층의 클래스 PagingBean method 구현순서 
 * getStartRowNumber()
 * getEndRowNumber()<br> getTotalPage()<br> getTotalPageGroup()<br>
 * getNowPageGroup()<br>getStartPageOfPageGroup()<br>
 * getEndPageOfPageGroup()<br> isPreviousPageGroup()<br>isNextPageGroup()<br><br>
 * 
 * -정리-<br>
 * getStartRowNumber() : 현재 페이지번호에 해당하는 시작게시물번호를 반환 <br>
 * getEndRowNumber() : 현재 페이지에서 보여줄 게시물 행(row)의 마지막 번호<br>
 * getTotalPage() : 총 페이지 수<br>
 * getTotalPageGroup() : 총 페이지 그룹의 수<br>
 * getNowPageGroup() : 현재 페이지가 속한 페이지 그룹 번호(몇 번째 페이지 그룹인지)<br>
 * getStartPageOfPageGroup() : 현재 페이지가 속한 페이지 그룹의 시작 페이지 번호<br>
 * getEndPageOfPageGroup() : 현재 페이지가 속한 페이지 그룹의 마지막 페이지 번호 <br>
 * isPreviousPageGroup() : 이전 페이지 그룹이 있는지 체크하는 메서드<br>
 * isNextPageGroup() : 다음 페이지 그룹이 있는지 체크하는 메서드<br>
 * 
 * @author kosta
 *
 */
public class PagingBean {
	/**
	 * 현재 페이지
	 */
	private int nowPage = 1;
	/**
	 * 페이지당 게시물수 : 한페이지에 보여줄 게시물 최대수
	 */
	private int postCountPerPage;	
	/**
	 * 페이지 그룹당 페이지 수 : 목록페이지 하단부에 제공할 페이지 수
	 */
	private int postCountPerPageGroup;	
	/**
	 * 총 게시물 수 : 
	 */
	private int totalPostCount;
	
	
	public PagingBean() {
		
	}
	
	public PagingBean(int totalPostCount, int nowPage, int postCountPerPage, int postCountPerPageGroup) {
		super();
		this.totalPostCount = totalPostCount;
		this.nowPage = nowPage;
		this.postCountPerPage = postCountPerPage;
		this.postCountPerPageGroup = postCountPerPageGroup;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	/**
	 * 현재 페이지 번호에 해당하는 시작 게시물 번호를 반환 <br>
	 * 이전 페이지 마지막 번호 + 1
	 * @return
	 */
	public int getStartRowNumber() {
		int srn=((nowPage-1)*postCountPerPage)+1;
		return srn;
	}
	/**
	  * 현재 페이지에서 보여줄 게시물 행(row)의 마지막 번호<br>
	  * 현재페이지*postCountPerPage 만약 총게시물수보다<br>
	  * 연산결과의 번호가 클 경우 총게시물수가 마지막 번호가 되어야 한다 
	      ex) 총게시물수 7 개 총페이지는 2페이지 : 1 2 3 4 5<br>
	  * | 6 7 | 1page 2page 현재페이지는 2페이지이고 2*5(페이지당 게시물수) 는 10 이고 실제 마지막 번호 7이다 -><br>
	  * 연산결과가 총게시물수보다 클 경우 총게시물수가 마지막번호가 되어야 함
	  * 
	  * @return
	  */
	 public int getEndRowNumber() {
		 int ern=nowPage*postCountPerPage;
		 if(totalPostCount<ern) 
			 ern=totalPostCount;
	  return ern;
	 }
	 /**
	  * 총 페이지 수를 return한다.<br>
	  * 1. 전체 데이터(게시물) % 한 페이지에 보여줄 데이터 개수 <br>
	  * => 0 이면 둘을 / 값이 총 페이지 수<br>
	  * 2. 전체 데이터(게시물) % 한 페이지에 보여줄 데이터 개수 <br>
	  * => 0보다 크면 둘을 / 값에 +1을 한 값이 총 페이지 수<br>
	  * 게시물수 1 2 3 4 5 6 7 8 9 10 11 12<br>
	  * 1페이지 1~5<br>
	  * 2페이지 6~10<br>
	  * 3페이지 11 <br>
	  * ex) 게시물 32 개 , 페이지당 게시물수 5개-> 7 페이지
	  * 
	  * @return
	  */
	 public int getTotalPage() {  
	  int totalPage = totalPostCount/postCountPerPage;
	  if(totalPostCount%postCountPerPage!=0) 
		  totalPage+=1;
	  return totalPage;
	 }

	 /**
	  * 총 페이지 그룹의 수를 return한다.<br>
	  * 1. 총 페이지수 % Page Group 내 Page 수. <br>
	  * => 0 이면 둘을 / 값이 총 페이지 수<br>
	  * 2. 총 페이지수 % Page Group 내 Page 수. <br>
	  * => 0보다 크면 둘을 / 값에 +1을 한 값이 총 페이지 수<br>
	  * ex) 총 게시물 수 23 개 <br>
	  * 총 페이지 ? 총 페이지 그룹수 ? <br>
	  * 페이지 1 2 3 4 5<br>
	  * 페이지그룹 1234(1그룹) 5(2그룹)<br>
	  * 
	  */
	 public int getTotalPageGroup() {  
	  int totalPageGroup = getTotalPage()/postCountPerPageGroup;
	  if(getTotalPage()%postCountPerPageGroup!=0) 
		  totalPageGroup+=1;
	  return totalPageGroup;
	 }

	 /**
	  * 현재 페이지가 속한 페이지 그룹 번호(몇 번째 페이지 그룹인지) 을 return 하는 메소드 <br>
	  * 1. 현재 페이지 % Page Group 내 Page 수 => 0 이면 <br>
	  * 둘을 / 값이 현재 페이지 그룹. <br>
	  * 2. 현재 페이지 % Page Group 내 Page 수 => 0 크면 <br>
	  * 둘을 / 값에 +1을 한 값이 현재 페이지 그룹<br>
	  * 페이지 1 2 3 4 /5 6 7 8/ 9 10 1그룹 2그룹 3그룹
	  * 
	  * @return
	  */
	 public int getNowPageGroup() {  
	  int nowPageGroup = nowPage/postCountPerPageGroup;
	  if(nowPage%postCountPerPageGroup!=0) 
		  nowPageGroup+=1;
	  return nowPageGroup;
	 }

	 /**
	  * 현재 페이지가 속한 페이지 그룹의 시작 페이지 번호를 return 한다.<br>
	  * Page Group 내 Page 수*(현재 페이지 그룹 -1) + 1을 한 값이 첫 페이지이다.<br>
	  * (페이지 그룹*페이지 그룹 개수, 그룹의 마지막 번호이므로) <br>
	  * 페이지 그룹 <br>
	  * 1 2 3 4 -> 5 6 7 8 -> 9 10 <br>
	  * 
	  * @return
	  */
	 //getNowPageGrop()을 활용한다 중복됨!
	 public int getStartPageOfPageGroup() {
	  int num = nowPage/postCountPerPageGroup*postCountPerPageGroup+1;
		 if(nowPage%postCountPerPageGroup==0)
			 num = (nowPage/postCountPerPageGroup-1)*postCountPerPageGroup+1;
	  return num;
	 }

	 /**
	  * 현재 페이지가 속한 페이지 그룹의 마지막 페이지 번호를 return 한다.<br>
	  * 1. 현재 페이지 그룹 * 페이지 그룹 개수 가 마지막 번호이다. <br>
	  * 2. 그 그룹의 마지막 페이지 번호가 전체 페이지의 마지막 페이지 번호보다 <br>
	  * 큰 경우는 전체 페이지의 마지막 번호를 return 한다.<br>
	  * 1 2 3 4 -> 5 6 7 8 -> 9 10
	  * 
	  * @return
	  */
	 public int getEndPageOfPageGroup() {
	  int num = this.getNowPageGroup()*this.postCountPerPageGroup;
	  if(this.getTotalPage()<num)
		  num = this.getTotalPage();
		  return num;
	 }

	 /**
	  * 이전 페이지 그룹이 있는지 체크하는 메서드 <br>
	  * 현재 페이지가 속한 페이지 그룹이 1보다 크면 true<br>
	  * ex ) 페이지 1 2 3 4 / 5 6 7 8 / 9 10 <br>
	  * 1 2 3 group
	  * 
	  * @return
	  */
	 public boolean isPreviousPageGroup() {
	  boolean flag = false;
	  if(this.getNowPageGroup()>1) 
		  flag = true;
	  
	  return flag;
	 }

	 /**
	  * 다음 페이지 그룹이 있는지 체크하는 메서드 <br>
	  * 현재 페이지 그룹이 마지막 페이지 그룹(<br>
	  * 마지막 페이지 그룹 == 총 페이지 그룹 수) 보다 작으면 true<br>
	  * * ex ) 페이지 <br>
	  * 1 2 3 4 / 5 6 7 8 / 9 10 <br>
	  * 1 2 3 group
	  * 
	  * @return
	  */
	 public boolean isNextPageGroup() {
	  boolean flag = false;
	  if(this.getNowPageGroup()<this.getTotalPageGroup())
		  flag = true;
	  return flag;
	 }

	@Override
	public String toString() {
		return "PagingBean [nowPage=" + this.nowPage + ", 스타트로우:"+ this.getStartRowNumber()+", 엔드로우:"+ this.getEndRowNumber()
				+", postCountPerPage=" + this.postCountPerPage + ", postCountPerPageGroup="
				+ this.postCountPerPageGroup + ", totalPostCount=" + this.totalPostCount +"]";
	}
}
