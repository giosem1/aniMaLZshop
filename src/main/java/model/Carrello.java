package model;

import java.util.ArrayList;

public class Carrello {
		
		private ArrayList<InfoProdotto> prodotti;
		
	    public Carrello() {
	        prodotti = new ArrayList<InfoProdotto>();
	    }

	    public void aggiungiProdotto(ProdottoBean prodotto) {
	    	for(InfoProdotto info : prodotti) {
	    		if(info.getNome().equals(prodotto.getNome())) {
					info.incrementa();
					return;
				}
	    	}
			InfoProdotto info = new InfoProdotto(prodotto);
			prodotti.add(info);
	   }
	    public void rimuoviProdotto(ProdottoBean prodotto) {
	    	for(InfoProdotto prod : prodotti) {
	    		if(prod.getNome().equals(prodotto.getNome())) {
					prodotti.remove(prod);
					break;
				}
			}
	    }
	    
	    public void svuota() {
			prodotti.removeAll(prodotti);
		}
	    
	    public ArrayList<InfoProdotto> getArticoli() {
	        return prodotti;
	    }
	    
	    public double calcolaCosto() {
			double tot = 0;
			for(InfoProdotto prod : prodotti)
				tot += prod.getTotale();
			
			return tot;	
		}
	    
	    public int size() {
			return prodotti.size();
		}

	    public boolean isEmpty() {
	        return prodotti.isEmpty();
	    }
	    
	    public InfoProdotto getInfo(String nome, String animale, String genere) {
	        for (InfoProdotto info : prodotti) {
	            if (info.getNome().equals(nome) && info.getAnimale().equals(animale) && info.getGenere().equals(genere)) {
	                return info;
	            }
	        }
	        return null;
	    }

        public int calcolaQuantitaTotale() {
           int quantitaTot = 0;
           for (InfoProdotto prod : prodotti) {
                quantitaTot += prod.getQuantitaCarrello();
    }
            return quantitaTot;
}
}
