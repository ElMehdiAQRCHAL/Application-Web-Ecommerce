package com.meecommerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meecommerce.beans.Products;

/**
 * Servlet implementation class supprimerProduit
 */
@WebServlet("/supprimerProduit")
public class supprimerProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supprimerProduit() {
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
		String id=request.getParameter("id");
		String i=request.getParameter("i");
		Products Products=new Products();
		Products.SupprimerProduit(id);
		if(i.equals("1")) {
			this.getServletContext().getRequestDispatcher("/ListeP.jsp").forward(request, response);
		}else {
			this.getServletContext().getRequestDispatcher("/ProduitsM.jsp").forward(request, response);
		}
	}

}
