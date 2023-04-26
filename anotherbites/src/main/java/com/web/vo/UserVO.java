package com.web.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private String userId; 
	private String userPwd; 
	private String userName;
	private String userNickname; 
	private String userEmail; 
	private String userTel; 
	private String userAddr; 
	private Date userInsertdate;

}


