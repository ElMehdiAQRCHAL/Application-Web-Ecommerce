package com.meecommerce.beans;

public class Admin {
	private int user_id;
    private String nom;
    private String prenom;
    private String email;
    private String mode_pass;
    public Admin(int user_id,String nom,String prenom,String email,String mode_pass){
    	this.user_id = user_id;
    	this.nom = nom;
    	this.prenom = prenom;
    	this.email = email;
    	this.mode_pass = mode_pass;
    }
    public Admin(String nom,String prenom,String email,String mode_pass){
    	this.nom = nom;
    	this.prenom = prenom;
    	this.email = email;
    	this.mode_pass = mode_pass;
    }
    public int getId() {
        return user_id;
    }
    public void setId(int id) {
        this.user_id = id;
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
        return mode_pass;
    }
    public void setPassword(String pass) {
        this.mode_pass = pass;
    }
}
