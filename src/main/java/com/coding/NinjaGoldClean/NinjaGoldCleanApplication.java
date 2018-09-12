package com.coding.NinjaGoldClean;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@SpringBootApplication
public class NinjaGoldCleanApplication {
	Random rand = new Random();
	public static void main(String[] args) {
		SpringApplication.run(NinjaGoldCleanApplication.class, args);
	}
	@RequestMapping("/")
	public String index(HttpSession session) {
		Date dt = new Date();
		System.out.println("hit index");
		if(session.getAttribute("gold")==null || session.getAttribute("log")==null) {
			ArrayList<String> log = new ArrayList<String>();
			log.add(0,"<p>Started new game at 0 gold<p>");
			session.setAttribute("log",log);
			session.setAttribute("gold",0);
		}
		return "index";
	}
	
	@RequestMapping(value="process", method=RequestMethod.POST)
	public String process(@RequestParam(value="min") int min, @RequestParam(value="max") int max, @RequestParam(value="str") String str,@RequestParam(value="reset", defaultValue ="") String reset,HttpSession session,Model model) {
		System.out.println("hit process");
		Date dt = new Date();
		String stringDate = DateFormat.getDateTimeInstance().format(dt);
		if(reset.equals("reset")||session.getAttribute("gold")==null || session.getAttribute("log")==null) {
			session.invalidate();
			return "redirect:/";
		}
		int current_gold = (int) session.getAttribute("gold");
		ArrayList<String> log = (ArrayList<String>) session.getAttribute("log");
		int x = rand.nextInt(max)+min;
		current_gold+= x;
		String win = "";
		String prefix = "";
		if(x>0) {
			win="earned "; 
			prefix= "<p class='green";
		}
		else {
			win="earned "; 
			prefix= "<p class='red";
		}
		String newlog =(prefix+str + win + x +" gold, balance is now: "+ current_gold +" "+ stringDate);
		log.add(0,newlog);
		session.setAttribute("gold", current_gold);
		session.setAttribute("log", log);
		model.addAttribute("gold");
		model.addAttribute("log");
		
		return "redirect:/";
		
	}
	
}
