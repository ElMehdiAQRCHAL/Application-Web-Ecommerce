package com.meecommerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meecommerce.beans.Client;
import com.meecommerce.beans.Clients;
import com.meecommerce.beans.Marchand;
import com.meecommerce.beans.Marchands;

/**
 * Servlet implementation class editerprofil
 */
@WebServlet("/editerprofil")
public class editerprofil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editerprofil() {
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
		int Id=(int) session.getAttribute( "id_c" );
		String Nom =request.getParameter("Nom");
		String Prenom =request.getParameter("Prenom");
		String Email =request.getParameter("Email");
		String Password =request.getParameter("Password");
		String msg="";
		if(Nom!=null && Nom!="" && Prenom!=null && Prenom!="" && Email!=null && Email!="" && Password!=null && Password!="") {
			session.setAttribute("nom", Nom);
	        session.setAttribute("prenom", Prenom);
			Client Client=new Client(Id,Nom,Prenom,Email,Password);
			Clients Clients=new Clients();
			Clients.editerClient(Client);
			this.getServletContext().getRequestDispatcher("/Profile.jsp").forward(request, response);
		}else {
			msg="Remplir tous les champs !!";
			request.setAttribute("message",msg);
			this.getServletContext().getRequestDispatcher("/Editprofil.jsp").forward(request, response);
		}
		
	}

}
