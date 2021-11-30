package jpa.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	public static EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("SWP490x_01_fx10208");
		return factory.createEntityManager();
	}
}