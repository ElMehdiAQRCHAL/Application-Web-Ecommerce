package com.meecommerce.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meecommerce.beans.Admin;
import com.meecommerce.beans.Admins;
import com.meecommerce.beans.Client;
import com.meecommerce.beans.Clients;
import com.meecommerce.beans.Livreur;
import com.meecommerce.beans.Livreurs;
import com.meecommerce.beans.Marchand;
import com.meecommerce.beans.Marchands;
import com.meecommerce.beans.Product;

/**
 * Servlet implementation class verifier_compte
 */
@WebServlet("/verifier_compte")
public class verifier_compte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifier_compte() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		if(request.getParameter("id")!="") {	id=Integer.parseInt(request.getParameter("id")); }
		String Password =request.getParameter("Password");
		String Compte = "null";
		String msg="";
		String nom="";
		String prenom="";
		int id_c;
		int id_m;
		int id_a;
		HttpSession session = request.getSession();
		if(request.getParameter("id")!="" && Password!="" && Password!=null) {
			Clients Clients=new Clients();
			List<Client> tableClients = new ArrayList<Client>();
			tableClients=Clients.recupererClients();
			for(int i=0; i<tableClients.size();i++) {
				if( ((tableClients.get(i)).getId())==id   &&   ((tableClients.get(i)).getPassword()).equals(Password) ) {
					nom = (tableClients.get(i)).getNom();
			        prenom = (tableClients.get(i)).getPrenom();
			        id_c = (tableClients.get(i)).getId();
			        Compte="Client";
			        List<Product> ProductsCard = new ArrayList<Product>();
			        List<String> Quantity = new ArrayList<String>();
			        List<String> size = new ArrayList<String>();
			        session.setAttribute("nom", nom);
			        session.setAttribute("prenom", prenom);
			        session.setAttribute("id_c", id_c);
			        session.setAttribute("ProductsCard", ProductsCard);
			        session.setAttribute("Quantity", Quantity);
			        session.setAttribute("size", size);
			        this.getServletContext().getRequestDispatcher("/Index.jsp").forward(request, response);
				}
			}
			Marchands Marchands=new Marchands();
			List<Marchand> tableMarchands = new ArrayList<Marchand>();
			tableMarchands=Marchands.recupererMarchands();
			for(int J=0; J<tableMarchands.size();J++) {
				if( ((tableMarchands.get(J)).getId())==id   &&   ((tableMarchands.get(J)).getPassword()).equals(Password) ) {
					id_m = (tableMarchands.get(J)).getId();
					Compte="Marchand";
			        session.setAttribute("id_m", id_m);
			        this.getServletContext().getRequestDispatcher("/EspaceMarchand.jsp").forward(request, response);
				}
			}
			Admins Admins=new Admins();
			List<Admin> tableAdmins = new ArrayList<Admin>();
			tableAdmins=Admins.recupererAdmins();
			for(int U=0; U<tableAdmins.size();U++) {
				if( ((tableAdmins.get(U)).getId())==id   &&   ((tableAdmins.get(U)).getPassword()).equals(Password) ) {
					id_a = (tableAdmins.get(U)).getId();
					Compte="Admin";
			        session.setAttribute("id_a", id_a);
			        this.getServletContext().getRequestDispatcher("/EspaceAdmin.jsp").forward(request, response);
				}
			}
			switch(Compte){
			case "Client":
				break;
			case "Marchand":
				break;
			case "Admin":
				break;
			default :
				msg="ID ou Mot de passe incorrect !!";
				request.setAttribute("message",msg);
				this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
				break;
			}
		}
		else {
			msg="Remplir tous les champs !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}

}
