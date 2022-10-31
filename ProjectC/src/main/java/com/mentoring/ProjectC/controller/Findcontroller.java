package com.mentoring.ProjectC.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mentoring.ProjectC.dao.BoardService;
import com.mentoring.ProjectC.dao.FindService;
import com.mentoring.ProjectC.model.t3_Find;
import com.mentoring.ProjectC.model.t3_Region;

@Controller
public class Findcontroller {

    @Autowired
    private FindService findService; 
	@Autowired
    private BoardService boardService;
	
    //공고게시판 리스트
    @RequestMapping("/findboard.do") 
    public String findboard(Model model) throws Exception{
    	List<t3_Region> regionList = boardService.selectRegionList();
    	model.addAttribute("regionList", new Gson().toJson(regionList));
    	
    	List<t3_Region> jobList = boardService.selectJobList();
    	model.addAttribute("jobList", new Gson().toJson(jobList));
    	return "/findboard";
    }
    
	@RequestMapping(value = "/findboard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("regionList")) {
			String region = map.get("regionList").toString();
			ObjectMapper mapper = new ObjectMapper();
		    List<Map<String, Object>> regionList = mapper.readValue(region, new TypeReference<ArrayList<Map<String, Object>>>(){});
			map.put("regionList", regionList);
		}
		if(map.containsKey("jobList")) {
			String job = map.get("jobList").toString();
			ObjectMapper mapper2 = new ObjectMapper();
		    List<Map<String, Object>> jobList = mapper2.readValue(job, new TypeReference<ArrayList<Map<String, Object>>>(){});
			map.put("jobList", jobList);
		}
		
		resultMap = findService.selectFindList(map);
		return new Gson().toJson(resultMap);
	}
	//공고게시판 상세조회
	@RequestMapping("/findview.do") 
    public String view(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "find_de";
    }
	
	@RequestMapping(value = "/findview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String view(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		t3_Find f = findService.selectGetFind(map);
		resultMap.put("find", f);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	//공고게시판 추가
    @RequestMapping("/findadd.do") 
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "find_add";
    }
    
	@RequestMapping(value = "/findadd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		findService.insertFind(map);
		resultMap.put("message", "등록");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    findService.deleteFind(map);
		resultMap.put("message", "삭제");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/fnpurchaserequest.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String fnpurchaserequest(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String msg = findService.orderinsert(map);
        resultMap.put("msg", msg);
        return new Gson().toJson(resultMap);
    }
	@RequestMapping(value = "/findupdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        findService.updateFind(map);
        resultMap.put("message", "占t嚥∽옙");
        return new Gson().toJson(resultMap);
    }
}
