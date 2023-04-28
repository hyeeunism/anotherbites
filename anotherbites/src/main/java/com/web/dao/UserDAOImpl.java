package com.web.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject SqlSession sql;
	
	// 회원가입
	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert("userMapper.register", vo);
	}
	
			
	// 아이디 중복 체크
	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = sql.selectOne("userMapper.idChk", vo);
			return result;
		}
}