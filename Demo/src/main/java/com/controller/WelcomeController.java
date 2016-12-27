package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller


public class WelcomeController {
	/*@RequestMapping("/index")
	@RequestMapping(method = RequestMethod.GET)
	   public String printHello(ModelMap model) {
	      model.addAttribute("message", "Wellcome!! Happy Shopping ");

	      return "index";
	   }*/

	
	
	 @RequestMapping("/index") 
	 public ModelAndView hello() 
	 {
		 String helloWorldMessage = "Hello world from java2blog!"; 
		 return new ModelAndView("index", "message", helloWorldMessage); }
}
