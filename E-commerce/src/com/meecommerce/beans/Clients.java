package com.meecommerce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class Clients {
    private Connection connexion;
    
    public List<Client> recupererClients() {
        List<Client> Clients = new ArrayList<Client>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM client;");

            // Récupération des données
            while (resultat.next()) {
            	int user_id = resultat.getInt("user_id");
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String email = resultat.getString("email");
                String pass = resultat.getString("mode_pass");
                Client Client = new Client(user_id,nom,prenom,email,pass);
                Clients.add(Client);
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
        
        return Clients;
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
    public Client chercherClient(String id) {
    	Client Client =new Client(0,"0","0","0","0");
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM client where user_id="+id+";");

            while (resultat.next()) {
            Client.setId(resultat.getInt("user_id"));
            Client.setNom(resultat.getString("nom"));
            Client.setPrenom(resultat.getString("prenom"));
            Client.setEmail(resultat.getString("email"));
            Client.setPassword(resultat.getString("mode_pass"));
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
        
        return Client;
    }
    public void editerClient(Client Client) {
    	Statement statement = null;
        ResultSet resultat = null;
        String q= String.valueOf(Client.getId());
        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            statement.executeUpdate("UPDATE client SET nom=\""+Client.getNom()+"\",prenom=\""+Client.getPrenom()+"\",email=\""+Client.getEmail()+"\",mode_pass=\""+Client.getPassword()+"\" where user_id="+q+";");
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
    
    public void SupprimerClient(String a) {
    	Statement statement = null;
    	ResultSet resultat = null;
        loadDatabase();
        try {
        	statement = connexion.createStatement();
        	statement.executeUpdate("delete from client where user_id="+a+";");
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
