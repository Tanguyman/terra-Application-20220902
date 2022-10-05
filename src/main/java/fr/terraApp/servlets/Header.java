package fr.terraApp.servlets;

import java.io.IOException;

import fr.terraApp.dao.CoordonneesTerraDao;
import fr.terraApp.dao.DaoException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Header
 */
public class Header extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Header() {
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
		
		HttpSession session = request.getSession(true);
		session.setMaxInactiveInterval(600);
		String names[] = session.getValueNames();
		for ( int i = 0, n = names.length; i < n; i++ ) {
			String key = names[i];
			System.out.println("Session key (Header) : " + key + "-> Session value : " + session.getValue(key));
		}
		
		CoordonneesTerraDao cDao = new CoordonneesTerraDao();
		try {
			request.setAttribute("terra", cDao.getById(1));
		} catch (DaoException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/header.jsp").include(request, response);
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
