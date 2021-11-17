package kr.ac.kopo.DO.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.DO.model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Reply item) {
		sql.insert("reply.add", item);
	}

	@Override
	public void update(Reply item) {
		sql.update("reply.update", item);

	}

	@Override
	public void delete(String rid, String bid) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("rid", rid);
		
		map.put("bid", bid);
		
		sql.delete("reply.delete", map);

	}

	@Override
	public List<Reply> list(int bid) {
		return sql.selectList("reply.list", bid);
	}

}
