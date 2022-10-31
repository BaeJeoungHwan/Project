package com.mentoring.ProjectC.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mentoring.ProjectC.model.t3_Mentor;
import com.mentoring.ProjectC.model.t3_Review;

@Mapper
public interface MentorMapper {
	t3_Mentor selectGetMentor(HashMap<String, Object> map); 
	
	void insertReview(HashMap<String, Object> map);
	
	List<t3_Review> selectReviewList(HashMap<String, Object> map);
}
