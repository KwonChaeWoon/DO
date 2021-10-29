package kr.ac.kopo.DO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.DO.dao.BoardDao;
import kr.ac.kopo.DO.model.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public List<Board> list() {
		return dao.list();
	}

	@Override
	public void add(Board item) {
		dao.add(item);
	}

	@Override
	public Board item(String bid) {
		return dao.item(bid);
	}

	@Override
	public void update(Board item) {
		dao.update(item);
	}

	@Override
	public void delete(String bid) {
		dao.delete(bid);
	}

}
