package fr.terraApp.servlets;

import java.io.IOException;

import fr.terraApp.dao.AdresseEntreesDao;
import fr.terraApp.dao.DaoException;
import fr.terraApp.dao.Database;
import fr.terraApp.dao.ZoneChalandiseDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Index
 */
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		// Récupérer les paramètres du Header (POST)
		Database.Connect();
		int idClientFromVitrine = Integer.parseInt( request.getParameter("id") );
		
		// MES ADRESSES
		ZoneChalandiseDao zDao = new ZoneChalandiseDao();
		AdresseEntreesDao aeDao = new AdresseEntreesDao();
		try {
			//System.out.println(zDao.getAllAddresses(idClientFromVitrine));
			request.setAttribute("zCol", zDao.getAllFromAddress(idClientFromVitrine));
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("activeMesAdresses", "active");
		request.getRequestDispatcher("mesAdresses.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
