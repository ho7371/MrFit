package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl  implements BoardDAO{
	@Resource	
	private SqlSessionTemplate template;
	//[정현][11/25][공지사항 리스트 출력]
	@Override
	public List<BoardVO> noticeList(PagingBean pb) {
		System.out.println("                  BoardDAOImpl/noticeList()/시작 pb :  "+pb.getStartRowNumber()+" ,"+pb.getEndRowNumber());
		List<BoardVO> nList= template.selectList("board.noticeList",pb);
		System.out.println("                  BoardDAOImpl/noticeList()/진행 nList : "+ nList);
		System.out.println("                  BoardDAOImpl/noticeList()/종료 ");
		return nList;
	}
	
	//[정현][11/25][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		System.out.println("                  BoardDAOImpl/getTotalNoticeCount()/시작 ");
		int ncount=template.selectOne("board.getTotalNoticeCount");
		System.out.println("                  BoardDAOImpl/getTotalNoticeCount()/진행 notice_count : "+ncount);
		System.out.println("                  BoardDAOImpl/getTotalNoticeCount()/종료 ");
		// TODO Auto-generated method stub
		return ncount;
	}
	//[정현][11/25][공지사항 상세보기]
	@Override
	public BoardVO noticeDetail(String bno) {
		System.out.println("                  BoardDAOImpl/noticeDetail()/시작 ");
		BoardVO bvo=template.selectOne("board.noticeDetail",bno);
		System.out.println("                  BoardDAOImpl/noticeDetail()/진행 bvo : "+bvo);
		System.out.println("                  BoardDAOImpl/noticeDetail()/종료 ");
		// TODO Auto-generated method stub
		return bvo;
	}
	//[정현][11/25][공지사항 삭제]
	@Override
	public void deleteNotice(String bno) {
		System.out.println("                  BoardDAOImpl/deleteNotice()/시작 bno : "+bno);
		template.delete("board.deleteNotice",bno);
		System.out.println("                  BoardDAOImpl/deleteNotice()/진행 ");
		System.out.println("                  BoardDAOImpl/deleteNotice()/종료 ");
	}
	//[정현][11/25][공지사항 등록]
	@Override
	public void registerNotice(BoardVO bvo) {
		System.out.println("                  BoardDAOImpl/registerNotice()/시작 bvo : "+bvo);
		template.insert("board.registerNotice",bvo);
		System.out.println("                  BoardDAOImpl/registerNotice()/진행 ");
		System.out.println("                  BoardDAOImpl/registerNotice()/종료 ");
		
	}

	@Override
	public void updateNotice(BoardVO bvo) {
		System.out.println("                  BoardDAOImpl/updateNotice()/시작 bvo : "+bvo);
		template.update("board.updateNotice",bvo);
		System.out.println("                  BoardDAOImpl/updateNotice()/진행 ");
		System.out.println("                  BoardDAOImpl/updateNotice()/종료 ");
	}
	
	//[진호, 현민][11/28][고객문의]
	@Override
	public List<BoardVO> inquiry() {
		System.out.println("                  BoardDAOImpl/inquiry()/시작 ");
		System.out.println("                  BoardDAOImpl/inquiry()/종료 ");
		return template.selectList("board.inquiry");
	}
	
	//[진호, 현민][11/28][고객문의 상세보기]
	@Override
	public InquiryVO inquiryDetail(String bno) {
		System.out.println("                  BoardDAOImpl/inquiryDetail()/시작 ");
		InquiryVO vo = null;
		int count = template.selectOne("board.inquiryReplyCheck", bno);
		if(count==1) {
			System.out.println("                  BoardDAOImpl/inquiryDetail()/진행 - 고객문의에서 댓글이 있을경우");
			vo = template.selectOne("board.inquiryDetail",bno);
		}else {
			System.out.println("                  BoardDAOImpl/inquiryDetail()/진행 - 고객문의에서 댓글이 없을경우");
			vo = template.selectOne("board.inquiryDetailNotReply", bno);
		}
		System.out.println("                  BoardDAOImpl/inquiryDetail()/종료 ");
		return vo;
	}
	
	//[진호, 현민][11/28][고객문의 댓글]
	@Override
	public void inquiryReply(Map<String, String> map) {
		System.out.println("                  BoardDAOImpl/inquiryReply()/시작 ");
		System.out.println("                  BoardDAOImpl/inquiryReply()/종료 ");
		template.insert("board.inquiryReply",map);
	}

		
}
