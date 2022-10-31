package com.mentoring.ProjectC.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mentoring.ProjectC.mapper.MentorMapper;
import com.mentoring.ProjectC.model.t3_Mentor;
import com.mentoring.ProjectC.model.t3_Review;

@Service 
public class MentorServiceImpl implements MentorService{

	@Autowired 
	private MentorMapper mentorMapper;
	
	@Override
	public void insertReview(HashMap<String, Object> map) {
		mentorMapper.insertReview(map);
	}
	
	@Override
	public HashMap<String, Object> selectGetMentor(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		t3_Mentor m = mentorMapper.selectGetMentor(map);
		List<t3_Review> ReviewList = mentorMapper.selectReviewList(map);
		resultMap.put("mentor", m);
		resultMap.put("selectReviewList", ReviewList);
		return resultMap;
	}
}
