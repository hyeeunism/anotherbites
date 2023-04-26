package com.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.dao.UserDAO;
import com.web.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject UserDAO dao;

	@Override
	public void register(UserVO vo) throws Exception {
		dao.register(vo);
	}
	
	// 패스워드 체크
		@Override
		public int passChk(UserVO vo) throws Exception {
			int result = dao.passChk(vo);
			return result;
		}
		
		// 아이디 중복 체크
		@Override
		public int idChk(UserVO vo) throws Exception {
			int result = dao.idChk(vo);
			return result;
		}

}
