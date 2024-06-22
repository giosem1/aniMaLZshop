package model;
import java.io.Serializable;

public class ProdottoBean implements Serializable {
    
	private static final long serialVersionUID = 1L;
	private int ID_prodotti;
	private String  nome;
	private double prezzo;
	private String genere;
	private String animale;
	private String taglia;
	private String Marca;
	private String Descrizione;
	private String immagine;
	private int quantita;
	
	public ProdottoBean() {
		
	}

	public int getID_prodotti() {
		return ID_prodotti;
	}

	public void setID_prodotti(int iD_prodotti) {
		ID_prodotti = iD_prodotti;
	}

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

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getAnimale() {
		return animale;
	}

	public void setAnimale(String animale) {
		this.animale = animale;
	}

	public String getTaglia() {
		return taglia;
	}

	public void setTaglia(String taglia) {
		this.taglia = taglia;
	}

	public String getMarca() {
		return Marca;
	}

	public void setMarca(String marca) {
		Marca = marca;
	}

	public String getDescrizione() {
		return Descrizione;
	}

	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}	
	
}