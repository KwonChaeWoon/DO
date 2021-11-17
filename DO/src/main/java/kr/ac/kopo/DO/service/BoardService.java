package kr.ac.kopo.DO.service;

import java.util.List;

import kr.ac.kopo.DO.model.Board;
import kr.ac.kopo.DO.util.Pager;

public interface BoardService {


	void add(Board item);

	Board item(int bid);

	void update(Board item);

	void delete(int bid);

	List<Board> list(Board boardItem, Pager pager);

}
