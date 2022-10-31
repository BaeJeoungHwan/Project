package com.mentoring.ProjectC.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mentoring.ProjectC.model.t3_Member;

@Mapper
public interface LoginMapper {
	t3_Member login (t3_Member member);
}
