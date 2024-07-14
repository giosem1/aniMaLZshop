package model;

public class InseritiBean {

	private static final long serialVersionUID = 1L;
	private int ID_prodotti;
	private int ID_ordine;
	private String nome;
	private double prezzo;
	private int quantita;
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public InseritiBean() {
	
	}

	public int getID_prodotti() {
		return ID_prodotti;
	}

	public void setID_prodotti(int iD_prodotti) {
		ID_prodotti = iD_prodotti;
	}

	public int getID_ordine() {
		return ID_ordine;
	}

	public void setID_ordine(int iD_ordine) {
		ID_ordine = iD_ordine;
	}

	
}
