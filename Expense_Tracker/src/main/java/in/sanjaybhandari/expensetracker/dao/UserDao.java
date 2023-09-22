package in.sanjaybhandari.expensetracker.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.sanjaybhandari.expensetracker.model.User;
import com.sanjaybhandari.expensetracker.util.HibernateUtil;

//import jakarta.persistence.Query;

public class UserDao {

	private Transaction transaction = null;
	private boolean flag = false;
	private SessionFactory sessionFactory = null;
	private Session session = null;

	public UserDao(SessionFactory sessionFactory) {
		this.sessionFactory = HibernateUtil.getSessionFactory();
	}

	@SuppressWarnings("deprecation")
	public boolean saveUser(User user) {

		try {
			session = sessionFactory.openSession();

			if (session != null)
				transaction = session.beginTransaction();

			if (transaction != null) {
				session.save(user);
				flag = true;
			}

		} catch (HibernateException he) {
			he.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (flag == true)
				transaction.commit();
			else
				transaction.rollback();
				HibernateUtil.closeSession();
		}
		return flag;
	}
	
//	@SuppressWarnings("deprecation")
	public User login(String email,String password) {
		User user=null;
		try {
			session = sessionFactory.openSession();

			if (session != null)
				transaction = session.beginTransaction();

			if (transaction != null) {
				Query selectQuery=session.createQuery("from User where email=:em and password=:pw").setParameter("em",email).setParameter("pw",password);
				user=(User)selectQuery.uniqueResult();
				System.out.println(user);
				if(user!=null) {
					flag=true;
				}
			}

		} catch (HibernateException he) {
			he.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (flag == true)
				transaction.commit();
			else
				transaction.rollback();
				HibernateUtil.closeSession();
		}
		return user;
	}

}
