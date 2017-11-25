package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl  implements BoardDAO{
	@Resource	
	private SqlSessionTemplate template;
	//[정현][공지사항 리스트 출력]
	@Override
	public List<BoardVO> noticeList(PagingBean pb) {
		System.out.println("                  BoardDAOImpl/noticeList()/시작 ");
		List<BoardVO> nList= template.selectList("board.noticeList",pb);
		System.out.println("                  BoardDAOImpl/noticeList()/진행 nList : "+ nList);
		System.out.println("                  BoardDAOImpl/noticeList()/종료 ");
		return nList;
	}
	
	//[정현][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		System.out.println("                  BoardDAOImpl/getTotalNoticeCount()/시작 ");
		int ncount=template.selectOne("board.getTotalNoticeCount");
		System.out.println("                  BoardDAOImpl/getTotalNoticeCount()/진행 notice_count : "+ncount);
		System.out.println("                  BoardDAOImpl/getTotalNoticeCount()/종료 ");
		// TODO Auto-generated method stub
		return ncount;
	}

}
