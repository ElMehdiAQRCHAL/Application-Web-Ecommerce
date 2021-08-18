package com.meecommerce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Products {
private Connection connexion;
    
public List<Product> recupererProducts() {
    List<Product> Products = new ArrayList<Product>();
    Statement statement = null;
    ResultSet resultat = null;

    loadDatabase();
    
    try {
        statement = connexion.createStatement();

        // Exécution de la requête
        resultat = statement.executeQuery("SELECT * FROM produit;");

        // Récupération des données
        while (resultat.next()) {
        	int produit_id = resultat.getInt("produit_id");
            String name = resultat.getString("name");
            String description = resultat.getString("description");
            int id_M = resultat.getInt("id_M");
            float prix = resultat.getFloat("prix");
            String sible = resultat.getString("sible");
            String img = resultat.getString("img");
            Product Product = new Product(produit_id,name,description,id_M,prix,sible,img);
            Products.add(Product);
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
    
    return Products;
}

    public List<Product> recupererProducts(String q) {
        List<Product> Products = new ArrayList<Product>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM produit where sible=\""+q+"\";");

            // Récupération des données
            while (resultat.next()) {
            	int produit_id = resultat.getInt("produit_id");
                String name = resultat.getString("name");
                String description = resultat.getString("description");
                int id_M = resultat.getInt("id_M");
                float prix = resultat.getFloat("prix");
                String sible = resultat.getString("sible");
                String img = resultat.getString("img");
                Product Product = new Product(produit_id,name,description,id_M,prix,sible,img);
                Products.add(Product);
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
        
        return Products;
    }
    
    public List<Product> recupererProductsM(String q) {
        List<Product> Products = new ArrayList<Product>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM produit where id_M="+q+";");

            // Récupération des données
            while (resultat.next()) {
            	int produit_id = resultat.getInt("produit_id");
                String name = resultat.getString("name");
                String description = resultat.getString("description");
                int id_M = resultat.getInt("id_M");
                float prix = resultat.getFloat("prix");
                String sible = resultat.getString("sible");
                String img = resultat.getString("img");
                Product Product = new Product(produit_id,name,description,id_M,prix,sible,img);
                Products.add(Product);
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
        
        return Products;
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
    
    public void ajouterProduct(Product Product) {
        loadDatabase();
        
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO produit(name,description,id_M,prix,sible,img) VALUES(?,?, ?,?, ?,?);");
            preparedStatement.setString(1, Product.getname());
            preparedStatement.setString(2, Product.getdescription());
            preparedStatement.setInt(3, Product.getid_M());
            preparedStatement.setFloat(4, Product.getprix());
            preparedStatement.setString(5, Product.getsible());
            preparedStatement.setString(6, Product.getimg());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
    public Product chercherProduct(String id) {
    	Product Product =new Product(12,"12","12",12,12,"12","12");
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM produit where produit_id="+id+";");

            while (resultat.next()) {
            Product.setproduit_id(resultat.getInt("produit_id"));
            Product.setname(resultat.getString("name"));
            Product.setdescription(resultat.getString("description"));
            Product.setid_M(resultat.getInt("id_M"));
            Product.setprix(resultat.getFloat("prix"));
            Product.setsible(resultat.getString("sible"));
            Product.setimg(resultat.getString("img"));
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
        
        return Product;
    }
    
    public int nb_ProductM(String id_m) {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM produit where id_M="+id_m+";");

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
    
    public int nb_Product() {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM produit;");

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
    
    public void SupprimerProduit(String a) {
    	Statement statement = null;
    	ResultSet resultat = null;
        loadDatabase();
        try {
        	statement = connexion.createStatement();
        	statement.executeUpdate("delete from produit where produit_id="+a+";");
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
