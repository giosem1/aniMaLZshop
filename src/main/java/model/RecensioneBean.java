package model;
import java.io.Serializable;
import java.sql.Date;

public class RecensioneBean implements Serializable{
	private static final long serialVersionUID = 1L;
    private int ID_utente;
    private int ID_prodotti;
    private int voto;
    private Date dataPubl;
    private String nome;
    private String cognome;
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

	private String recensione;
    
	public RecensioneBean() {
		
	}
    
	public int getID_utente() {
		return ID_utente;
	}
	
	public void setID_utente(int iD_utente) {
		ID_utente = iD_utente;
	}
	
	public int getID_prodotti() {
		return ID_prodotti;
	}
	
	public void setID_prodotti(int iD_prodotti) {
		ID_prodotti = iD_prodotti;
	}
	
	public int getVoto() {
		return voto;
	}
	
	public void setVoto(int voto) {
		this.voto = voto;
	}
	
	public String getRecensione() {
		return recensione;
	}
	
	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}

	public Date getDataPubl() {
		return dataPubl;
	}

	public void setDataPubl(Date dataPubl) {
		this.dataPubl = dataPubl;
	}
    
   
}
