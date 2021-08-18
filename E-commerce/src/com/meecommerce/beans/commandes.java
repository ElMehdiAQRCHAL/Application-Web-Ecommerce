package com.meecommerce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class commandes {
	private Connection connexion;
    
	public List<commande> recuperercommandes_C(String q) {
        List<commande> commandes = new ArrayList<commande>();
        Statement statement = null;
        ResultSet resultat = null;
        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM commande where Clientuser_id="+q+";");

            // Récupération des données
            while (resultat.next()) {
            	int commande_id=resultat.getInt("commande_id");
            	String distinateur=resultat.getString("distinateur");
            	String distinataire=resultat.getString("distinataire");
            	String date_creation=resultat.getString("date_creation");
            	String date_livraison=resultat.getString("date_livraison");
            	int id_c=resultat.getInt("Clientuser_id");
            	int id_produit=resultat.getInt("list_produitlist_pro_id");
            	int Quantity=resultat.getInt("Quantity");
            	String size=resultat.getString("size");
            	String statut=resultat.getString("statut");
                commande commande = new commande(commande_id,distinateur,distinataire,date_creation,date_livraison,id_c,id_produit,Quantity,size,statut);
                commandes.add(commande);
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
        
        return commandes;
    }
	
	public List<commande> recuperercommandes_M(String q, String a) {
        List<commande> commandes = new ArrayList<commande>();
        Statement statement = null;
        ResultSet resultat = null;
        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT * FROM commande,produit where commande.list_produitlist_pro_id=produit.produit_id and produit.id_M="+q+" and statut=\""+a+"\";");

            // Récupération des données
            while (resultat.next()) {
            	int commande_id=resultat.getInt("commande_id");
            	String distinateur=resultat.getString("distinateur");
            	String distinataire=resultat.getString("distinataire");
            	String date_creation=resultat.getString("date_creation");
            	String date_livraison=resultat.getString("date_livraison");
            	int id_c=resultat.getInt("Clientuser_id");
            	int id_produit=resultat.getInt("list_produitlist_pro_id");
            	int Quantity=resultat.getInt("Quantity");
            	String size=resultat.getString("size");
                commande commande = new commande(commande_id,distinateur,distinataire,date_creation,date_livraison,id_c,id_produit,Quantity,size);
                commandes.add(commande);
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
        
        return commandes;
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
    
    public commande cherchercommande(String q) {
    	Statement statement = null;
        ResultSet resultat = null;
        loadDatabase();
        commande commande = new commande(0,"0","0","0","0",0,0,0,"0");
        try {
        	statement = connexion.createStatement();
        	resultat = statement.executeQuery("select * from commande where commande_id="+q+";");
        	while (resultat.next()) {
        	commande.setcommande_id(resultat.getInt("commande_id"));
            commande.setdistinateur(resultat.getString("distinateur"));
        	commande.setdistinataire(resultat.getString("distinataire"));
        	commande.setdate_creation(resultat.getString("date_creation"));
        	commande.setdate_livraison(resultat.getString("date_livraison"));
        	commande.setid_c(resultat.getInt("Clientuser_id"));
        	commande.setid_produit(resultat.getInt("list_produitlist_pro_id"));
        	commande.setQuantity(resultat.getInt("Quantity"));
        	commande.setsize(resultat.getString("size"));
        	}
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commande;
    }
    
    public void ajoutercommande(commande commande) {
        loadDatabase();
        
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO commande(distinateur,distinataire,date_creation,date_livraison,Clientuser_id,list_produitlist_pro_id,Quantity,size,statut) VALUES(?,?,?,?,?,?,?,?,?);");
            preparedStatement.setString(1, commande.getdistinateur());
            preparedStatement.setString(2, commande.getdistinataire());
            preparedStatement.setString(3, commande.getdate_creation());
            preparedStatement.setString(4, commande.getdate_livraison());
            preparedStatement.setInt(5, commande.getid_c());
            preparedStatement.setInt(6, commande.getid_produit());
            preparedStatement.setInt(7, commande.getQuantity());
            preparedStatement.setString(8, commande.getsize());
            preparedStatement.setString(9, commande.getstatut());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public int nb_CommandeM(String id_m) {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM produit,commande where produit.produit_id=commande.list_produitlist_pro_id and produit.id_M="+id_m+"  group by produit.id_M="+id_m+" ;");

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
    
    public int nb_C(String id_c) {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM commande where Clientuser_id="+id_c+" ;");

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
    
    public int nb_Commande() {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM commande; ");

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
    
    public int nb_CommandelivreM(String id_m) {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;
        String statut="livrée";
        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM produit,commande where commande.statut=\""+statut+"\" and produit.produit_id=commande.list_produitlist_pro_id and produit.id_M="+id_m+" group by produit.id_M="+id_m+" ;");

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
    
    public int nb_Commandelivre() {
    	int nb=0;
    	Statement statement = null;
        ResultSet resultat = null;
        String statut="livrée";
        loadDatabase(); 
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT Count(*) FROM commande where statut=\""+statut+"\";");

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
    
    public float gainsCommandelivreM(String id_m) {
    	float nb=0;
    	Statement statement = null;
        ResultSet resultat = null;
        String statut="livrée";
        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT prix*Quantity FROM produit,commande where commande.statut=\""+statut+"\" and produit.id_M="+id_m+" and produit.produit_id=commande.list_produitlist_pro_id;");

            while (resultat.next()) {
            	nb+=resultat.getInt("prix*Quantity");
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
    
    public float gainsCommandelivre() {
    	float nb=0;
    	Statement statement = null;
        ResultSet resultat = null;
        String statut="livrée";
        loadDatabase();
        
        try {
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT prix*Quantity FROM produit,commande where commande.statut=\""+statut+"\" and produit.produit_id=commande.list_produitlist_pro_id;");

            while (resultat.next()) {
            	nb+=resultat.getInt("prix*Quantity");
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
    public void confirmerCommande(String a,String b,String c) {
    	Statement statement = null;
    	ResultSet resultat = null;
        loadDatabase();
        try {
        	statement = connexion.createStatement();
        	statement.executeUpdate("update commande set date_livraison=\""+b+"\", statut=\""+c+"\"  where commande_id="+a+";");
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
    
    public void livrerCommande(String a,String c) {
    	Statement statement = null;
    	ResultSet resultat = null;
        loadDatabase();
        try {
        	statement = connexion.createStatement();
        	statement.executeUpdate("update commande set statut=\""+c+"\"  where commande_id="+a+";");
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
    
    public void AnnulerCommande(String a) {
    	Statement statement = null;
    	ResultSet resultat = null;
        loadDatabase();
        try {
        	statement = connexion.createStatement();
        	statement.executeUpdate("update commande set statut=\"Annuler\" where commande_id="+a+";");
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
