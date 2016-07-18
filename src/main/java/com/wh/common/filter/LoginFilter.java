/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wh.common.utils.Constant;

/**
 * 描述：
 * 
 * <pre>
 * HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2016年7月13日      593722         Create
 * ****************************************************************************
 * </pre>
 * 
 * @author 593722
 * @since 2.4
 */
public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException,
			ServletException {
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();

		// 获得用户请求的URI
		String path = request.getRequestURI();

		String flag = (String) session.getAttribute("loginFlag");

		if (path.indexOf("/index") > -1 || path.indexOf("/login.do") > -1) {
			chain.doFilter(req, resp);
			return;
		}

		if (Constant.LOGIN_FLAG.equals(flag)) {
			chain.doFilter(req, resp);
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}

	@Override
	public void destroy() {
	}

}
