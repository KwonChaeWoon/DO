package kr.ac.kopo.DO.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.DO.model.Reply;
import kr.ac.kopo.DO.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@PostMapping("/add")
	public void add(@RequestBody Reply item) {
		service.add(item);
		
	}
	
	@PostMapping("/update")
	public void update(@RequestBody Reply item) {
		service.update(item);
	}
	
	@RequestMapping("/delete")
	public void delete(String rid, String bid) {
		service.delete(rid, bid);
	}
	
}
