package com.mentoring.ProjectC.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mentoring.ProjectC.dao.MentorService;

@Controller
public class Mentorcontroller {

    @Autowired
    private MentorService mentorService; 

    @Autowired
	HttpSession session;
    
	@RequestMapping("/Mentorview.do") 
    public String view(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "mentordetail";
    }
	
	@ResponseBody
	@RequestMapping(value = "/Mentorview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String viewBoardBody(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = mentorService.selectGetMentor(map);
		resultMap.put("mentor", resultMap.get("mentor"));
		resultMap.put("reviewList", resultMap.get("selectReviewList"));
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/reviewadd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("writer", session.getAttribute("IdSession"));
		mentorService.insertReview(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
}
