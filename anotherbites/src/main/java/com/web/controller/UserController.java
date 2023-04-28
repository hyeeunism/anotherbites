package com.web.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.UserService;
import com.web.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get register");
		}
		
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(UserVO vo) throws Exception {
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/user/register";
			} else if (result == 0) {
				service.register(vo);
			}
			// 존재 -> 다시 회원가입 페이지 / 존재 X -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
		

	}