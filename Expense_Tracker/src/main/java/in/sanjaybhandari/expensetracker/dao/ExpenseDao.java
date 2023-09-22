package in.sanjaybhandari.expensetracker.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.sanjaybhandari.expensetracker.model.Expense;
import com.sanjaybhandari.expensetracker.model.User;
import com.sanjaybhandari.expensetracker.util.HibernateUtil;

//@SuppressWarnings("deprecation")
public class ExpenseDao {

	private boolean flag = false;
	private SessionFactory sessionFactory = null;
	private Session session = null;
	private Transaction transaction = null;

	public ExpenseDao(SessionFactory sessionFactory) {
		this.sessionFactory = HibernateUtil.getSessionFactory();
	}

	public boolean saveExpense(Expense expense) {

		session = sessionFactory.openSession();

		try {
			if (session != null)
				transaction = session.beginTransaction();
			if (transaction != null) {
				session.save(expense);
				flag = true;
			}
		} catch (HibernateException he) {
			he.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (flag)
				transaction.commit();
			else
				transaction.rollback();
			HibernateUtil.closeSession();
		}

		return flag;
	}

	public List getAllExpenseByUser(User user) {
		List<Expense> list = new ArrayList<Expense>();
		try {

			session = sessionFactory.openSession();
			Query query = session.createQuery("from Expense where user=:us");
			query.setParameter("us", user);
			list = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Expense getExpenseById(int id) {
		Expense expense = null;
		try {
			session = sessionFactory.openSession();
			String selectById = "from Expense where id=:id";
			Query query = session.createQuery(selectById);
			query.setParameter("id", id);
			expense = (Expense) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(expense);
		return expense;
	}
	
	public boolean updateExpense(Expense expense) {
		
		session=sessionFactory.openSession();
		
		try {
			if(session!=null) 
				transaction = session.beginTransaction();
			if(transaction != null) {
				session.saveOrUpdate(expense);
				flag=true;
			}
		} catch (HibernateException he) {
			he.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(flag)
				transaction.commit();
			else 
				transaction.rollback();
			HibernateUtil.closeSession();
		}
		
		return flag;
	}
	
	public boolean deleteExpense(int id) {
		session=sessionFactory.openSession();
		try {
			if(session!=null) 
				transaction = session.beginTransaction();
			if(transaction != null) {
				Expense expense = session.get(Expense.class,id);
				if(expense!=null) {
					session.delete(expense);
					flag=true;
				}
				
			}
		} catch (HibernateException he) {
			he.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(flag)
				transaction.commit();
			else 
				transaction.rollback();
			HibernateUtil.closeSession();
		}
		
		return flag;
	}

}
