package kr.ac.kopo.DO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.DO.dao.ReplyDao;
import kr.ac.kopo.DO.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao dao;
	
	@Override
	public void add(Reply item) {
		dao.add(item);
		
	}

	@Override
	public void update(Reply item) {
		dao.update(item);

	}

	@Override
	public void delete(String rid) {
		dao.delete(rid);

	}

	@Override
	public List<Reply> list(int bid) {
		return dao.list(bid);
	}

}
