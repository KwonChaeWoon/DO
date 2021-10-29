package kr.ac.kopo.DO.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.DO.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Board> list() {
		return sql.selectList("board.list");
	}

	@Override
	public void add(Board item) {
		sql.insert("board.add", item);
	}

	@Override
	public Board item(String bid) {
		return sql.selectOne("board.item", bid);
	}

	@Override
	public void update(Board item) {
		sql.update("board.update", item);
	}

	@Override
	public void delete(String bid) {
		sql.delete("board.delete", bid);
	}

}
