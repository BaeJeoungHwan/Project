package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import com.mentoring.ProjectC.model.t3_Board;
import com.mentoring.ProjectC.model.t3_Mentor;
import com.mentoring.ProjectC.model.t3_Region;

public interface BoardService {
	List<t3_Board> selectBoardList() throws Exception;

	List<t3_Mentor> selectMentorList() throws Exception;
	
	HashMap<String, Object> selectGetBoard(HashMap<String, Object> map);
	
	List<t3_Board> selectactivityBoardList(HashMap<String, Object> map) throws Exception;
	
	void insertBoard(HashMap<String, Object> map);

	void deleteBoard(HashMap<String, Object> map);
	
	List<t3_Region> selectRegionList();

    List<t3_Region> selectJobList();
	
    void insertComment(HashMap<String, Object> map);
}
