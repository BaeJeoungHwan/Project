package com.mentoring.ProjectC.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mentoring.ProjectC.model.t3_Find;

@Mapper
public interface FindMapper {
	List<t3_Find> selectFindList(HashMap<String, Object> map) throws Exception;
	
	int selectFindCnt(HashMap<String, Object> map);
	
	t3_Find selectGetFind(HashMap<String, Object> map);
	
	void insertFind(HashMap<String, Object> map);
	
	void deleteFind(HashMap<String, Object> map);
	
	void orderinsert(HashMap<String, Object> map);
	
	int checkPoint(HashMap<String, Object> map);
	
	void updateFind(HashMap<String, Object> map);
}
