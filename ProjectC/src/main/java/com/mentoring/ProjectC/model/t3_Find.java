package com.mentoring.ProjectC.model;

import lombok.Data;

@Data 
public class t3_Find {
    private int FindNum; // 공고번호
    private int MemberNum;
    private String FindName; // 공고제목
    private String FindM; // 공고내용
    
	private String MemberId;
	private String MemberPassword;
	private String MemberEmail;
	private int ReNum;
	private String MemberGender;
	private int MemberPoint;
	private String MemberPhone;
	private String MemberSelect;
	private String ReName;
	
	private int JobNum;
	private String JobName;
}
