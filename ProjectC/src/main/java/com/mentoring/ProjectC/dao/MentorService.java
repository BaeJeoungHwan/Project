package com.mentoring.ProjectC.dao;

import java.util.HashMap;

import com.mentoring.ProjectC.model.t3_Mentor;

public interface MentorService {
	
	HashMap<String, Object> selectGetMentor(HashMap<String, Object> map);
	
	void insertReview(HashMap<String, Object> map);
}
