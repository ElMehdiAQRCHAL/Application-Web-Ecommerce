package com.meecommerce.beans;

public class Livreur {
	private int livreur_id;
    private String nom;
    private String prenom;
    private String email;
    private String mot_pass;
    public Livreur(int user_id,String nom,String prenom,String email,String mode_pass){
    	this.livreur_id = user_id;
    	this.nom = nom;
    	this.prenom = prenom;
    	this.email = email;
    	this.mot_pass = mode_pass;
    }
    public Livreur(String nom,String prenom,String email,String mode_pass){
    	this.nom = nom;
    	this.prenom = prenom;
    	this.email = email;
    	this.mot_pass = mode_pass;
    }
    public int getId() {
        return livreur_id;
    }
    public void setId(int id) {
        this.livreur_id = id;
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
    public String getPassword() {
        return mot_pass;
    }
    public void setPassword(String pass) {
        this.mot_pass = pass;
    }
}
