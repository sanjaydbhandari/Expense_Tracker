package com.sanjaybhandari.expensetracker.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.sanjaybhandari.expensetracker.model.User;
import com.sanjaybhandari.expensetracker.util.HibernateUtil;

import in.sanjaybhandari.expensetracker.dao.UserDao;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("full_name");
		String email = req.getParameter("email");
		Long mobile_no = Long.parseLong(req.getParameter("phone_no"));
		String password = req.getParameter("password");
		String cpassword = req.getParameter("cpassword");
		boolean check;

		User user = new User(fullname, email, mobile_no, password);
		UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
		check = userDao.saveUser(user);
		HttpSession session = req.getSession();
		if (check) {
			session.setAttribute("msg", "Register Successfully!");
			resp.sendRedirect("register.jsp");
//				System.out.println("Register Successfully!");
		} else {
			session.setAttribute("msg", "Some Thing Went Wrong On Server!");
			resp.sendRedirect("register.jsp");
//				System.out.println("Register failed!");		
		}

	}

}
