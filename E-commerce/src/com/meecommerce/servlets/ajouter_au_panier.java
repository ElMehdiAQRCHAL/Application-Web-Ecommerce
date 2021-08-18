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

import com.meecommerce.beans.Product;
import com.meecommerce.beans.Products;

/**
 * Servlet implementation class ajouter_au_panier
 */
@WebServlet("/ajouter_au_panier")
public class ajouter_au_panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajouter_au_panier() {
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
		String q=request.getParameter("Quantity");
		String s=request.getParameter("size");
		if(q!=null && s!=null) {
			HttpSession session = request.getSession();
			List<Product> ProductsCard = (List) new ArrayList<Product>((List) session.getAttribute( "ProductsCard" ));
			List<String> Quantity=(List) new ArrayList<String>((List) session.getAttribute( "Quantity" ));
			List<String> size=(List) new ArrayList<String>((List) session.getAttribute( "size" ));
			Products Products=new Products();
			Product Product=new Product(0,"0","0",0,0,"0","0");
			Product.setproduit_id((Products.chercherProduct((String) request.getParameter("id"))).getproduit_id());
			Product.setname((Products.chercherProduct((String) request.getParameter("id"))).getname());
			Product.setdescription((Products.chercherProduct((String) request.getParameter("id"))).getdescription());
			Product.setid_M((Products.chercherProduct((String) request.getParameter("id"))).getid_M());
			Product.setprix((Products.chercherProduct((String) request.getParameter("id"))).getprix());
			Product.setsible((Products.chercherProduct((String) request.getParameter("id"))).getsible());
			Product.setimg((Products.chercherProduct((String) request.getParameter("id"))).getimg());
			ProductsCard.add(Product);
			Quantity.add(q);
			size.add(s);
			session.setAttribute("ProductsCard", ProductsCard);
	        session.setAttribute("Quantity", Quantity);
	        session.setAttribute("size", size);
			this.getServletContext().getRequestDispatcher("/Card.jsp").forward(request, response);
		}else {
			msg="Remplir tous les champs !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/Addproduct.jsp?id="+request.getParameter("id")).forward(request, response);
		}
	}

}
