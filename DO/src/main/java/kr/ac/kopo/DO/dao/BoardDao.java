package kr.ac.kopo.DO.dao;

import java.util.List;

import kr.ac.kopo.DO.model.Board;

public interface BoardDao {

	List<Board> list();

	void add(Board item);

	Board item(String bid);

	void update(Board item);

	void delete(String bid);

}
