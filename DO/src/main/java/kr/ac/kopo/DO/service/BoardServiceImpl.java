package kr.ac.kopo.DO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.DO.dao.BoardDao;
import kr.ac.kopo.DO.model.Board;
import kr.ac.kopo.DO.util.Pager;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public List<Board> list(Board boardItem, Pager pager) {
		int total = dao.total(boardItem, pager);
		
		pager.setTotal(total);
		
		return dao.list(boardItem, pager);
	}

	
	@Override
	public void add(Board item) {
		dao.add(item);
	}

	@Override
	public Board item(int bid) {
		return dao.item(bid);
	}

	@Override
	public void update(Board item) {
		dao.update(item);
	}

	@Override
	public void delete(int bid) {
		dao.delete(bid);
	}

}
