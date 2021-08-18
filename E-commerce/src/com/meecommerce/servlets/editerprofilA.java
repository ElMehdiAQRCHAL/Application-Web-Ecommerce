package com.meecommerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meecommerce.beans.Admin;
import com.meecommerce.beans.Admins;
import com.meecommerce.beans.Marchand;
import com.meecommerce.beans.Marchands;

/**
 * Servlet implementation class editerprofilA
 */
@WebServlet("/editerprofilA")
public class editerprofilA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editerprofilA() {
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
		HttpSession session = request.getSession();
		int Id=(int) session.getAttribute( "id_a" );
		String Nom =request.getParameter("Nom");
		String Prenom =request.getParameter("Prenom");
		String Email =request.getParameter("Email");
		String Password =request.getParameter("Password");
		String msg="";
		if(Nom!=null && Nom!="" && Prenom!=null && Prenom!="" && Email!=null && Email!="" && Password!=null && Password!="") {
			Admin Admin=new Admin(Id,Nom,Prenom,Email,Password);
			Admins Admins=new Admins();
			Admins.editerAdmin(Admin);
			this.getServletContext().getRequestDispatcher("/ProfilA.jsp").forward(request, response);
		}else {
			msg="Remplir tous les champs !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/EditProfilA.jsp").forward(request, response);
		}
		
	}

}
