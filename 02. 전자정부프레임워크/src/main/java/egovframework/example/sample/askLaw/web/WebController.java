package egovframework.example.sample.askLaw.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {
	@RequestMapping(value="main.do")
	public String home(ModelMap model) throws Exception{
		return "/askLaw/main";
	}
	
	@RequestMapping(value="chat.do")
	public String chat(ModelMap model) throws Exception{
		return "/askLaw/chat";
	}
}
