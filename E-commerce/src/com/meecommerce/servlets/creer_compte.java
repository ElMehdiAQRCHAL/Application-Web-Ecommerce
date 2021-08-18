package com.meecommerce.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meecommerce.beans.Client;
import com.meecommerce.beans.Clients;
import com.meecommerce.beans.Livreur;
import com.meecommerce.beans.Livreurs;
import com.meecommerce.beans.Marchand;
import com.meecommerce.beans.Marchands;

/**
 * Servlet implementation class creer_compte
 */
@WebServlet("/creer_compte")
public class creer_compte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public creer_compte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_user=0;
		String Nom =request.getParameter("Nom");
		String Prenom = request.getParameter("Prenom");
		String Email = request.getParameter("Email");
		String Password =request.getParameter("Password");
		String Compte = request.getParameter("Compte");
		String Adress=request.getParameter("Adress");
		String msg="";
		if(Nom!="" && Nom!=null && Prenom!="" && Prenom!=null && Email!="" && Email!=null && Password!="" && Password!=null && Adress!="" && Adress!=null && Compte!=null) {
			switch(Compte){
			case "Client":
				Client Client=new Client(Nom,Prenom,Email,Password);
				Clients Clients = new Clients();
				Clients.ajouterClient(Client);
				List<Client> tableClients = new ArrayList<Client>();
				tableClients=Clients.recupererClients();
				if(tableClients.size()>0) {
					id_user=(tableClients.get(tableClients.size()-1)).getId();
				}else {
					id_user=(tableClients.get(0)).getId();
				}
				request.setAttribute("Id_user",id_user);
				request.setAttribute("Nom",Nom);
				request.setAttribute("Prenom",Prenom);
				request.setAttribute("Password",Password);
				request.setAttribute("Email",Email);
				request.setAttribute("Compte",Compte);
				this.getServletContext().getRequestDispatcher("/WEB-INF/creation_confirmer.jsp").forward(request, response);
				break;
			case "Marchand":
				Marchand Marchand=new Marchand(Nom,Prenom,Email,Adress,Password);
				Marchands Marchands = new Marchands();
				Marchands.ajouterMarchand(Marchand);
				List<Marchand> tableMarchands = new ArrayList<Marchand>();
				tableMarchands=Marchands.recupererMarchands();
				if(tableMarchands.size()>0) {
					id_user=(tableMarchands.get(tableMarchands.size()-1)).getId();
				}else {
					id_user=(tableMarchands.get(0)).getId();
				}
				request.setAttribute("Id_user",id_user);
				request.setAttribute("Nom",Nom);
				request.setAttribute("Prenom",Prenom);
				request.setAttribute("Password",Password);
				request.setAttribute("Email",Email);
				request.setAttribute("Compte",Compte);
				this.getServletContext().getRequestDispatcher("/WEB-INF/creation_confirmer.jsp").forward(request, response);
				break;
			case "Livreur":
				Livreur Livreur=new Livreur(Nom,Prenom,Email,Password);
				Livreurs Livreurs = new Livreurs();
				Livreurs.ajouterLivreur(Livreur);
				List<Livreur> tableLivreurs = new ArrayList<Livreur>();
				tableLivreurs=Livreurs.recupererLivreurs();
				if(tableLivreurs.size()>0) {
					id_user=(tableLivreurs.get(tableLivreurs.size()-1)).getId();
				}else {
					id_user=(tableLivreurs.get(0)).getId();
				}
				request.setAttribute("Id_user",id_user);
				request.setAttribute("Nom",Nom);
				request.setAttribute("Prenom",Prenom);
				request.setAttribute("Password",Password);
				request.setAttribute("Email",Email);
				request.setAttribute("Compte",Compte);
				this.getServletContext().getRequestDispatcher("/WEB-INF/creation_confirmer.jsp").forward(request, response);
				break;
			}
		}else {
			msg="Remplir tous les champs !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/Inscription.jsp").forward(request, response);
		}
	}

}
