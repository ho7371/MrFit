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
		System.out.println("            MemberServiceImpl/noticeList()/시작");
		List<BoardVO> nlist = boardDAO.noticeList(pb);
		System.out.println("            MemberServiceImpl/noticeList()/진행 nlist : "+ nlist);		
		System.out.println("            MemberServiceImpl/noticeList()/종료");
		return nlist;
	}
	//[정현][공지사항 갯수 확인]
	@Override
	public int getTotalNoticeCount() {
		System.out.println("            MemberServiceImpl/getTotalNoticeCount()/시작");
		int Notice = boardDAO.getTotalNoticeCount();
		System.out.println("            MemberServiceImpl/getTotalNoticeCount()/진행 Notice : "+ Notice);		
		System.out.println("            MemberServiceImpl/getTotalNoticeCount()/종료");
		return 0;
	}

}
