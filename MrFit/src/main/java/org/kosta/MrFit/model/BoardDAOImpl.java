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
		return nList;
	}
	
	//[정현][11/25][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		int ncount=template.selectOne("board.getTotalNoticeCount");
		return ncount;
	}
	//[정현][11/25][공지사항 상세보기]
	@Override
	public BoardVO noticeDetail(String bno) {
		BoardVO bvo=template.selectOne("board.noticeDetail",bno);
		return bvo;
	}
	//[정현][11/25][공지사항 삭제]
	@Override
	public void deleteNotice(String bno) {
		template.delete("board.deleteNotice",bno);
	}
	//[정현][11/25][공지사항 등록]
	@Override
	public void registerNotice(BoardVO bvo) {
		template.insert("board.registerNotice",bvo);
		
	}

	@Override
	public void updateNotice(BoardVO bvo) {
		template.update("board.updateNotice",bvo);
	}
	
	//[진호, 현민][11/28][고객문의]
	@Override
	public List<InquiryVO> inquiry(PagingBean pb) {
		return template.selectList("board.inquiry",pb);
	}
	
	//[진호, 현민][11/28][고객문의 상세보기]
	@Override
	public InquiryVO inquiryDetail(String bno) {
		InquiryVO vo = null;
		int count = template.selectOne("board.inquiryReplyCheck", bno);
		if(count==1) {
			System.out.println("                  BoardDAOImpl/inquiryDetail()/진행 - 고객문의에서 댓글이 있을경우");
			vo = template.selectOne("board.inquiryDetail",bno);
		}else {
			System.out.println("                  BoardDAOImpl/inquiryDetail()/진행 - 고객문의에서 댓글이 없을경우");
			vo = template.selectOne("board.inquiryDetailNotReply", bno);
		}
		return vo;
	}
	
	//[진호, 현민][11/28][고객문의 댓글]
	@Override
	public void inquiryReply(Map<String, String> map) {
		template.insert("board.inquiryReply",map);
	}
	//[정현][11/29] [고객문의 글 수량 ]
	@Override
	public int getTotalInquiryCount() {
		int Inquiry=template.selectOne("board.getTotalInquiryCount");
		return Inquiry;
	}
	//[정현][11/29] [고객문의 삭제 ]
	@Override
	public void deleteInquiry(String iqno) {
		template.delete("board.deleteInquiry",iqno);
	}

	@Override
	public void registerInquiry(InquiryVO ivo) {
		template.insert("board.registerInquiry",ivo);
		
	}

	@Override
	public void updateInquiry(InquiryVO ivo) {
		template.update("board.updateInquiry",ivo);
		
	}

		
}
