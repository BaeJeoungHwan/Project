package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mentoring.ProjectC.mapper.FindMapper;
import com.mentoring.ProjectC.model.t3_Find;


@Service 
public class FindServiceImpl implements FindService{

	@Autowired 
	private FindMapper findMapper;
	
	@Override
	public HashMap<String, Object> selectFindList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		List<t3_Find> list = findMapper.selectFindList(map);
		int cnt = findMapper.selectFindCnt(map);
		
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		return resultMap;
	}
	
	@Override
	public t3_Find selectGetFind(HashMap<String, Object> map) {
		return findMapper.selectGetFind(map);
	}
	
	@Override
	public void insertFind(HashMap<String, Object> map) {
		findMapper.insertFind(map);
	}
	
	@Override
	public void deleteFind(HashMap<String, Object> map) {
		findMapper.deleteFind(map);
	}
	
	@Override
    public String orderinsert(HashMap<String, Object> map) {
        int cnt = findMapper.checkPoint(map);
        String msg = "";
        if(cnt > 0) {
            findMapper.orderinsert(map);
            msg = "success";
        } else {
            msg = "fail";
        }
        return msg;
    }
	
	@Override
    public void updateFind(HashMap<String, Object> map) {
        findMapper.updateFind(map);
    }
}
