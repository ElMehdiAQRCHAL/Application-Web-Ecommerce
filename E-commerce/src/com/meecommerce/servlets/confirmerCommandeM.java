package com.meecommerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meecommerce.beans.commandes;

/**
 * Servlet implementation class confirmerCommandeM
 */
@WebServlet("/confirmerCommandeM")
public class confirmerCommandeM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmerCommandeM() {
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
		String Date =request.getParameter("Date");
		String msg="";
		if(Date!=null && Date!="") {
			String commande_id=(String) request.getParameter("id_Com");
			String statut="en livraison";
			commandes commandes=new commandes();
			commandes.confirmerCommande(commande_id,Date,statut);
			this.getServletContext().getRequestDispatcher("/CommandesConfM.jsp").forward(request, response);
		}else {
			msg="entrer la date de livraison !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/ConfirmerCommandeM.jsp?id_Com="+request.getParameter("id_Com")).forward(request, response);
		}
	}

}
