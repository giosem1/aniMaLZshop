package model;

import java.io.Serializable;
import java.sql.Date;

public class NewsBean implements Serializable{

	

	private static final long serialVersionUID = 1L;
	private int idNews;
	private String titolo;
	private String categoria;
	private Date dataPlub;
	private String animale;
	private String immagine;
	private String autore;
	private String contenuto;
	
	public NewsBean() {
		
	}

	public int getIdNews() {
		return idNews;
	}

	public void setIdNews(int idNews) {
		this.idNews = idNews;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Date getDataPlub() {
		return dataPlub;
	}

	public void setDataPlub(Date dataPlub) {
		this.dataPlub = dataPlub;
	}

	public String getAnimale() {
		return animale;
	}

	public void setAnimale(String animale) {
		this.animale = animale;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getAutore() {
		return autore;
	}

	public void setAutore(String autore) {
		this.autore = autore;
	}

	public String getContenuto() {
		return contenuto;
	}

	public void setContenuto(String contenuto) {
		this.contenuto = contenuto;
	}
	
}
