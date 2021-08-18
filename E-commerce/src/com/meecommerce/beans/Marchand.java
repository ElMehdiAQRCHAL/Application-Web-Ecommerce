package com.meecommerce.beans;

public class Marchand {
	private int marchand_id;
    private String nom;
    private String prenom;
    private String email;
    private String adress;
    private String mot_pass;
    public Marchand(int user_id,String nom,String prenom,String email,String adress,String mode_pass){
    	this.marchand_id = user_id;
    	this.nom = nom;
    	this.prenom = prenom;
    	this.email = email;
    	this.adress = adress;
    	this.mot_pass = mode_pass;
    }
    public Marchand(String nom,String prenom,String email,String adress,String mode_pass){
    	this.nom = nom;
    	this.prenom = prenom;
    	this.email = email;
    	this.adress = adress;
    	this.mot_pass = mode_pass;
    }
    public int getId() {
        return marchand_id;
    }
    public void setId(int id) {
        this.marchand_id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAdress() {
        return adress;
    }
    public void setAdress(String adress) {
        this.adress = adress;
    }
    public String getPassword() {
        return mot_pass;
    }
    public void setPassword(String pass) {
        this.mot_pass = pass;
    }
}
