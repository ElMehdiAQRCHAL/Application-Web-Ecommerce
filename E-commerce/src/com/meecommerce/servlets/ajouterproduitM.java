package com.meecommerce.servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.meecommerce.beans.Product;
import com.meecommerce.beans.Products;

/**
 * Servlet implementation class ajouterproduitM
 */
@WebServlet("/ajouterproduitM")
public class ajouterproduitM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int TAILLE_TAMPON = 10240;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajouterproduitM() {
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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        HttpSession session = request.getSession();
        String id_M = String.valueOf(session.getAttribute( "id_m" ));
        String prix = request.getParameter("prix");
        String sible = request.getParameter("sible");
        String img="Images/"+request.getParameter("fichier");
        String msg="";
        if(name!="" && name!=null && description!="" && description!=null && prix!="" && prix!=null && sible!=null && img!=null) {
        	Product Product = new Product(name,description,Integer.parseInt(id_M),Float.parseFloat(prix),sible,img);
            Products Products = new Products();
            Products.ajouterProduct(Product);
            this.getServletContext().getRequestDispatcher("/ProduitsM.jsp").forward(request, response);
        }else {
        	msg="Remplir tous les champs !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/AjouterProduitM.jsp").forward(request, response);
        }
	}
	

}
