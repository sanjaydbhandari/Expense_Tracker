package com.sanjaybhandari.expensetracker.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sanjaybhandari.expensetracker.model.User;
import com.sanjaybhandari.expensetracker.util.HibernateUtil;

import in.sanjaybhandari.expensetracker.dao.UserDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email=req.getParameter("email");
		String password=req.getParameter("password");
//		System.out.println(email);
//		System.out.println(password);
		UserDao UserDao = new UserDao(HibernateUtil.getSessionFactory());
		HttpSession session=req.getSession();
		User user=UserDao.login(email, password);
		
//		System.out.println(check);
		
		if (user != null) {
			session.setAttribute("msg", "Login Successfully!");
			session.setAttribute("loginUser", user);
			resp.sendRedirect("index.jsp");
//				System.out.println("Register Successfully!");
		} else {
			session.setAttribute("msg", "Invalid Credential!");
			resp.sendRedirect("login.jsp");
//				System.out.println("Register failed!");		
		}
		
	}

	

}
