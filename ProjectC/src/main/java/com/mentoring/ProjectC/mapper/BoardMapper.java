package com.mentoring.ProjectC.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mentoring.ProjectC.model.t3_Board;
import com.mentoring.ProjectC.model.t3_Comment;
import com.mentoring.ProjectC.model.t3_Mentor;
import com.mentoring.ProjectC.model.t3_Region;

@Mapper
public interface BoardMapper {
	
	List<t3_Board> selectactivityBoardList(HashMap<String, Object> map) throws Exception;
	
	List<t3_Board> selectBoardList() throws Exception; 
	
	List<t3_Mentor> selectMentorList() throws Exception;
	
	t3_Board selectGetBoard(HashMap<String, Object> map);
	
	void insertBoard(HashMap<String, Object> map);
	
	void deleteBoard(HashMap<String, Object> map);
	
	List<t3_Region> selectRegionList();

    List<t3_Region> selectJobList();
    
    void insertComment(HashMap<String, Object> map);
	
	List<t3_Comment> selectCommentList(HashMap<String, Object> map);
	
	// 조회수
	void updateCnt(HashMap<String, Object> map);
	void updateCommentcnt(HashMap<String, Object> map);
	
	
	
}
