package com.meecommerce.beans;

public class Product {
	int produit_id;
	String name;
	String description;
	int id_M;
	float prix;
	String sible;
	String img;
	public Product(int produit_id,String name,String description,int id_M,float prix,String sible,String img){
    	this.produit_id=produit_id;
		this.name = name;
    	this.description = description;
    	this.id_M = id_M;
    	this.prix = prix;
    	this.sible = sible;
    	this.img = img;
    }
	public Product(String name,String description,int id_M,float prix,String sible,String img){
    	this.name = name;
    	this.description = description;
    	this.id_M = id_M;
    	this.prix = prix;
    	this.sible = sible;
    	this.img = img;
    }
	public int getproduit_id() {
        return produit_id;
    }
    public void setproduit_id(int produit_id) {
        this.produit_id =produit_id;
    }
    public String getname() {
        return name;
    }
    public void setname(String name) {
        this.name = name;
    }
    public String getdescription() {
        return description;
    }
    public void setdescription(String description) {
        this.description = description;
    }
    public int getid_M() {
        return id_M;
    }
    public void setid_M(int id_M) {
        this.id_M = id_M;
    }
    public float getprix() {
        return prix;
    }
    public void setprix(float prix) {
        this.prix = prix;
    }
    public String getsible() {
        return sible;
    }
    public void setsible(String sible) {
        this.sible = sible;
    }
    public String getimg() {
        return img;
    }
    public void setimg(String img) {
        this.img = img;
    }
}
