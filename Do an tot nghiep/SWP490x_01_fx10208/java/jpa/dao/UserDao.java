package jpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import hibernate.model.User;
import jpa.utils.JpaUtils;

public class UserDao {
	public void insert(User user) {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			en.persist(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public void update(User user) {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			en.merge(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public void delete(int userId) throws Exception {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			User user = en.find(User.class, userId);
			if (user != null) {
				if (user.getUserrole()==1) {
					//trans.rollback();
					throw new Exception("Can not delete Admin");
				} else {
					en.remove(user);
				}
			} else {
				throw new Exception("User can not found");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public User findById(String userId) {
		EntityManager en = JpaUtils.getEntityManager();

		User user = en.find(User.class, Integer.parseInt(userId));
		return user;
	}

	public List<User> findAll() {
		EntityManager en = JpaUtils.getEntityManager();
		TypedQuery<User> query = en.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

	public List<User> findByFullName(String fullName) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select u from User u where u.fullName like : fullName";
		TypedQuery<User> query = en.createQuery(jqpl, User.class);
		query.setParameter("fullName", "%" + fullName + "%");
		return query.getResultList();
	}
	public User findByEmail(String email) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select u from User u where u.email =:email";
		try {
			TypedQuery<User> query = en.createQuery(jqpl, User.class);
			query.setParameter("email", email);
			return query.getResultList().size() > 0 ? query.getResultList().get(0) : null;
		} 
		 catch (Exception e) {
			 e.printStackTrace(); 
			 throw e;
		}
		finally {
			en.close();
		}
	}

	public int count() {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select count (u) from User u";
		Query query = en.createQuery(jqpl);
		return ((Long) query.getSingleResult()).intValue();
	}

	public List<User> findAll(int page, int pageSize) {
		EntityManager en = JpaUtils.getEntityManager();
		TypedQuery<User> query = en.createNamedQuery("User.findAll", User.class);
		query.setFirstResult(page * pageSize);
		query.setMaxResults(page * pageSize);
		return query.getResultList();
	}

	public User checkLogin(String username, String password, String status) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select u from User u where u.username = :username and u.password = :password and u.status = :status";
		TypedQuery<User> query = en.createQuery(jqpl, User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		query.setParameter("status", status);
		return query.getResultList().size() > 0 ? query.getSingleResult() : null;
	}
	
	public User checkUpdateAdmin(String username, String password, int userrole) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select u from User u where u.username = :username and u.password = :password and u.userrole=:userrole";
		TypedQuery<User> query = en.createQuery(jqpl, User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		query.setParameter("userrole", userrole);
		return query.getResultList().size() > 0 ? query.getSingleResult() : null;
	}
	
	public User checkUpdateUser(String username, String password) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select u from User u where u.username = :username and u.password = :password";
		TypedQuery<User> query = en.createQuery(jqpl, User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		return query.getResultList().size() > 0 ? query.getSingleResult() : null;
	}
	
	public User active(String email, String password, String status) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select u from User u where u.email = :email and u.password = :password and u.status = :status";
		TypedQuery<User> query = en.createQuery(jqpl, User.class);
		query.setParameter("email", email);
		query.setParameter("password", password);
		query.setParameter("status", status);
		return query.getResultList().size() > 0 ? query.getSingleResult() : null;
	}

}