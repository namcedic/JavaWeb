package hibernate.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

import java.util.List;


/**
 * The persistent class for the DONATIONPROGRAM database table.
 * 
 */
@Entity
@Table(name="DONATIONPROGRAM")
@NamedQuery(name="Donationprogram.findAll", query="SELECT d FROM Donationprogram d")
public class Donationprogram implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@NotNull
	@Column(name="IDDONATION")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int iddonation;

	@Column(name="CREATEDATE")
	private String createdate;

	@Column(name="DESCRIPTION")
	private String description;

	@Column(name="DETAIL")
	private String detail;

	@Column(name="FINISHDATE")
	private String finishdate;

	@Column(name="IMAGE")
	private String image;

	@Column(name="STATUS")
	private String status;

	@Column(name="TITLE")
	private String title;

	//bi-directional many-to-one association to Donationdetail
	@OneToMany(mappedBy="donationprogram")
	private List<Donationdetail> donationdetails;

	public Donationprogram() {
	}

	public int getIddonation() {
		return this.iddonation;
	}

	public void setIddonation(int iddonation) {
		this.iddonation = iddonation;
	}

	public String getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFinishdate() {
		return this.finishdate;
	}

	public void setFinishdate(String finishdate) {
		this.finishdate = finishdate;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Donationdetail> getDonationdetails() {
		return this.donationdetails;
	}

	public void setDonationdetails(List<Donationdetail> donationdetails) {
		this.donationdetails = donationdetails;
	}

	public Donationdetail addDonationdetail(Donationdetail donationdetail) {
		getDonationdetails().add(donationdetail);
		donationdetail.setDonationprogram(this);
		return donationdetail;
	}

	public Donationdetail removeDonationdetail(Donationdetail donationdetail) {
		getDonationdetails().remove(donationdetail);
		donationdetail.setDonationprogram(null);
		return donationdetail;
	}
}