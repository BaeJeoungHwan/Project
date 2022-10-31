package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import com.mentoring.ProjectC.model.t3_Member;

public interface MemberService {
	
	void insertMember(HashMap<String, Object> map);
	
	t3_Member selectMemberList(HashMap<String, Object> map) throws Exception;
	
	List<t3_Member> selectPurchaseList(HashMap<String, Object> map) throws Exception;
	
	List<t3_Member> selectPurchaseListsell(HashMap<String, Object> map) throws Exception;

    List<t3_Member> selectPurchaseListbuy(HashMap<String, Object> map) throws Exception;
	
	void updateMember(HashMap<String, Object> map);
	
	void deleteMember(HashMap<String, Object> map);
	
	public int selectId(HashMap<String, Object> map);
	
	void insertMentor(HashMap<String, Object> map);
	
	String getid(HashMap<String, Object> map);

    String getpw(HashMap<String, Object> map);
    
    List<t3_Member> pointList(HashMap<String, Object> map) throws Exception;;

    void savePoint(HashMap<String, Object> map);

    void pointremove(HashMap<String, Object> map);

    void orderpoint(HashMap<String, Object> map);
    
    void minuspoint(HashMap<String, Object> map);
}

