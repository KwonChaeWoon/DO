package kr.ac.kopo.DO.dao;

import java.util.List;

import kr.ac.kopo.DO.model.Member;

public interface MemberDao {

	void add(Member item);

	int checkId(String id);

	Member item(String id);

	List<Member> list();

	void update(Member item);

	void delete(String id);
	
	Member login(String id);
}
