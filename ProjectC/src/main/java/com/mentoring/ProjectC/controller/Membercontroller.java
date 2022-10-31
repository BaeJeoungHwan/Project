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
import com.mentoring.ProjectC.dao.MemberService;
import com.mentoring.ProjectC.model.t3_Board;
import com.mentoring.ProjectC.model.t3_Member;

@Controller
public class Membercontroller {

    @Autowired
    private MemberService memberService; 

    @Autowired
    private BoardService boardService; 
    
    @Autowired
	HttpSession session;
    
    @RequestMapping("/join.do") 
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "Join";
    }    
    
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		 memberService.insertMember(map); 
		 resultMap.put("message", "성공"); 
		 return new Gson().toJson(resultMap);
	}
	
    @RequestMapping("/info.do") 
    public String searchBbsList(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
    	if(session.getAttribute("SelectSession").equals('T')) {
    		System.out.println("teacher access...");
    		return "mypage-myinfo";
    	}
    	if(session.getAttribute("SelectSession").equals('S')){
    		System.out.println("Student access...");
    		return "mypage-myinfo";
    	}
    	if(session.getAttribute("SelectSession").equals('A')) {
    		System.out.println("Admin access...");
    		return "mypage-admin";
    	}
        return "mypage-myinfo";
    }
    
    @RequestMapping("/PurchaseList.do") 
    public String purchaseList(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "mypage-admin-parcharseList";
    }
    
    @RequestMapping(value = "/fnPurchaseGetList-sell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String fnPurchaseGetList_sell(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<t3_Member> list = memberService.selectPurchaseListsell(map);
        resultMap.put("list", list);
        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/fnPurchaseGetList-buy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String fnPurchaseGetList_buy(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<t3_Member> list = memberService.selectPurchaseListbuy(map);
        resultMap.put("list", list);
        return new Gson().toJson(resultMap);
    }
    
  	@RequestMapping(value = "/fnPurchaseGetList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
  	@ResponseBody
  	public String fnPurchaseGetList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		List<t3_Member> list = memberService.selectPurchaseList(map);
  		resultMap.put("list", list);
  		return new Gson().toJson(resultMap);
  	}
    
	@RequestMapping(value = "/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        t3_Member list = memberService.selectMemberList(map);
        resultMap.put("list", list);
        return new Gson().toJson(resultMap);
    }
	
	@RequestMapping("/activityboard.do") 
    public String board(Model model) throws Exception {
        return "/mypage-activityList";
    }
	
	@RequestMapping(value = "/activityboard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchactivityList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<t3_Board> list = boardService.selectactivityBoardList(map);
        resultMap.put("list", list);
        return new Gson().toJson(resultMap);
    }
	
	@RequestMapping(value = "/infoupdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String update(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		memberService.updateMember(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/infodelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		memberService.deleteMember(map);
		return new Gson().toJson(resultMap);
	}
	
    @RequestMapping(value = "/selectId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public int selectId(@RequestParam HashMap<String, Object> map) {
        int cnt = memberService.selectId(map);
        System.out.println(cnt);
        return cnt;
    }
    
    @RequestMapping(value = "/join-detail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String add_detail(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        System.out.println(map);
        memberService.insertMentor(map);
        return new Gson().toJson(resultMap);
    }
    
    @RequestMapping("/join-detail") 
    public String add_detail2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        model.addAttribute("memberid", map.get("memberid"));
        return "/Join-detail";
    }
    
    @RequestMapping(value = "/getid.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getid(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String findid = memberService.getid(map);
        String msg = "";
        String result = "success";
        if(findid == null || findid.equals("") ) {
            msg = "이름과 이메일을 확인해 주세요.";
            result = "fail";
        } else {
            msg = "";
        }
        resultMap.put("msg", msg);
        resultMap.put("result", result);
        resultMap.put("findid", findid);
        return new Gson().toJson(resultMap);
    }
    
    @RequestMapping(value = "/getpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getpw(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String findpw = memberService.getpw(map);
        String msg = "";
        String result = "success";
        if(findpw == null || findpw.equals("") ) {
            msg = "이름과 이메일을 확인해 주세요.";
            result = "fail";
        } else {
            msg = "";
        }
        resultMap.put("msg", msg);
        resultMap.put("result", result);
        resultMap.put("findpw", findpw);
        return new Gson().toJson(resultMap);
    }
    
    @RequestMapping(value = "/pointList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String pointList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<t3_Member> list = memberService.pointList(map);
        resultMap.put("list", list);
        System.out.println(resultMap);
        return new Gson().toJson(resultMap);
    }
  @RequestMapping(value = "/pointsave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
  @ResponseBody
  public String pointsave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
      HashMap<String, Object> resultMap = new HashMap<String, Object>();
      memberService.savePoint(map);
      return new Gson().toJson(resultMap);
  }

  @RequestMapping(value = "/pointremove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
  @ResponseBody
  public String pointremove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
      HashMap<String, Object> resultMap = new HashMap<String, Object>();
      memberService.pointremove(map);
      System.out.print(map);
      resultMap.put("message", "충전완료 삭제");
      return new Gson().toJson(resultMap);
  }

     @RequestMapping(value = "/orderpoint.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
      @ResponseBody
      public String orderpoint(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
          HashMap<String, Object> resultMap = new HashMap<String, Object>();
          memberService.orderpoint(map);
          return new Gson().toJson(resultMap);
      }
     
     @RequestMapping(value = "/minuspoint.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
     @ResponseBody
     public String minuspoint(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
         HashMap<String, Object> resultMap = new HashMap<String, Object>();
         memberService.minuspoint(map);
         resultMap.put("message", "신청완료 포인트차감!");
         return new Gson().toJson(resultMap);
     }
}
