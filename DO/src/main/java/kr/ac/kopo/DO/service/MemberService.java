package kr.ac.kopo.DO.service;

import java.util.List;

import kr.ac.kopo.DO.model.Member;

public interface MemberService {

	void add(Member item);
	
	boolean checkId(String id);

	Member item(String id);
	
	List<Member> list();

	void update(Member item);

	void delete(String id);

	Member login(String id);

}
