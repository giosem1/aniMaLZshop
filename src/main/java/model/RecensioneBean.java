package model;
import java.io.Serializable;

public class RecensioneBean implements Serializable{
	private static final long serialVersionUID = 1L;
    private int ID_utente;
    private int ID_prodotti;
    private double voto;
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
	
	public double getVoto() {
		return voto;
	}
	
	public void setVoto(double voto) {
		this.voto = voto;
	}
	
	public String getRecensione() {
		return recensione;
	}
	
	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}
    
   
}
