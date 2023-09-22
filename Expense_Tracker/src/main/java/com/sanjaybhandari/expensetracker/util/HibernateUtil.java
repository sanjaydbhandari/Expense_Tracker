package com.sanjaybhandari.expensetracker.util;

import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.sanjaybhandari.expensetracker.model.Expense;
import com.sanjaybhandari.expensetracker.model.User;

public class HibernateUtil {

	static SessionFactory sessionFactory;
	static Session session;


	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				Configuration configuration = new Configuration();

				// Hibernate settings equivalent to hibernate.cfg.xml's properties
				Properties settings = new Properties();

				settings.put(Environment.DRIVER,"com.mysql.cj.jdbc.Driver");
				settings.put(Environment.URL,"jdbc:mysql://localhost:3306/expense_tracker");
				settings.put(Environment.USER,"root");
				settings.put(Environment.PASS,"2001");
				settings.put(Environment.DIALECT,"org.hibernate.dialect.MySQL8Dialect");
				settings.put(Environment.HBM2DDL_AUTO,"update");
				settings.put(Environment.SHOW_SQL,true);

//				settings.put(Environment.USE_SECOND_LEVEL_CACHE,true);
//				settings.put(Environment.CACHE_REGION_FACTORY,
//						"org.hibernate.cache.ehche.internal.EhcacheRegionFactory");
				
				
				configuration.setProperties(settings);
				configuration.addAnnotatedClass(User.class);
				configuration.addAnnotatedClass(Expense.class);
				
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();

				sessionFactory = configuration.buildSessionFactory(serviceRegistry);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sessionFactory;
	}

//	public static Session getSession() {
//		if (sessionFactory != null)
//			session = sessionFactory.openSession();
//		return session;
//	}

	public static Session closeSession() {
		if (session != null) {
			session.close();
		}
		return session;
	}

	public static void closeSessionFactory() {
		if (sessionFactory != null) {
			sessionFactory.close();
		}
	}

}


//settings.setProperty("hibernate.connection.driver","com.mysql.cj.jdbc.Driver");
//settings.setProperty("hibernate.connection.url","jdbc:mysql://localhost:3306/expense_tracker");
//settings.setProperty("hibernate.connection.username","root");
//settings.setProperty("hibernate.connection.password","2001");
//settings.setProperty("hibernate.dialect","org.hibernate.dialect.MySQL8Dialect");
//settings.setProperty("hibernate.hbm2ddl","update");
//settings.setProperty("hibernate.show_sql","true");
//settings.setProperty("hibernate.format_sql","true");
