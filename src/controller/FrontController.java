package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Enduser;
import model.Event;
import model.Organizer;
import model.User;
import daos.EventDAO;
import daos.UserDAO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User session ;
    /**
     * Default constructor. 
     */
    public FrontController() {
        // TODO Auto-generated constructor stub
    	session = null ;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   		if(request.getParameter("site") != null && request.getParameter("site").equals("start")){
   			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp") ;
   			rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("showEvents")){
   			RequestDispatcher rd = request.getRequestDispatcher("/eventsListen.jsp") ;
   			rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("event")){
   			RequestDispatcher rd = request.getRequestDispatcher("/veranstaltung.jsp") ;
   			rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("register")){
   			UserDAO.getUserDAO().saveUser(new Enduser(request.getParameter("username"), request.getParameter("password")));
   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfo.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("login")){
   			User userToLogin = UserDAO.getUserDAO().getUserbyUsername(request.getParameter("username")) ;
   			if(userToLogin.getPassword().equals(request.getParameter("password"))){
   				session = userToLogin ;
   				RequestDispatcher rd = request.getRequestDispatcher("/organizerLoggedIn.jsp") ;
   	   			rd.forward(request, response);
   			}
   			else
   				response.getWriter().append("<html><body>fail!</body></html>") ;
   					
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("logout")){
   			UserDAO.getUserDAO().saveUser(new Enduser(request.getParameter("username"), request.getParameter("password")));
   			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("createEvent")){
   			Event event = new Event() ;
   			event.setEventName(request.getParameter("titel")) ;
   			event.setEventPlace(request.getParameter("ort")) ;
   			event.setDescription(request.getParameter("beschreibung").replace("\n", "<br/>")) ;
   			event.setGenre(request.getParameter("genre")) ;
   			event.setEventDate(request.getParameter("datum"));
   			EventDAO.getEventDAO().saveEvent(event);
   			RequestDispatcher rd = request.getRequestDispatcher("/eventsListen.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("showEvent")){
   			Event match = null ;
   			for(Event event : EventDAO.getEventDAO().getEventList()){
   				if(event.getEventId().equals(request.getParameter("event"))){
   					match = event ;
   					break ;
   				}
   			}
   			response.getWriter().append("<html><body>"+match.toString()+"</body></html>") ;
   			request.setAttribute("event", match);
   			RequestDispatcher rd = request.getRequestDispatcher("/event.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("search")){
   			PrintWriter out = response.getWriter() ;
   			out.append("<html><body>") ;
   			for(Event event : EventDAO.getEventDAO().getEventList()){
   				if(event.getEventName().contains((CharSequence)request.getParameter("searchTerm"))){
   					out.append(event.toString()+"<br/>") ;
   				}
   			}
   			out.append("</body></html>") ;
   		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
