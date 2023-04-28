package com.web.service;

import com.web.vo.UserVO;

public interface UserService {
	
	// 회원가입
	public void register(UserVO vo) throws Exception;
	
	// id중복 체크(회원가입)
	public int idChk(UserVO vo) throws Exception;

}
