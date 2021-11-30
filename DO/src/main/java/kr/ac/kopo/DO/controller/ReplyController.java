package kr.ac.kopo.DO.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.DO.model.Member;
import kr.ac.kopo.DO.model.Reply;
import kr.ac.kopo.DO.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@PostMapping("/add")
	public void add(@RequestBody Reply item, @SessionAttribute Member member) {
		item.setId(member.getId());
		item.setName(member.getName());
		
		service.add(item);
		
	}
	
	@PostMapping("/update")
	public void update(@RequestBody Reply item) {
		service.update(item);
	}
	
	@RequestMapping("/delete/{rid}")
	public void delete(@PathVariable String rid) {
		service.delete(rid);
	}
	
}
