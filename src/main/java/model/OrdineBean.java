package model;

import java.io.Serializable;

public class OrdineBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int idOrdine;
	private double importoTotale;
	private int idUtente;
	private String data;
	private int quantita;
	
	
	public OrdineBean() {

	}
	
	public int getIdOrdine() {
		return idOrdine;
	}
	
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	
	public double getImportoTotale() {
		return importoTotale;
	}
	
	public void setImportoTotale(double importoTotale) {
		this.importoTotale = importoTotale;
	}
	
	
	public String getData() {
		return data;
	}
	
	public void setData(String data) {
		this.data = data;
	}

	public int getIdUtente() {
		return idUtente;
	}
	
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public int getquantita() {
		return quantita;
	}
	
	public void setquantita(int quantita) {
		this.quantita = quantita;
	}
}
