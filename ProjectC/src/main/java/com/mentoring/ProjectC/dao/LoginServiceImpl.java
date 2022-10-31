package com.mentoring.ProjectC.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mentoring.ProjectC.mapper.LoginMapper;
import com.mentoring.ProjectC.model.t3_Member;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
    private LoginMapper loginMapper;

    public t3_Member login(t3_Member member) {
        return loginMapper.login(member);
    }
}
