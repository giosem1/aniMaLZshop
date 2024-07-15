package model;

import java.util.ArrayList;

public class Carrello {
		
		private ArrayList<InfoCarrello> prodotti;
		
	    public Carrello() {
	        prodotti = new ArrayList<InfoCarrello>();
	    }

	    public void aggiungiProdotto(ProdottoBean prodotto) {
	    	for(InfoCarrello info : prodotti) {
	    		if(info.getNome().equals(prodotto.getNome())) {
					info.incrementa();
					return;
				}
	    	}
			InfoCarrello info = new InfoCarrello(prodotto);
			prodotti.add(info);
	   }
	    public void rimuoviProdotto(ProdottoBean prodotto) {
	    	for(InfoCarrello prod : prodotti) {
	    		if(prod.getNome().equals(prodotto.getNome())) {
					prodotti.remove(prod);
					break;
				}
			}
	    }
	    
	    public void svuota() {
			prodotti.removeAll(prodotti);
		}
	    
	    public ArrayList<InfoCarrello> getArticoli() {
	        return prodotti;
	    }
	    
	    public double calcolaCosto() {
			double tot = 0;
			for(InfoCarrello prod : prodotti)
				tot += prod.getTotale();
			
			return tot;	
		}
	    
	    public int size() {
			return prodotti.size();
		}

	    public boolean isEmpty() {
	        return prodotti.isEmpty();
	    }
	    
	    public InfoCarrello getInfo(String nome, String animale, String genere) {
	        for (InfoCarrello info : prodotti) {
	            if (info.getNome().equals(nome) && info.getAnimale().equals(animale) && info.getGenere().equals(genere)) {
	                return info;
	            }
	        }
	        return null;
	    }

        public int calcolaQuantitaTotale() {
           int quantitaTot = 0;
           for (InfoCarrello prod : prodotti) {
                quantitaTot += prod.getQuantitaCarrello();
    }
            return quantitaTot;
}
}
