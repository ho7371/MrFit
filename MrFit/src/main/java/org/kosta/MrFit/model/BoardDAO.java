package org.kosta.MrFit.model;

import java.util.List;

public interface BoardDAO {
	List<BoardVO> noticeList(PagingBean pb);

	int getTotalNoticeCount();
}
