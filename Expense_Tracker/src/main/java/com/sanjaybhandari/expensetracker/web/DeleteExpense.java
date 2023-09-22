package com.sanjaybhandari.expensetracker.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sanjaybhandari.expensetracker.util.HibernateUtil;
import in.sanjaybhandari.expensetracker.dao.ExpenseDao;

@WebServlet("/deleteExpense")
public class DeleteExpense extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("sdfs");
		int id = Integer.parseInt(req.getParameter("id"));
		ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean check = expenseDao.deleteExpense(id);

		HttpSession session=req.getSession();
		
		if (check) {
			session.setAttribute("msg", "Expense Deleted Successfully!");
			resp.sendRedirect("viewExpense.jsp");
		} else {
			session.setAttribute("msg", "Failed to Delete Expense");
			resp.sendRedirect("viewExpense.jsp");
		}
	}

}
