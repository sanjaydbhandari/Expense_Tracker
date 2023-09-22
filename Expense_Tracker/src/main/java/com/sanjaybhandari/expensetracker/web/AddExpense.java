package com.sanjaybhandari.expensetracker.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sanjaybhandari.expensetracker.model.Expense;
import com.sanjaybhandari.expensetracker.model.User;
import com.sanjaybhandari.expensetracker.util.HibernateUtil;

import in.sanjaybhandari.expensetracker.dao.ExpenseDao;

@WebServlet("/addExpense")
public class AddExpense extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title=req.getParameter("title");
		String time=req.getParameter("time");
		String date=req.getParameter("date");
		String description=req.getParameter("description");
		String price=req.getParameter("price");
		
//		System.out.println(title+time+date);
		
		HttpSession session=req.getSession();
		User user=(User) session.getAttribute("loginUser");
//		System.out.println(user);
		Expense expense=new Expense(title,date,time,description,price,user);
		
//		System.out.println(expense);
		
		ExpenseDao expenseDao=new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean check = expenseDao.saveExpense(expense);
		
		if(check) {
			session.setAttribute("msg","Expense Added Successfully!");
			resp.sendRedirect("addExpense.jsp");
		}else {
			session.setAttribute("msg","Failed to Add Expense");
			resp.sendRedirect("addExpense.jsp");
		}
	}
	
}
