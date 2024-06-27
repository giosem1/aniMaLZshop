package model;
import java.io.Serializable;
import java.sql.Date;
public class UtenteBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int id;
	private String password;
	private String email;
	private String nome;
	private String cognome;
	private Date dataNascita;
	private String via;
	private String numCivico;
	private int cap;
	private String tel;
	private long cartaCredito;
	private boolean isAmm;

	public UtenteBean() { 
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getNumCivico() {
		return numCivico;
	}

	public void setNumCivico(String numCivico) {
		this.numCivico = numCivico;
	}

	public int getCap() {
		return cap;
	}

	public void setCap(int cap) {
		this.cap = cap;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public long getCartaCredito() {
		return cartaCredito;
	}

	public void setCartaCredito(long cartaCredito) {
		this.cartaCredito = cartaCredito;
	}

	public boolean isAmm() {
		return isAmm;
	}

	public void setAmm(boolean isAmm) {
		this.isAmm = isAmm;
	}

	@Override
	public String toString() {
		return "UtenteBean [id=" + id + ", password=" + password + ", email=" + email + ", nome=" + nome + ", cognome="
				+ cognome + ", dataNascita=" + dataNascita + ", via=" + via + ", numCivico=" + numCivico + ", cap="
				+ cap + ", tel=" + tel + ", cartaCredito=" + cartaCredito + ", isAmm=" + isAmm + ", getId()=" + getId()
				+ ", getPassword()=" + getPassword() + ", getEmail()=" + getEmail() + ", getNome()=" + getNome()
				+ ", getCognome()=" + getCognome() + ", getDataNascita()=" + getDataNascita() + ", getVia()=" + getVia()
				+ ", getNumCivico()=" + getNumCivico() + ", getCap()=" + getCap() + ", getTel()=" + getTel()
				+ ", getCartaCredito()=" + getCartaCredito() + ", isAmm()=" + isAmm() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
