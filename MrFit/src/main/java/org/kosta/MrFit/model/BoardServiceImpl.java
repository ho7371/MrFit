package org.kosta.MrFit.model;

import java.util.List;

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
		System.out.println("            BoardServiceImpl/deleteNotice()/진행 bvo : ");		
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

}
