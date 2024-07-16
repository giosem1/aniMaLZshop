package model;

import java.util.ArrayList;

public class Preferiti {
	
	private ArrayList<InfoProdotto> prodotti;
	
    public Preferiti() {
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
    public boolean isEmpty() {
        return prodotti.isEmpty();
    }
    
    public void svuota() {
		prodotti.removeAll(prodotti);
	}
    
    public ArrayList<InfoProdotto> getArticoli() {
        return prodotti;
    }
    
    public InfoProdotto getInfo(String nome, String animale, String genere) {
        for (InfoProdotto info : prodotti) {
            if (info.getNome().equals(nome) && info.getAnimale().equals(animale) && info.getGenere().equals(genere)) {
                return info;
            }
        }
        return null;
    }
}
	