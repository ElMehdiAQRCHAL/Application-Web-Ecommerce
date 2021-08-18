package com.meecommerce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Admins {
private Connection connexion;
    
    public List<Admin> recupererAdmins() {
        List<Admin> Admins = new ArrayList<Admin>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM admin;");

            // Récupération des données
            while (resultat.next()) {
            	int user_id = resultat.getInt("user_id");
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String email = resultat.getString("email");
                String pass = resultat.getString("mode_pass");
                Admin Admin = new Admin(user_id,nom,prenom,email,pass);
                Admins.add(Admin);
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
        
        return Admins;
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
    public void ajouterClient(Client Client) {
        loadDatabase();
        
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO client(nom, prenom,email,mode_pass) VALUES(?,?, ?,?);");
            preparedStatement.setString(1, Client.getNom());
            preparedStatement.setString(2, Client.getPrenom());
            preparedStatement.setString(3, Client.getEmail());
            preparedStatement.setString(4, Client.getPassword());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Admin chercherAdmin(String id) {
    	Admin Admin =new Admin(0,"0","0","0","0");
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM admin where user_id="+id+";");

            while (resultat.next()) {
            Admin.setId(resultat.getInt("user_id"));
            Admin.setNom(resultat.getString("nom"));
            Admin.setPrenom(resultat.getString("prenom"));
            Admin.setEmail(resultat.getString("email"));
            Admin.setPassword(resultat.getString("mode_pass"));
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
        
        return Admin;
    }
    public void editerAdmin(Admin Admin) {
    	Statement statement = null;
        ResultSet resultat = null;
        String q= String.valueOf(Admin.getId());
        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            statement.executeUpdate("UPDATE admin SET nom=\""+Admin.getNom()+"\",prenom=\""+Admin.getPrenom()+"\",email=\""+Admin.getEmail()+"\",mode_pass=\""+Admin.getPassword()+"\" where user_id="+q+";");
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
    
    public int nbM() {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM marchand;");

            while (resultat.next()) {
            	nb=resultat.getInt("Count(*)");
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
        
        return nb;
    }
    
    public int nbC() {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM client;");

            while (resultat.next()) {
            	nb=resultat.getInt("Count(*)");
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
        
        return nb;
    }
}
