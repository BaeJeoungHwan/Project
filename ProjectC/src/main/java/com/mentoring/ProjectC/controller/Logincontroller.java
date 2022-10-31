package com.mentoring.ProjectC.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mentoring.ProjectC.dao.LoginService;
import com.mentoring.ProjectC.model.t3_Member;

@Controller
public class Logincontroller {
	
	private ModelAndView mv;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private LoginService loginService; 

	@RequestMapping("/login.do") 
	public String main(Model model) throws Exception{
		return "/login";
	}
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ModelAndView login(Model model, t3_Member member){
		mv = new ModelAndView();
        t3_Member tempmember = loginService.login(member);
        System.out.println(tempmember);
        
        if( tempmember != null) {
            session.setAttribute("memberNumSession", tempmember.getMemberNum());
            session.setAttribute("IdSession", tempmember.getMemberId());
            session.setAttribute("pwdSession", tempmember.getMemberPasswd());
            session.setAttribute("NameSession", tempmember.getMemberName());
            session.setAttribute("GenderSession", tempmember.getMemberGender());
            session.setAttribute("EmailSession", tempmember.getMemberEmail());
            session.setAttribute("SelectSession", tempmember.getMemberSelect());
            session.setAttribute("PointSession", tempmember.getMemberPoint());
            session.setAttribute("PhoneSession", tempmember.getMemberPhone());
            session.setAttribute("regionSession", tempmember.getReNum());

            mv.setViewName("redirect:/login.do");
            return mv;
        } else {
            mv.setViewName("/login");
            return mv;
        }
    }
	
	@RequestMapping("/logout") 
    public ModelAndView logout(Model model) {
		mv = new ModelAndView();
        session.invalidate();
        mv.setViewName("redirect:/");
        return mv;
    }
}
