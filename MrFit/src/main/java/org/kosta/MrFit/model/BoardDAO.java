package org.kosta.MrFit.model;

import java.util.List;

public interface BoardDAO {
	List<BoardVO> noticeList(PagingBean pb);

	int getTotalNoticeCount();

	BoardVO noticeDetail(String bno);

	void deleteNotice(String bno);

	void registerNotice(BoardVO bvo);

	void updateNotice(BoardVO bvo);
}
