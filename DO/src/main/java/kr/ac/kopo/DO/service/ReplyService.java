package kr.ac.kopo.DO.service;

import java.util.List;

import kr.ac.kopo.DO.model.Reply;

public interface ReplyService {
	
	void add(Reply item);

	void update(Reply item);

	void delete(String rid);
	
	List<Reply> list(int bid);

}
