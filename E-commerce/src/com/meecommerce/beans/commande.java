package com.meecommerce.beans;


public class commande {
	int commande_id;
	String distinateur;
	String distinataire;
	String date_creation;
	String date_livraison;
	int id_c;
	int id_produit;
	int Quantity;
	String size;
	String statut;
	public commande(int commande_id,String distinateur,String distinataire,String date_creation,String date_livraison,int id_c,int id_produit,int Quantity,String size){
    	this.commande_id = commande_id;
    	this.distinateur = distinateur;
    	this.distinataire = distinataire;
    	this.date_creation = date_creation;
    	this.date_livraison = date_livraison;
    	this.id_c = id_c;
    	this.id_produit = id_produit;
    	this.Quantity=Quantity;
    	this.size=size;
    }
	public commande(int commande_id,String distinateur,String distinataire,String date_creation,String date_livraison,int id_c,int id_produit,int Quantity,String size,String statut){
    	this.commande_id = commande_id;
    	this.distinateur = distinateur;
    	this.distinataire = distinataire;
    	this.date_creation = date_creation;
    	this.date_livraison = date_livraison;
    	this.id_c = id_c;
    	this.id_produit = id_produit;
    	this.Quantity=Quantity;
    	this.size=size;
    	this.statut=statut;
    }
    public commande(String distinateur,String distinataire,String date_creation,String date_livraison,int id_c,int id_produit,int Quantity,String size){
    	this.distinateur = distinateur;
    	this.distinataire = distinataire;
    	this.date_creation = date_creation;
    	this.date_livraison = date_livraison;
    	this.id_c = id_c;
    	this.id_produit = id_produit;
    	this.Quantity=Quantity;
    	this.size=size;
    }
    public commande(String distinateur,String distinataire,String date_creation,String date_livraison,int id_c,int id_produit,int Quantity,String size,String statut){
    	this.distinateur = distinateur;
    	this.distinataire = distinataire;
    	this.date_creation = date_creation;
    	this.date_livraison = date_livraison;
    	this.id_c = id_c;
    	this.id_produit = id_produit;
    	this.Quantity=Quantity;
    	this.size=size;
    	this.statut="commande envoyée";
    }
    public int getcommande_id() {
        return commande_id;
    }
    public void setcommande_id(int commande_id) {
        this.commande_id = commande_id;
    }
    public String getdistinateur() {
        return distinateur;
    }
    public void setdistinateur(String distinateur) {
        this.distinateur = distinateur;
    }
    public String getdistinataire() {
        return distinataire;
    }
    public void setdistinataire(String distinataire) {
        this.distinataire = distinataire;
    }
    public String getdate_creation() {
        return date_creation;
    }
    public void setdate_creation(String date_creation) {
        this.date_creation = date_creation;
    }
    public String getdate_livraison() {
        return date_livraison;
    }
    public void setdate_livraison(String date_livraison) {
        this.date_livraison = date_livraison;
    }
    public int getid_c() {
        return id_c;
    }
    public void setid_c(int id_c) {
        this.id_c = id_c;
    }
    public int getid_produit() {
        return id_produit;
    }
    public void setid_produit(int id_produit) {
        this.id_produit = id_produit;
    }
    public int getQuantity() {
        return Quantity;
    }
    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    public String getsize() {
        return size;
    }
    public void setsize(String size) {
        this.size = size;
    }
    public String getstatut() {
        return statut;
    }
    public void setstatut(String statut) {
        this.statut = statut;
    }
}
