package com.meecommerce.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meecommerce.beans.Marchands;
import com.meecommerce.beans.Product;
import com.meecommerce.beans.Products;
import com.meecommerce.beans.commande;
import com.meecommerce.beans.commandes;
import java.util.List;

/**
 * Servlet implementation class confirmer_achat
 */
@WebServlet("/confirmer_achat")
public class confirmer_achat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmer_achat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg="";
		String distinataire =request.getParameter("address");
		if(distinataire!="" && distinataire!=null) {
			HttpSession session = request.getSession();
			List<Product> ProductsCard1=(List) session.getAttribute( "ProductsCard" );
			List<String> Quantity1=(List) session.getAttribute( "Quantity" );
			List<String> size1=(List) session.getAttribute( "size" );
			int id_c = (int) session.getAttribute( "id_c" );
			int id_produit;
			DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar calendar = Calendar.getInstance();
			String date_creation=format.format(calendar.getTime());
			String date_livraison="pas encore";
			Products Products=new Products();
			Marchands Marchands=new Marchands();
			commandes commandes=new commandes();
			int id_m;
			String distinateur;
			for(int i=0;i<ProductsCard1.size();i++) {
				id_produit=(ProductsCard1.get(i)).getproduit_id();
				id_m=(Products.chercherProduct(String.valueOf(id_produit))).getid_M();
				distinateur=(Marchands.chercherMarchand(String.valueOf(id_m))).getAdress();
				commande commande=new commande(distinateur,distinataire,date_creation,date_livraison, id_c,id_produit,Integer.parseInt(Quantity1.get(i)),size1.get(i),"commande envoyée");
				commandes.ajoutercommande(commande);
			}
			List<Product> ProductsCard = new ArrayList<Product>();
			List<String> Quantity= new ArrayList<String>();
			List<String> size= new ArrayList<String>();
	        session.setAttribute("ProductsCard", ProductsCard);
	        session.setAttribute("Quantity", Quantity);
	        session.setAttribute("size", size);
			this.getServletContext().getRequestDispatcher("/CommandesC.jsp").forward(request, response);
		}else {
			msg="entrer votre adresse de livraison !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/SommeCard.jsp").forward(request, response);
		}
	}

}
