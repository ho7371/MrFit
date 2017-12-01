package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public  class BoardServiceImpl implements BoardService {
	@Resource
	private BoardDAO boardDAO;
	//[정현][공지사항 리스트 출력]
	@Override
	public List<BoardVO> noticeList(PagingBean pb) {
		List<BoardVO> nlist = boardDAO.noticeList(pb);
		System.out.println("            BoardServiceImpl/noticeList()/진행 nlist : "+ nlist);		
		return nlist;
	}
	//[정현][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		int Notice = boardDAO.getTotalNoticeCount();
		System.out.println("            BoardServiceImpl/getTotalNoticeCount()/진행 Notice : "+ Notice);		
		return Notice;
	}
	//[정현][해당 번호의 공지사항 상세보기]
	@Override
	public BoardVO noticeDetail(String bno) {
		BoardVO bvo = boardDAO.noticeDetail(bno);
		System.out.println("            BoardServiceImpl/noticeDetail()/진행 bvo : "+ bvo);		
		return bvo;
	}
	//[정현][해당 번호로 공지사항 삭제]
	@Override
	public void deleteNotice(String bno) {
		System.out.println("            BoardServiceImpl/deleteNotice()/시작 bno : "+bno);
		boardDAO.deleteNotice(bno);
		System.out.println("            BoardServiceImpl/deleteNotice()/진행 ");		
	}
	//[정현][공지사항 등록]
	@Override
	public void registerNotice(BoardVO bvo) {
		System.out.println("            BoardServiceImpl/registerNotice()/시작 bvo : "+bvo);
		boardDAO.registerNotice(bvo);
		System.out.println("            BoardServiceImpl/registerNotice()/진행 ");		
		
	}
	@Override
	public void updateNotice(BoardVO bvo) {
		System.out.println("            BoardServiceImpl/updateNotice()/시작 bvo : "+bvo);
		boardDAO.updateNotice(bvo);
		System.out.println("            BoardServiceImpl/updateNotice()/진행 ");		
		
	}
	//[현민][고객문의 목록]
	@Override
	public List<InquiryVO> inquiry(PagingBean pb) {
		return boardDAO.inquiry(pb);
	}
	//[진호, 현민][고객 문의상세]
	@Override
	public InquiryVO inquiryDetail(String bno) {
		return boardDAO.inquiryDetail(bno);
	}
	
	//[진호, 현민][고객 문의 댓글]
	@Override
	public void inquiryReply(Map<String, String> map) {
		boardDAO.inquiryReply(map);
	}
	@Override
	public int getTotalInquiryCount() {
		int inquiry = boardDAO.getTotalInquiryCount();
		System.out.println("            BoardServiceImpl/getTotalInquiryCount()/진행 inquiry : "+ inquiry);		
		return inquiry;
	}
	@Override
	public void deleteInquiry(String iqno) {
		System.out.println("            BoardServiceImpl/deleteInquiry()/시작 bno : "+iqno);
		boardDAO.deleteInquiry(iqno);
		System.out.println("            BoardServiceImpl/deleteInquiry()/진행");		
		
	}
	@Override
	public void registerInquiry(InquiryVO ivo) {
		System.out.println("            BoardServiceImpl/registerInquiry()/시작 bvo : "+ivo);
		boardDAO.registerInquiry(ivo);
		System.out.println("            BoardServiceImpl/registerInquiry()/진행 ");		
		
	}
	@Override
	public void updateInquiry(InquiryVO ivo) {
		System.out.println("            BoardServiceImpl/updateInquiry()/시작 ivo : "+ivo);
		boardDAO.updateInquiry(ivo);
		System.out.println("            BoardServiceImpl/updateInquiry()/진행 ");		
		
	}

}
