package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mentoring.ProjectC.mapper.MemberMapper;
import com.mentoring.ProjectC.model.t3_Member;

@Service 
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(HashMap<String, Object> map) {
		memberMapper.insertMember(map);
	}
	
	@Override
	public t3_Member selectMemberList(HashMap<String, Object> map) throws Exception {
		t3_Member list = memberMapper.selectMemberList(map);
		return list;
	}
	
	@Override
	public List<t3_Member> selectPurchaseList(HashMap<String, Object> map) throws Exception {
		return memberMapper.selectPurchaseList(map);
	}
	
	@Override
    public List<t3_Member> selectPurchaseListsell(HashMap<String, Object> map) throws Exception {
        return memberMapper.selectPurchaseListsell(map);
    }

    @Override
    public List<t3_Member> selectPurchaseListbuy(HashMap<String, Object> map) throws Exception {
        return memberMapper.selectPurchaseListbuy(map);
    }
	
	@Override
	public void updateMember(HashMap<String, Object> map) {
		memberMapper.updateMember(map);
	}
	
	@Override
	public void deleteMember(HashMap<String, Object> map) {
//		memberMapper.deleteMember(map);
	}
	
    @Override
    public int selectId(HashMap<String, Object> map) {
        int cnt = memberMapper.selectId(map);
        return cnt;
    }
	
    @Override
    public void insertMentor(HashMap<String, Object> map) {
        String memnum = String.valueOf(memberMapper.getmemnum(map));
        map.put("memnum", memnum);
        memberMapper.insertMentor(map);
    }
    
    @Override
    public String getid(HashMap<String, Object> map) {
        String findid =  memberMapper.getid(map);
        return findid;
    }
    
    @Override
    public String getpw(HashMap<String, Object> map) {
        String findpw =  memberMapper.getpw(map);
        return findpw;
    }
    
    @Override
    public List<t3_Member> pointList(HashMap<String, Object> map) throws Exception {
        return memberMapper.pointList(map);
    }

    @Override
    public void savePoint(HashMap<String, Object> map) {
        memberMapper.savePoint(map);
    }
    @Override
    public void pointremove(HashMap<String, Object> map) {
        memberMapper.pointremove(map);
    }
    @Override
    public void orderpoint(HashMap<String, Object> map) {
        memberMapper.orderpoint(map);
    }
    
    @Override
    public void minuspoint(HashMap<String, Object> map) {
        memberMapper.minuspoint(map);
}
    
}
