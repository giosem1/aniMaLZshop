package model;

public class InfoCarrello {
	
	private ProdottoBean prodotto;
	private int quantitaCarrello;
	
	public InfoCarrello(ProdottoBean prodotto){
		this.prodotto = prodotto;
		quantitaCarrello = 1;
	}
	
	public ProdottoBean getProdotto() {
		return prodotto;
	}
	
	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getQuantitaCarrello() {
		return quantitaCarrello;
	}
	
	public void setQuantitaCarrello(int quantita) {
		this.quantitaCarrello = quantita;
	}
	
	public String getNome() {
		return prodotto.getNome();
	}
	
	public String getGenere() {
		return prodotto.getGenere();
	}
	public String getAnimale() {
		return prodotto.getAnimale();
	}
	
	public double getPrezzo()
	{
		return prodotto.getPrezzo();
	}
	public int getID() {
		return prodotto.getID_prodotti();
	}
	
	public double getTotale() {
		return quantitaCarrello * prodotto.getPrezzo();
	}
	
	public void incrementa() {
		if(quantitaCarrello < prodotto.getQuantita() )
			quantitaCarrello = quantitaCarrello + 1;
	}
	
	public void decrementa() {
		if( quantitaCarrello > 1)
			quantitaCarrello = quantitaCarrello - 1;
	}
	

}