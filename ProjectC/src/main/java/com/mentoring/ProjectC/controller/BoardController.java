package com.mentoring.ProjectC.controller;

import java.util.HashMap;
import java.util.List;

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
import com.mentoring.ProjectC.dao.BoardService;
import com.mentoring.ProjectC.model.t3_Board;
import com.mentoring.ProjectC.model.t3_Mentor;

@Controller
public class BoardController {
	
	@Autowired
    private BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/board.do") 
    public String board(Model model) throws Exception {
        return "/board";
    }
	
	@RequestMapping(value = "/board.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchBbsList(Model model) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<t3_Board> list = boardService.selectBoardList();
        List<t3_Mentor> mlist = boardService.selectMentorList();
        resultMap.put("list", list);
        resultMap.put("mlist", mlist);
        return new Gson().toJson(resultMap);
    }
	// 상세
	@RequestMapping("/boardview.do") 
    public String view(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "board_d";
    }
	
	@RequestMapping(value = "/boardview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String view(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = boardService.selectGetBoard(map);
		resultMap.put("board", resultMap.get("board"));
		resultMap.put("commentList", resultMap.get("selectCommentList"));
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/commentadd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentadd(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.insertComment(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	// 추가
    @RequestMapping("/boardadd.do") 
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "board_add";
    }
    
	@RequestMapping(value = "/boardadd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	map.put("membernum", session.getAttribute("memberNumSession"));
		boardService.insertBoard(map);
		resultMap.put("message", "등록");
		return new Gson().toJson(resultMap);
	}
	// 삭제
	@RequestMapping(value = "/boardremove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    boardService.deleteBoard(map);
		resultMap.put("message", "삭제");
		return new Gson().toJson(resultMap);
	}
}
