package com.meecommerce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class Livreurs {
    private Connection connexion;
    
    public List<Livreur> recupererLivreurs() {
        List<Livreur> Livreurs = new ArrayList<Livreur>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM livreur;");

            // Récupération des données
            while (resultat.next()) {
            	int livreur_id = resultat.getInt("livreur_id");
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String email = resultat.getString("email");
                String pass = resultat.getString("mot_pass");
                Livreur Livreur = new Livreur(livreur_id,nom,prenom,email,pass);
                Livreurs.add(Livreur);
            }
        } catch (SQLException e) {
        } finally {
        	
            try {
                if (resultat != null)
                    resultat.close();
                if (statement != null)
                    statement.close();
                if (connexion != null)
                    connexion.close();
            } catch (SQLException ignore) {
            }
        }
        
        return Livreurs;
    }
    
    private void loadDatabase() {
        // Chargement du driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "AQWzsx123@");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void ajouterLivreur(Livreur Livreur) {
        loadDatabase();
        
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO livreur(nom, prenom,email,mot_pass) VALUES(?,?, ?,?);");
            preparedStatement.setString(1, Livreur.getNom());
            preparedStatement.setString(2, Livreur.getPrenom());
            preparedStatement.setString(3, Livreur.getEmail());
            preparedStatement.setString(4, Livreur.getPassword());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

