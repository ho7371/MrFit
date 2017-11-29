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
		System.out.println("            BoardServiceImpl/noticeList()/시작");
		List<BoardVO> nlist = boardDAO.noticeList(pb);
		System.out.println("            BoardServiceImpl/noticeList()/진행 nlist : "+ nlist);		
		System.out.println("            BoardServiceImpl/noticeList()/종료");
		return nlist;
	}
	//[정현][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		System.out.println("            BoardServiceImpl/getTotalNoticeCount()/시작");
		int Notice = boardDAO.getTotalNoticeCount();
		System.out.println("            BoardServiceImpl/getTotalNoticeCount()/진행 Notice : "+ Notice);		
		System.out.println("            BoardServiceImpl/getTotalNoticeCount()/종료");
		return Notice;
	}
	//[정현][해당 번호의 공지사항 상세보기]
	@Override
	public BoardVO noticeDetail(String bno) {
		System.out.println("            BoardServiceImpl/noticeDetail()/시작");
		BoardVO bvo = boardDAO.noticeDetail(bno);
		System.out.println("            BoardServiceImpl/noticeDetail()/진행 bvo : "+ bvo);		
		System.out.println("            BoardServiceImpl/noticeDetail()/종료");
		return bvo;
	}
	//[정현][해당 번호로 공지사항 삭제]
	@Override
	public void deleteNotice(String bno) {
		System.out.println("            BoardServiceImpl/deleteNotice()/시작 bno : "+bno);
		boardDAO.deleteNotice(bno);
		System.out.println("            BoardServiceImpl/deleteNotice()/진행 ");		
		System.out.println("            BoardServiceImpl/deleteNotice()/종료");
	}
	//[정현][공지사항 등록]
	@Override
	public void registerNotice(BoardVO bvo) {
		System.out.println("            BoardServiceImpl/registerNotice()/시작 bvo : "+bvo);
		boardDAO.registerNotice(bvo);
		System.out.println("            BoardServiceImpl/registerNotice()/진행 ");		
		System.out.println("            BoardServiceImpl/registerNotice()/종료");
		
	}
	@Override
	public void updateNotice(BoardVO bvo) {
		System.out.println("            BoardServiceImpl/updateNotice()/시작 bvo : "+bvo);
		boardDAO.updateNotice(bvo);
		System.out.println("            BoardServiceImpl/updateNotice()/진행 ");		
		System.out.println("            BoardServiceImpl/updateNotice()/종료");
		
	}
	//[현민][고객문의 목록]
	@Override
	public List<InquiryVO> inquiry(PagingBean pb) {
		System.out.println("            BoardServiceImpl/inquiry()/시작 ");
		System.out.println("            BoardServiceImpl/inquiry()/종료");
		return boardDAO.inquiry(pb);
	}
	//[진호, 현민][고객 문의상세]
	@Override
	public InquiryVO inquiryDetail(String bno) {
		System.out.println("            BoardServiceImpl/inquiryDetail()/시작 ");
		System.out.println("            BoardServiceImpl/inquiryDetail()/종료");
		return boardDAO.inquiryDetail(bno);
	}
	
	//[진호, 현민][고객 문의 댓글]
	@Override
	public void inquiryReply(Map<String, String> map) {
		System.out.println("            BoardServiceImpl/inquiryReply()/시작 ");
		System.out.println("            BoardServiceImpl/inquiryReply()/종료");
		boardDAO.inquiryReply(map);
	}
	@Override
	public int getTotalInquiryCount() {
		System.out.println("            BoardServiceImpl/getTotalInquiryCount()/시작");
		int inquiry = boardDAO.getTotalInquiryCount();
		System.out.println("            BoardServiceImpl/getTotalInquiryCount()/진행 inquiry : "+ inquiry);		
		System.out.println("            BoardServiceImpl/getTotalInquiryCount()/종료");
		return inquiry;
	}
	@Override
	public void deleteInquiry(String iqno) {
		System.out.println("            BoardServiceImpl/deleteInquiry()/시작 bno : "+iqno);
		boardDAO.deleteInquiry(iqno);
		System.out.println("            BoardServiceImpl/deleteInquiry()/진행");		
		System.out.println("            BoardServiceImpl/deleteInquiry()/종료");
		
	}
	@Override
	public void registerInquiry(InquiryVO ivo) {
		System.out.println("            BoardServiceImpl/registerInquiry()/시작 bvo : "+ivo);
		boardDAO.registerInquiry(ivo);
		System.out.println("            BoardServiceImpl/registerInquiry()/진행 ");		
		System.out.println("            BoardServiceImpl/registerInquiry()/종료");
		
	}
	@Override
	public void updateInquiry(InquiryVO ivo) {
		System.out.println("            BoardServiceImpl/updateInquiry()/시작 ivo : "+ivo);
		boardDAO.updateInquiry(ivo);
		System.out.println("            BoardServiceImpl/updateInquiry()/진행 ");		
		System.out.println("            BoardServiceImpl/updateInquiry()/종료");
		
	}

}
