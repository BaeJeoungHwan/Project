package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mentoring.ProjectC.mapper.BoardMapper;
import com.mentoring.ProjectC.model.t3_Board;
import com.mentoring.ProjectC.model.t3_Comment;
import com.mentoring.ProjectC.model.t3_Mentor;
import com.mentoring.ProjectC.model.t3_Region;
import com.mentoring.ProjectC.model.t3_Review;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<t3_Board> selectBoardList() throws Exception {
		// TODO Auto-generated method stub
		List<t3_Board> list = boardMapper.selectBoardList();
		return list;
	}
	
	@Override
	public List<t3_Mentor> selectMentorList() throws Exception {
		List<t3_Mentor> list = boardMapper.selectMentorList();
		return list;
	}
	
	@Override
	public void insertComment(HashMap<String, Object> map) {
		boardMapper.insertComment(map);
		boardMapper.updateCommentcnt(map);
	}
	
	@Override
	public HashMap<String, Object> selectGetBoard(HashMap<String, Object> map) {
		// 조회수 
		boardMapper.updateCnt(map);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		t3_Board b = boardMapper.selectGetBoard(map);
		List<t3_Comment> CommentList = boardMapper.selectCommentList(map);
		resultMap.put("board", b);
		resultMap.put("selectCommentList", CommentList);
		return resultMap;
	}
	
	@Override
	public void insertBoard(HashMap<String, Object> map) {
		boardMapper.insertBoard(map);
	}
	
	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		boardMapper.deleteBoard(map);
	}
	
	@Override
	public List<t3_Board> selectactivityBoardList(HashMap<String, Object> map) throws Exception {
		return boardMapper.selectactivityBoardList(map);
	}
	
	@Override
    public List<t3_Region> selectRegionList(){
        List<t3_Region> regionList = boardMapper.selectRegionList();
        return regionList;
    }

    @Override
    public List<t3_Region> selectJobList(){
        List<t3_Region> jobList = boardMapper.selectJobList();
        return jobList;
    }
}
