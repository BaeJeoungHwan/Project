package com.mentoring.ProjectC.model;

import java.sql.Date;

public class t3_Member {
    private int MemberNum; // 멤버번호
    private String MemberId; // 아이디
    private String MemberPasswd; // 비밀번호
    private String MemberEmail; // 이메일
    private String MemberName; // 이름
    private int ReNum; // 지역번호
    private char MemberGender; // 성별
    private String MemberPoint; // 포인트
    private char MemberSelect; // 선택(관리자, 멘토, 멘티)
    private String MemberPhone; // 핸드폰번호
    
    private String ReName;
    private String FindName;
    private Date OrderTime;
    private String MentorName;
    private String MenteeName;
    private int PointApp;
    private Date PointDate;
    
	public int getMemberNum() {
		return MemberNum;
	}
	public void setMemberNum(int memberNum) {
		MemberNum = memberNum;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public String getMemberPasswd() {
		return MemberPasswd;
	}
	public void setMemberPasswd(String memberPasswd) {
		MemberPasswd = memberPasswd;
	}
	public String getMemberEmail() {
		return MemberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}
	public int getReNum() {
		return ReNum;
	}
	public void setReNum(int reNum) {
		ReNum = reNum;
	}
	public char getMemberGender() {
		return MemberGender;
	}
	public void setMemberGender(char memberGender) {
		MemberGender = memberGender;
	}
	public String getMemberPoint() {
		return MemberPoint;
	}
	public void setMemberPoint(String memberPoint) {
		MemberPoint = memberPoint;
	}
	public char getMemberSelect() {
		return MemberSelect;
	}
	public void setMemberSelect(char memberSelect) {
		MemberSelect = memberSelect;
	}
	public String getMemberName() {
		return MemberName;
	}
	public void setMemberName(String memberName) {
		MemberName = memberName;
	}
	public String getMemberPhone() {
		return MemberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		MemberPhone = memberPhone;
	}    
}
