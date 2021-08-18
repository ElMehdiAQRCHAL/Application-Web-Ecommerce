package com.meecommerce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class Marchands {
	private Connection connexion;
    
    public List<Marchand> recupererMarchands() {
        List<Marchand> Marchands = new ArrayList<Marchand>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM marchand;");

            // Récupération des données
            while (resultat.next()) {
            	int marchand_id = resultat.getInt("marchand_id");
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String email = resultat.getString("email");
                String adress = resultat.getString("adress");
                String mot_pass = resultat.getString("mot_pass");
                Marchand Marchand = new Marchand(marchand_id,nom,prenom,email,adress,mot_pass);
                Marchands.add(Marchand);
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
        
        return Marchands;
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
    
    public void ajouterMarchand(Marchand Marchand) {
        loadDatabase();
        
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO marchand(nom, prenom,email,adress,mot_pass) VALUES(?,?,?,?,?);");
            preparedStatement.setString(1, Marchand.getNom());
            preparedStatement.setString(2, Marchand.getPrenom());
            preparedStatement.setString(3, Marchand.getEmail());
            preparedStatement.setString(4, Marchand.getAdress());
            preparedStatement.setString(5, Marchand.getPassword());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Marchand chercherMarchand(String id) {
    	Marchand Marchand =new Marchand(0,"0","0","0","0","0");
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM marchand where marchand_id="+id+";");

            while (resultat.next()) {
            Marchand.setId(resultat.getInt("marchand_id"));
            Marchand.setNom(resultat.getString("nom"));
            Marchand.setPrenom(resultat.getString("prenom"));
            Marchand.setEmail(resultat.getString("email"));
            Marchand.setAdress(resultat.getString("adress"));
            Marchand.setPassword(resultat.getString("mot_pass"));
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
        
        return Marchand;
    }
    
    public void editerMarchand(Marchand Marchand) {
    	Statement statement = null;
        ResultSet resultat = null;
        String q= String.valueOf(Marchand.getId());
        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            statement.executeUpdate("UPDATE marchand SET nom=\""+Marchand.getNom()+"\",prenom=\""+Marchand.getPrenom()+"\",adress=\""+Marchand.getAdress()+"\",email=\""+Marchand.getEmail()+"\",mot_pass=\""+Marchand.getPassword()+"\" where marchand_id="+q+";");
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
    }
    
    public void SupprimerMarchand(String a) {
    	Statement statement = null;
    	ResultSet resultat = null;
        loadDatabase();
        try {
        	statement = connexion.createStatement();
        	statement.executeUpdate("delete from marchand where marchand_id="+a+";");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
        	
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
    }
}
