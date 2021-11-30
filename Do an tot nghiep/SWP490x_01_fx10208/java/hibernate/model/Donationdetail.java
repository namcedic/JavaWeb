package hibernate.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import java.math.BigDecimal;


/**
 * The persistent class for the DONATIONDETAIL database table.
 * 
 */
@Entity
@Table(name="DONATIONDETAIL")
@NamedQuery(name="Donationdetail.findAll", query="SELECT d FROM Donationdetail d")
public class Donationdetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@NotNull
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="IDDETAIL")
	private int iddetail;
	
	
	@NotNull
	@Min(value = 0 , message = "Số tiền phả lớn hơn 0") 
	@Column(name="MONEYDONATE")
	private BigDecimal moneydonate;
	
	@Column(name = "STATUS")
	private String status;

	//bi-directional many-to-one association to Donationprogram
	@NotNull
	@ManyToOne
	@JoinColumn(name="IDDONATION")
	private Donationprogram donationprogram;

	//bi-directional many-to-one association to User
	@NotNull
	@ManyToOne
	@JoinColumn(name="IDUSER")
	private User user;

	public Donationdetail() {
	}

	public int getIddetail() {
		return this.iddetail;
	}

	public void setIddetail(int iddetail) {
		this.iddetail = iddetail;
	}

	public BigDecimal getMoneydonate() {
		return this.moneydonate;
	}

	public void setMoneydonate(BigDecimal moneydonate) {
		this.moneydonate = moneydonate;
	}
	
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Donationprogram getDonationprogram() {
		return this.donationprogram;
	}

	public void setDonationprogram(Donationprogram donationprogram) {
		this.donationprogram = donationprogram;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}