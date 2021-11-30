package jpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import hibernate.model.Donationprogram;
import jpa.utils.JpaUtils;

public class DonationDao {
	public void insert(Donationprogram donaPro) {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			en.persist(donaPro);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public void update(Donationprogram donaPro) {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			en.merge(donaPro);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			en.close();
		}
	}

	public void delete(int DoProgramId) throws Exception {
		EntityManager en = JpaUtils.getEntityManager();
		EntityTransaction trans = en.getTransaction();
		try {
			trans.begin();
			Donationprogram donaPro = en.find(Donationprogram.class, DoProgramId);
			if (donaPro != null) {
				en.remove(donaPro);
			} else {
				throw new Exception("Donationprogram can not found");
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

	public Donationprogram findById(String DoProgramId) {
		EntityManager en = JpaUtils.getEntityManager();
		Donationprogram donaPro = en.find(Donationprogram.class, Integer.parseInt(DoProgramId));
		return donaPro;
	}

	public List<Donationprogram> findAll() {
		EntityManager en = JpaUtils.getEntityManager();
		TypedQuery<Donationprogram> query = en.createNamedQuery("Donationprogram.findAll", Donationprogram.class);
		return query.getResultList();
	}

	public List<Donationprogram> findByKey(String searchkey) {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select d from Donationprogram d where d.title like :searchkey or d.description like :searchkey or d.detail like :searchkey";
		TypedQuery<Donationprogram> query = en.createQuery(jqpl, Donationprogram.class);
		query.setParameter("searchkey", "%" + searchkey + "%");
		return query.getResultList().size() > 0 ?query.getResultList() : null;
	}

	public int count() {
		EntityManager en = JpaUtils.getEntityManager();
		String jqpl = "select count (u) from Donationprogram u";
		Query query = en.createQuery(jqpl);
		return ((Long) query.getSingleResult()).intValue();
	}

	public List<Donationprogram> findAll(int page, int pageSize) {
		EntityManager en = JpaUtils.getEntityManager();
		TypedQuery<Donationprogram> query = en.createNamedQuery("Donationprogram.findAll", Donationprogram.class);
		query.setFirstResult(page * pageSize);
		query.setMaxResults(page * pageSize);
		return query.getResultList();
	}

}