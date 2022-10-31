package com.mentoring.ProjectC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Maincontroller {

	//메인화면
	@RequestMapping("/")
	public String welcome() {
		return "main";
	}
	//마이페이지-활동목록
	@RequestMapping("mypage-activityList")
	public String mypage_activityList() {
		return "mypage-activityList";
	}
	//마이페이지-포인트관리
	@RequestMapping("mypage-point")
	public String mypage_point() {
		return "mypage-point";
	}
	//마이페이지-구매/판매 목록
	@RequestMapping("mypage-buy-sell-List")
	public String mypage_buy_sell_List() {
		return "mypage-buy-sell-List";
	}
	//아이디 찾기
	@RequestMapping("gotid")
	public String gotid() {
	    return "gotid";
	}
	//비밀번호 찾기
	@RequestMapping("gotpw")
	public String gotpw() {
	    return "gotpw";
	}
	//공고게시판
	@RequestMapping("findboard")
	public String findboard() {
	    return "findboard";
	}
	//멘토상세게시판
	@RequestMapping("mentordetail")
	public String mentordetail() {
	    return "mentordetail";
	}
	//로그인 팝업 화면
	@RequestMapping("showlogin")
	public String login() {
	    return "login";
	}
	//자유게시판
	@RequestMapping("board")
	public String board() {
	    return "board";
	}
	//고객센터
	@RequestMapping("Customer_service")
	public String Customer_service() {
	    return "Customer_Service";
	}	
	//회원가입
	@RequestMapping("join")
	public String join() {
	    return "Join";
	}
	//문의
	@RequestMapping("phoneNumber")
	public String phoneNumber() {
	    return "phoneNumber";
	}	
	//은행
	@RequestMapping("point")
	public String point() {
	    return "point";
	}
	
}
