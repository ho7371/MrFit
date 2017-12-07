package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public  class BoardServiceImpl implements BoardService {
	@Resource
	private BoardDAO boardDAO;
	//[정현][공지사항 리스트 출력]
	@Override
	public List<BoardVO> noticeList(PagingBean pb) {
		List<BoardVO> nlist = boardDAO.noticeList(pb);
		return nlist;
	}
	//[정현][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		int Notice = boardDAO.getTotalNoticeCount();
		return Notice;
	}
	//[정현][해당 번호의 공지사항 상세보기]
	@Override
	public BoardVO noticeDetail(String bno) {
		BoardVO bvo = boardDAO.noticeDetail(bno);
		return bvo;
	}
	//[정현][해당 번호로 공지사항 삭제]
	@Override
	public void deleteNotice(String bno) {
		boardDAO.deleteNotice(bno);
	}
	//[정현][공지사항 등록]
	@Override
	public void registerNotice(BoardVO bvo) {
		boardDAO.registerNotice(bvo);
		
	}
	@Override
	public void updateNotice(BoardVO bvo) {
		boardDAO.updateNotice(bvo);
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
		return inquiry;
	}
	@Override
	public void deleteInquiry(String iqno) {
		boardDAO.deleteInquiry(iqno);
		
	}
	@Override
	public void registerInquiry(InquiryVO ivo) {
		boardDAO.registerInquiry(ivo);
		
	}
	@Override
	public void updateInquiry(InquiryVO ivo) {
		boardDAO.updateInquiry(ivo);
	}
	
	// [진호][고객문의에 달린 관리자 댓글 수정]
	@Override
	public void updateInquiryReply(HashMap<String, String> map) {
		boardDAO.updateInquiryReply(map);
	}
	
	@Override
	@Transactional
	public void deleteReview(String rno) {
		boardDAO.deleteReview(rno);
		
	}
	@Override
	@Transactional
	public void deletePQna(String pqno) {
		boardDAO.deletePQna(pqno);
		
	}
	@Override
	@Transactional
	public void deleteQna(String iqno) {
		boardDAO.deleteQna(iqno);
		
	}
}
