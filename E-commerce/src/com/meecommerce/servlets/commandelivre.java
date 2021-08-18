package com.meecommerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meecommerce.beans.commandes;

/**
 * Servlet implementation class commandelivre
 */
@WebServlet("/commandelivre")
public class commandelivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commandelivre() {
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
		String commande_id=(String) request.getParameter("id_Com");
		String statut="livrée";
		String i=(String) request.getParameter("i");
		commandes commandes=new commandes();
		if(i.equals("0")) {
			commandes.AnnulerCommande(commande_id);
			this.getServletContext().getRequestDispatcher("/CommandesConfM.jsp").forward(request, response);
		}else {
			commandes.livrerCommande(commande_id,statut);
			this.getServletContext().getRequestDispatcher("/CommandesLivreM.jsp").forward(request, response);
		}
	}

}
