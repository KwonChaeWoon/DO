package kr.ac.kopo.DO.dao;

import java.util.List;

import kr.ac.kopo.DO.model.Reply;

public interface ReplyDao {

	void add(Reply item);

	void update(Reply item);

	void delete(String rid, String bid);

	List<Reply> list(int bid);

}