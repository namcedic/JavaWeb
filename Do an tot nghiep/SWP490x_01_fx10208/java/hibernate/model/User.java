package hibernate.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.List;

/**
 * The persistent class for the [USER] database table.
 * 
 */
@Entity
@Table(name = "[USER]")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "IDUSER")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int iduser;

	@NotEmpty
	@Email(regexp = ".+@.+\\..+|")
	@Column(name = "EMAIL", unique = true)
	private String email;

	@NotEmpty
	@Column(name = "FULLNAME")
	private String fullname;

	@NotEmpty
	@Size(min = 8, max = 300)
	@Column(name = "PASSWORD")
	private String password;

	@Min(value = 0)
	@Column(name = "PHONENUMBER")
	private int phonenumber;

	@Column(name = "STATUS")
	private String status;

	@NotEmpty
	@Column(name = "USERNAME")
	private String username;

	@Min(0)
	@Max(1)
	@Column(name = "USERROLE")
	private int userrole;

	// bi-directional many-to-one association to Donationdetail
	@OneToMany(mappedBy = "user")
	private List<Donationdetail> donationdetails;

	public User() {
	}

	public int getIduser() {
		return this.iduser;
	}

	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(int phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getUserrole() {
		return this.userrole;
	}

	public void setUserrole(int userrole) {
		this.userrole = userrole;
	}

	public List<Donationdetail> getDonationdetails() {
		return this.donationdetails;
	}

	public void setDonationdetails(List<Donationdetail> donationdetails) {
		this.donationdetails = donationdetails;
	}

	public Donationdetail addDonationdetail(Donationdetail donationdetail) {
		getDonationdetails().add(donationdetail);
		donationdetail.setUser(this);

		return donationdetail;
	}

	public Donationdetail removeDonationdetail(Donationdetail donationdetail) {
		getDonationdetails().remove(donationdetail);
		donationdetail.setUser(null);
		return donationdetail;
	}
}