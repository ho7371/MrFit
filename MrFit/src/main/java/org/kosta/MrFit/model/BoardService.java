package org.kosta.MrFit.model;

import java.util.List;

public interface BoardService {

	List<BoardVO> noticeList(PagingBean pb);

	int getTotalNoticeCount();

	
}
