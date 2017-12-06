package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardDAO {
	List<BoardVO> noticeList(PagingBean pb);

	int getTotalNoticeCount();

	BoardVO noticeDetail(String bno);

	void deleteNotice(String bno);

	void registerNotice(BoardVO bvo);

	void updateNotice(BoardVO bvo);

	List<InquiryVO> inquiry(PagingBean pb);

	InquiryVO inquiryDetail(String bno);

	void inquiryReply(Map<String, String> map);

	int getTotalInquiryCount();

	void deleteInquiry(String iqno);

	void registerInquiry(InquiryVO ivo);

	void updateInquiry(InquiryVO ivo);

	void updateInquiryReply(HashMap<String, String> map);
}
