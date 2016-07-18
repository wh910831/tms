/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.config.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.wh.common.RequestParams;
import com.wh.common.utils.Constant;
import com.wh.config.service.UserService;

/**
 * 描述：
 * 
 * <pre>
 * HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2016年7月12日      593722         Create
 * ****************************************************************************
 * </pre>
 * 
 * @author 593722
 * @since 2.4
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(String username, String password, HttpSession session) {
		if ((!StringUtils.isEmpty(username)) && (!StringUtils.isEmpty(password))) {
			RequestParams params = new RequestParams();
			params.setParams("username", username);
			params.setParams("password", password);

			if (userService.validateUserInfo(params)) {
				session.setAttribute("username", username);
				session.setAttribute("loginFlag", Constant.LOGIN_FLAG);
				return new ModelAndView(new RedirectView("/frame.do"));
			} else {
				session.setAttribute("msg", "用户名或密码错误");
			}
		}
		return new ModelAndView(new RedirectView("/index.do"));
	}

	@RequestMapping(value = "/frame.do")
	public String frame() {
		return "frame";
	}

	@RequestMapping(value = "/index.do")
	public String index(HttpServletRequest request) {
		request.getSession().setAttribute("loginFlag", Constant.LOGOUT_FLAG);
		return "redirect:/index.jsp";
	}
}
