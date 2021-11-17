package kr.ac.kopo.DO.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.DO.model.Board;
import kr.ac.kopo.DO.util.Pager;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	

	@Override
	public List<Board> list(Board boardItem, Pager pager) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardItem", boardItem);
		
		map.put("pager", pager);
		
		return sql.selectList("board.list", map);
	}

	@Override
	public void add(Board item) {
		sql.insert("board.add", item);
	}

	@Override
	public Board item(int bid) {
		return sql.selectOne("board.item", bid);
	}

	@Override
	public void update(Board item) {
		sql.update("board.update", item);
	}

	@Override
	public void delete(int bid) {
		sql.delete("board.delete", bid);
	}

	@Override
	public int total(Board boardItem, Pager pager) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardItem", boardItem);
		
		map.put("pager", pager);
		
		return sql.selectOne("board.total", map);
	}

}
