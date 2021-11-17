package kr.ac.kopo.DO.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.DO.model.Board;
import kr.ac.kopo.DO.model.Reply;
import kr.ac.kopo.DO.service.BoardService;
import kr.ac.kopo.DO.service.ReplyService;
import kr.ac.kopo.DO.util.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";

	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping({"/", "/list"})
	public String list(Model model, String sub_cname, Pager pager) {
		Board boardItem = new Board();
		
		boardItem.setSubCname(sub_cname);
		
		List<Board> list = service.list(boardItem, pager);
		
		model.addAttribute("list", list);
		model.addAttribute("subCname", sub_cname);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add(Model model, String sub_cname) {
		model.addAttribute("subCname", sub_cname);
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Board item) {
		service.add(item);
		
		return "redirect:list?sub_cname="+item.getSubCname();
	}
	
	@GetMapping("/update")
	public String update(int bid, String sub_cname, Model model) {
		
		model.addAttribute("subCname", sub_cname);

		Board item = service.item(bid);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update")
	public String update(Board item) {
		service.update(item);
		
		return "redirect:list?sub_cname="+item.getSubCname();
	}
	
	@RequestMapping("/delete")
	public String delete(int bid, String sub_cname) {
		service.delete(bid);
		
		return "redirect:list?sub_cname="+sub_cname;
	}
	
	@RequestMapping("/view/{bid}")
	public String view(@PathVariable int bid, Model model) {
		Board item = service.item(bid);
		
		if(item == null)
			return "redirect:..";
		
		model.addAttribute("item", item);
		
		List<Reply> list = replyService.list(bid);
		
		model.addAttribute("list", list);
		
		return path + "view";
	}
	
}
