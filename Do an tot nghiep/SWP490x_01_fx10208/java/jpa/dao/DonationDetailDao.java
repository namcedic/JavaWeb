package jpa.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import hibernate.model.Donationdetail;
import hibernate.model.User;
import jpa.utils.JpaUtils;

public class DonationDetailDao {
	public void insert(Donationdetail donaDetail) {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			en.persist(donaDetail);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public void update(Donationdetail donaDetail) {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			en.merge(donaDetail);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public void delete(int DoDetailId) throws Exception {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			Donationdetail donaDetail = en.find(Donationdetail.class, DoDetailId);
			if (donaDetail != null) {
				en.remove(donaDetail);
			} else {
				throw new Exception("Donationdetail can not found");
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

	public Donationdetail findById(String DoDetailId) {
		EntityManager en = JpaUtils.getEntityManager();
		Donationdetail donaDetail = en.find(Donationdetail.class, Integer.parseInt(DoDetailId));
		return donaDetail;
	}
	public List<Donationdetail> findByUserId(String iduser) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select d from Donationdetail d where iduser = :iduser";
		TypedQuery<Donationdetail> query = en.createQuery(jqpl, Donationdetail.class);
		query.setParameter("iduser", iduser);
		return query.getResultList();
	}

	public List<Donationdetail> findByUserIdAndIDDonation(int iduser, int iddonation, BigDecimal moneydonate) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select d from Donationdetail d where iduser = :iduser and moneydonate = :moneydonate and iddonation =:iddonation";
		TypedQuery<Donationdetail> query = en.createQuery(jqpl, Donationdetail.class);
		query.setParameter("iduser", iduser);
		query.setParameter("moneydonate", moneydonate);
		query.setParameter("iddonation", iddonation);
		return query.getResultList();
	}
	public List<Donationdetail> findAll() {
		EntityManager en = JpaUtils.getEntityManager();
		TypedQuery<Donationdetail> query = en.createNamedQuery("Donationdetail.findAll", Donationdetail.class);
		return query.getResultList();
	}

	public List<Donationdetail> findByKey(String searchkey) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select d from Donationdetail d where d.detail like :%searchkey%";
		TypedQuery<Donationdetail> query = en.createQuery(jqpl, Donationdetail.class);
		query.setParameter("detail", "%" + searchkey + "%");
		return query.getResultList();
	}
	
	public long getTotalMoney(int iddonation) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select sum (moneydonate) from Donationdetail where iddonation =:iddonation";
		Query query = en.createQuery(jqpl);
		query.setParameter("iddonation", iddonation);
		return  ((BigDecimal ) query.getSingleResult()).longValue();
	}

	public int count() {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select count (d) from Donationdetail d";
		Query query = en.createQuery(jqpl);
		return ((Long) query.getSingleResult()).intValue();
	}
	
	public int countDonate(int iddonation) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select count (d) from Donationdetail d where iddonation = :iddonation";
		Query query = en.createQuery(jqpl);
		query.setParameter("iddonation", iddonation);
		return ((Long) query.getSingleResult()).intValue();
	}

	public List<Donationdetail> findAll(int page, int pageSize) {
		EntityManager en = JpaUtils.getEntityManager();
		TypedQuery<Donationdetail> query = en.createNamedQuery("Donationdetail.findAll", Donationdetail.class);
		query.setFirstResult(page * pageSize);
		query.setMaxResults(page * pageSize);
		return query.getResultList();
	}

}