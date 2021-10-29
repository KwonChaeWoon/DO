package kr.ac.kopo.DO.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.DO.model.Board;
import kr.ac.kopo.DO.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";

	@Autowired
	BoardService service;
	
	@RequestMapping({"/", "/list"})
	public String list(Model model) {
		List<Board> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
	
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Board item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update")
	public String update(String bid, Model model) {
		Board item = service.item(bid);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update")
	public String update(Board item) {
		service.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(String bid) {
		service.delete(bid);
		
		return "redirect:list";
	}
	
}
