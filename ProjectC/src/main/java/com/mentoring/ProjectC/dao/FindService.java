package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import com.mentoring.ProjectC.model.t3_Find;

public interface FindService {
	HashMap<String, Object> selectFindList(HashMap<String, Object> map) throws Exception;
	
	t3_Find selectGetFind(HashMap<String, Object> map);
	
	void insertFind(HashMap<String, Object> map);

	void deleteFind(HashMap<String, Object> map);
	
	String orderinsert(HashMap<String, Object> map);

	void updateFind(HashMap<String, Object> map);
}
