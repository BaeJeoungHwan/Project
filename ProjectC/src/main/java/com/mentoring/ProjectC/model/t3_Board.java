package com.mentoring.ProjectC.model;

import java.sql.Date;

public class t3_Board {
    private int BoardNum; // 게시판번호
    private int MemberNum; // 멤버번호
    private String BoardT; // 게시판제목
    private String BoardM; // 게시판내용
    private Date BoardDate; // 게시판작성날짜
    private int BoardCnt; // 조회수
    private int BoardCommmentcnt; //  
    private int commentCnt;
	private String MemberId; // 아이디
	private String MemberPassword; // 비밀번호
	private String MemberEmail; // 이메일
	private int ReNum; // 지역번호
	private String MemberGender; // 성별
	private int MemberPoint; // 포인트
	public int getBoardNum() {
		return BoardNum;
	}
	public void setBoardNum(int boardNum) {
		BoardNum = boardNum;
	}
	public int getMemberNum() {
		return MemberNum;
	}
	public void setMemberNum(int memberNum) {
		MemberNum = memberNum;
	}
	public String getBoardT() {
		return BoardT;
	}
	public void setBoardT(String boardT) {
		BoardT = boardT;
	}
	public String getBoardM() {
		return BoardM;
	}
	public void setBoardM(String boardM) {
		BoardM = boardM;
	}
	public Date getBoardDate() {
		return BoardDate;
	}
	public void setBoardDate(Date boardDate) {
		BoardDate = boardDate;
	}
	public int getBoardCnt() {
		return BoardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		BoardCnt = boardCnt;
	}
	public int getBoardCommmentcnt() {
		return BoardCommmentcnt;
	}
	public void setBoardCommmentcnt(int boardCommmentcnt) {
		BoardCommmentcnt = boardCommmentcnt;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public String getMemberPassword() {
		return MemberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		MemberPassword = memberPassword;
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
	public String getMemberGender() {
		return MemberGender;
	}
	public void setMemberGender(String memberGender) {
		MemberGender = memberGender;
	}
	public int getMemberPoint() {
		return MemberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		MemberPoint = memberPoint;
	}
	public String getMemberPhone() {
		return MemberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		MemberPhone = memberPhone;
	}
	public String getMemberSelect() {
		return MemberSelect;
	}
	public void setMemberSelect(String memberSelect) {
		MemberSelect = memberSelect;
	}
	private String MemberPhone; // 전화번호
	private String MemberSelect; // 선택(멘토, 멘티)
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
}
