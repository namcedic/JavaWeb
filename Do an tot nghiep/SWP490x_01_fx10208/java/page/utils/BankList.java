package page.utils;
import java.math.BigDecimal;

public class BankList {
	private int stt;
	private int iduser;
	private int iddonation;
	private BigDecimal moneydonate;
	private String status;
	
	public BankList() {
		super();
	}

	public BankList(int stt, int iduser, int iddonation, BigDecimal moneydonate, String status) {
		super();
		this.stt = stt;
		this.iduser = iduser;
		this.iddonation = iddonation;
		this.moneydonate = moneydonate;
		this.status = status;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public int getIduser() {
		return iduser;
	}

	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public int getIddonation() {
		return iddonation;
	}

	public void setIddonation(int iddonation) {
		this.iddonation = iddonation;
	}

	public BigDecimal getMoneydonate() {
		return moneydonate;
	}

	public void setMoneydonate(BigDecimal moneydonate) {
		this.moneydonate = moneydonate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}