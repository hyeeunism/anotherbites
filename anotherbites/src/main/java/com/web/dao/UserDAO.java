package com.web.dao;

import com.web.vo.UserVO;

public interface UserDAO {
	
	// 회원가입
	public void register(UserVO vo) throws Exception;
		
	// 아이디 중복체크
	public int idChk(UserVO vo) throws Exception;
	
}
