/**
 * The front controller receives all requests from the outside world, performs checks and (in case) redirects to the actual
 * servlet responsible for the job. The business logic is completely encapsulated behind this layer.
 * @author max
 * @version 0.1
 */

 package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.Administrator;
import model.Enduser;
import model.Event;
import model.Organizer;
import model.User;
import model.Comment;
import daos.EventDAO;
import daos.UserDAO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;
	private User session ;

	@Override
    public void init() throws ServletException{
		session = null ;
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
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
	   		if(request.getParameter("password").equals(request.getParameter("password2"))){
	   			if(request.getParameter("password").length() > 5){
		   			if(UserDAO.getUserDAO().getUserbyUsername(request.getParameter("username")) == null){
		   				User newUser =  null ;
		   				if(request.getParameter("enduser") != null && request.getParameter("enduser").equals("on")){
		   					newUser = new Enduser(request.getParameter("username"), request.getParameter("password")) ;
			   				UserDAO.getUserDAO().saveUser(newUser);
			   	   			request.setAttribute("user", newUser);
			   	   			session = newUser ;
			   	   			request.getSession(true).setAttribute("session", session) ;
			   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoEnduser.jsp") ;
			   		   		rd.forward(request, response);
		   				}
		   				else if(request.getParameter("organizer") != null && request.getParameter("organizer").equals("on")){
		   					newUser = new Organizer(request.getParameter("username"), request.getParameter("password")) ;
		   					UserDAO.getUserDAO().saveUser(newUser);
			   	   			request.setAttribute("user", newUser);
			   	   			session = newUser ;
			   	   			request.getSession(true).setAttribute("session", session) ;
			   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoOrganizer.jsp") ;
			   		   		rd.forward(request, response);
		   				}
		   				else{
		   					response.getWriter().append("<html><body>You have to choose an usertype!</body></html>") ;
		   					return ;
		   				}
		   			} else {
		   				response.getWriter().append("<html><body>User Already Exists!</body></html>") ;
		   			}
	   			} else{
	   				response.getWriter().append("<html><body>Password too short!</body></html>") ;
	   			}
	   		} else {
	   			response.getWriter().append("<html><body>Passwords must match!</body></html>") ;
   			}
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("login")){
   			User userToLogin = UserDAO.getUserDAO().getUserbyUsername(request.getParameter("username")) ;
   				if(userToLogin != null && userToLogin.getPassword().equals(request.getParameter("password"))){
   				session = userToLogin ;
   				request.getSession(true).setAttribute("session", session) ;
   				if(session instanceof Enduser){
	   				RequestDispatcher rd = request.getRequestDispatcher("/enduserLoggedIn.jsp") ;
	   				rd.forward(request, response);
   				} else if(session instanceof Organizer){
   					RequestDispatcher rd = request.getRequestDispatcher("/organizerLoggedIn.jsp") ;
	   				rd.forward(request, response);
   				} else if(session instanceof Administrator){
   					RequestDispatcher rd = request.getRequestDispatcher("/administratorLoggedIn.jsp") ;
	   				rd.forward(request, response);
   				}
   			}
   			else{
   				response.getWriter().append("<html><body>Wrong user or password or user does not exist!</body></html>") ;
   			}

   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("logout")){
   			session = null ;
   			request.getSession(true).setAttribute("session", null) ;
   			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("createEvent")){
   			Event event = new Event() ;
   			event.setEventName(request.getParameter("titel")) ;
   			event.setEventPlace(request.getParameter("ort")) ;
   			event.setDescription(request.getParameter("beschreibung").replace("\n", "<br/>")) ;
   			event.setGenre(request.getParameter("genre")) ;
   			event.setEventDate(request.getParameter("datum"));
   			event.setOrganizer((Organizer)session);
   			EventDAO.getEventDAO().saveEvent(event);

   			List<Event> events = new ArrayList<Event>() ;
   			for(Event ev : EventDAO.getEventDAO().getEventList()){
   				if(ev.getOrganizer() != null && ev.getOrganizer().getUserId().equals(session.getUserId())){
   					events.add(ev) ;
   				}
   			}
   			request.setAttribute("events", events);

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
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("listOwnEvents")){
   			List<Event> events = new ArrayList<Event>() ;
   			for(Event event : EventDAO.getEventDAO().getEventList()){
   				if(event.getOrganizer() != null && event.getOrganizer().getUserId().equals(session.getUserId())){
   					events.add(event) ;
   				}
   			}
   			request.setAttribute("events", events);
   			RequestDispatcher rd = request.getRequestDispatcher("/eventsListen.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("editUserInformation")){
   			boolean noEdit = (request.getParameter("action") == null) ? false : request.getParameter("action").equals("noEdit") ;
   			if(noEdit){
   				System.out.print("asdasdasd") ;
   				if(session instanceof Enduser){
   					request.setAttribute("user", (Enduser) UserDAO.getUserDAO().getUserbyUsername(((Enduser)session).getUserName()) );
   	   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoEnduser.jsp") ;
   	   		   		rd.forward(request, response);
   	   		   		return ;
   				} else if(session instanceof Organizer){
   					request.setAttribute("user", session);
   	   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoOrganizer.jsp") ;
   	   		   		rd.forward(request, response);
   	   		   		return ;
   				}
   			}
   			if(session instanceof Enduser){
   				session.setFirstName(request.getParameter("firstName"));
   				session.setLastName(request.getParameter("lastName"));
   				((Enduser) session).setEmail(request.getParameter("email"));
   				session.setBirthDate(request.getParameter("birthDate"));
   				((Enduser) session).setAbout(request.getParameter("about"));
   				UserDAO.getUserDAO().updateUser(session);
   				System.out.println(((Enduser)session).getUserPicPath()) ;
   				request.setAttribute("user", session);
   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoEnduser.jsp") ;
   		   		rd.forward(request, response);
   			} else if(session instanceof Organizer){
   				session.setFirstName(request.getParameter("firstName"));
   				session.setLastName(request.getParameter("lastName"));
   				((Organizer) session).setEmail(request.getParameter("email"));
   				((Organizer) session).setTel(request.getParameter("tel"));
   				session.setBirthDate(request.getParameter("birthDate"));
   				((Organizer) session).setDescription(request.getParameter("description"));
   				UserDAO.getUserDAO().updateUser(session);
   				request.setAttribute("user", session);
   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoOrganizer.jsp") ;
   		   		rd.forward(request, response);
   			} else if(session instanceof Administrator){
   				/** not implemented yet*/
   			}

   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("deleteEvent")){
   			if(session instanceof Organizer){
   				EventDAO.getEventDAO().deleteEvent(request.getParameter("event"));
   				List<Event> events = new ArrayList<Event>() ;
   	   			for(Event event : EventDAO.getEventDAO().getEventList()){
   	   				if(event.getOrganizer() != null && event.getOrganizer().getUserId().equals(session.getUserId())){
   	   					events.add(event) ;
   	   				}
   	   			}
   	   			request.setAttribute("events", events);
   				RequestDispatcher rd = request.getRequestDispatcher("/eventsListen.jsp") ;
   		   		rd.forward(request, response);
   			} else if(session instanceof Administrator){
   				response.getWriter().append("<html><body>You don't have the permission to delete Events!</body></html>") ;
   			}
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("listUsers")){
   			List<User> listOfUsers = UserDAO.getUserDAO().getUserList();
   			request.setAttribute("users", listOfUsers);
   			RequestDispatcher rd = request.getRequestDispatcher("/usersListen.jsp");
   			rd.forward(request,response);
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("search")){
   			ArrayList<Event> searchResult = new ArrayList<Event>() ;
   			for(Event event : EventDAO.getEventDAO().getEventList()){
   				if(event.getEventName().toLowerCase().contains((CharSequence)request.getParameter("searchTerm").toLowerCase())){
   					searchResult.add(event) ;
   				}
   			}

   			List<Event> filterResult = (ArrayList<Event>) searchResult.clone() ;

   			if(request.getParameter("genre") != null && request.getParameter("genre").length() > 0){
   				for(Event event : searchResult){
   					if(!event.getGenre().contains((CharSequence)request.getParameter("genre").toLowerCase())){
   						filterResult.remove(event) ;
   					}
   				}
   				request.setAttribute("genre", request.getParameter("genre")) ;
   			} else{
   				request.setAttribute("genre", "") ;
   			}

   			if(request.getParameter("location") != null && request.getParameter("location").length() > 0){
   				for(Event event : searchResult){
   					if(!event.getEventPlace().contains((CharSequence)request.getParameter("location").toLowerCase())){
   						filterResult.remove(event) ;
   					}
   				}
   				request.setAttribute("location", request.getParameter("location")) ;
   			} else{
   				request.setAttribute("location", "") ;
   			}

   			if(request.getParameter("from") != null && request.getParameter("from").length() > 0){
   				for(Event event : searchResult){
   					try{
   						SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
   	   				    Date date1 = format.parse(request.getParameter("from"));
   	   				    Date date2 = format.parse(event.getEventDate());

   	   					if(date2.compareTo(date1) <= 0){
   	   						filterResult.remove(event) ;
   	   					}
   					} catch(Exception e){

   					}

   				}
   				request.setAttribute("from", request.getParameter("from")) ;
   			} else{
   				request.setAttribute("from", "") ;
   			}

   			if(request.getParameter("to") != null && request.getParameter("to").length() > 0){
   				for(Event event : searchResult){
   					try{
   						SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
   	   				    Date date1 = format.parse(request.getParameter("to"));
   	   				    Date date2 = format.parse(event.getEventDate());

   	   					if(date2.compareTo(date1) >= 0){
   	   						filterResult.remove(event) ;
   	   					}
   					} catch(Exception e){

   					}
   				}
   				request.setAttribute("to", request.getParameter("to")) ;
   			} else{
   				request.setAttribute("to", "") ;
   			}

   			request.setAttribute("searchResult", filterResult);
   			request.setAttribute("searchTerm", request.getParameter("searchTerm")) ;
   			RequestDispatcher rd = request.getRequestDispatcher("/search.jsp") ;
	   		rd.forward(request, response);
   		} else if (request.getParameter("postComment") != null){
   			Event match = null ;
   			for(Event event : EventDAO.getEventDAO().getEventList()){
   				if(event.getEventId().equals(request.getParameter("postComment"))){
   					match = event ;
   					break ;
   				}
   			}
   			if( match == null )
   			{
   				response.getWriter().append( "<html><body>Could not find event.</body></html>" );
   				return;
   			}
   			List<Comment> oldComments = match.getComments();
   			Comment NewComment = new Comment( oldComments.size() + 1, 
   					                          request.getParameter("commentBody"), 
   					                          "", 
   					                          (Enduser)session );
   			
   			oldComments.add(NewComment);
   			match.setComments(oldComments);
   			EventDAO.getEventDAO().updateEvent(match);
   			
   			request.setAttribute("event", match);
   			RequestDispatcher rd = request.getRequestDispatcher("/event.jsp") ;
	   		rd.forward(request, response);
   		} else if (request.getParameter("participateEvent") != null){
   			Event match = null ;
   			for(Event event : EventDAO.getEventDAO().getEventList()){
   				if(event.getEventId().equals(request.getParameter("participateEvent"))){
   					match = event ;
   					break ;
   				}
   			}
   			
   			for(Enduser user : match.getParticipatedUsers()){
   				if(user != null && user.getUserId().equals(session.getUserId())){
   					response.getWriter().append(
   							"<html><body>Already participated to this Event!</body></html>");
   					return ;
   				}
   			}
   			
   			match.getParticipatedUsers().add((Enduser)session) ;
   			EventDAO.getEventDAO().updateEvent(match);
   			
   			request.setAttribute("event", match);
   			RequestDispatcher rd = request.getRequestDispatcher("/event.jsp") ;
	   		rd.forward(request, response);
   		} else if(request.getRequestURI().split("/").length >= 3 && request.getRequestURI().split("/")[2].equals("user")){
			request.setAttribute("user", (Enduser)UserDAO.getUserDAO().getUserbyUsername(request.getRequestURI().split("/")[3])) ;
			System.out.print(request.getRequestURI().split("/")[3]) ;
			RequestDispatcher rd = request.getRequestDispatcher("/user.jsp") ;
   			rd.forward(request, response);
			return ;
		} else{
   			if(session == null){
   				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp") ;
   				rd.forward(request, response);
   			} else if (session instanceof Enduser){
   				RequestDispatcher rd = request.getRequestDispatcher("/enduserLoggedIn.jsp") ;
   				rd.forward(request, response);
   			} else if (session instanceof Organizer){
   				RequestDispatcher rd = request.getRequestDispatcher("/organizerLoggedIn.jsp") ;
   				rd.forward(request, response);
   			} else if(session instanceof Administrator){
   				RequestDispatcher rd = request.getRequestDispatcher("/administratorLoggedIn.jsp") ;
   				rd.forward(request, response);
   			}
   		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getHeader("Referer")) ;
		System.out.println("------------") ;
		System.out.println() ;
		if(request.getHeader("Referer").split("/")[4].equals("createEvent.jsp")){
		
			try {
				List<FileItem> fileItemsList = uploader.parseRequest(request);
				Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
				Event event = new Event();
				String eventPicPath = "";
				while (fileItemsIterator.hasNext()) {
					FileItem fileItem = fileItemsIterator.next();
					if (fileItem.isFormField()) {
						if (fileItem.getFieldName().equals("titel")) {
							event.setEventName(fileItem.getString());
						} else if (fileItem.getFieldName().equals("ort")) {
							event.setEventPlace(fileItem.getString());
						} else if (fileItem.getFieldName().equals("beschreibung")) {
							event.setDescription(fileItem.getString());
						} else if (fileItem.getFieldName().equals("genre")) {
							event.setGenre(fileItem.getString());
						} else if (fileItem.getFieldName().equals("datum")) {
							event.setEventDate(fileItem.getString());
						}
					} else {
						if (fileItem.getFieldName().equals("fileName")) {
							String fileName = UUID.randomUUID().toString() + fileItem.getName() ;
							File file = new File(request.getRealPath("/") + "asd/"
									+ fileName);
							eventPicPath = "asd/" + fileName ;
							fileItem.write(file);
						}
					}
				}
				if (event.getPicturePath() == null)
					event.setPicturePath(eventPicPath);
				
				event.setOrganizer((Organizer)session) ;
				
				EventDAO.getEventDAO().saveEvent(event);

				List<Event> events = new ArrayList<Event>();
				for (Event ev : EventDAO.getEventDAO().getEventList()) {
					if (ev.getOrganizer() != null
							&& ev.getOrganizer().getUserId()
									.equals(session.getUserId())) {
						events.add(ev);
					}
				}
				request.setAttribute("events", events);

				RequestDispatcher rd = request
						.getRequestDispatcher("/eventsListen.jsp");
				rd.forward(request, response);

			} catch (FileUploadException e) {
				response.getWriter().append(
						"<html><body>" + e.toString() + "</body></html>");
			} catch (Exception e) {
				response.getWriter().append(
						"<html><body>" + e.toString() + "</body></html>");
			}
		} else if(request.getHeader("Referer").split("/")[4].contains("site=editUserInformation") 
				|| request.getHeader("Referer").split("/")[4].equals("editUserInfoEnduser.jsp")  
				|| Arrays.asList(request.getHeader("Referer").split("/")[4].split("\\?")[1].split("&")).contains("site=register")){
			
			 try {
		            List<FileItem> fileItemsList = uploader.parseRequest(request);
		            Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
	                Enduser user = new Enduser() ;
	                String userPicPath = "" ;
		            while(fileItemsIterator.hasNext()){
		                FileItem fileItem = fileItemsIterator.next();
		                if(fileItem.isFormField()){
		                		if(fileItem.getFieldName().equals("uname")){
		                			user  = (Enduser)UserDAO.getUserDAO().getUserbyUsername(fileItem.getString()) ;
		                		} else if(fileItem.getFieldName().equals("firstName")){
		                			user.setFirstName(fileItem.getString());
		                		} else if(fileItem.getFieldName().equals("lastName")){
		                			user.setLastName(fileItem.getString());
		                		} else if(fileItem.getFieldName().equals("birthDate")){
		                			user.setBirthDate(fileItem.getString());
		                		}  else if(fileItem.getFieldName().equals("about")){
		                			user.setAbout(fileItem.getString());
		                		}
		                } else{
		                	if(fileItem.getFieldName().equals("fileName")){
		                		String fileName = UUID.randomUUID().toString() + fileItem.getName() ;
				                File file = new File(request.getRealPath("/")+"asd/"+fileName);
				                //userPicPath = "asd/"+fileItem.getName() ;
				                userPicPath = "asd/" + fileName ;
				                fileItem.write(file);
		                	}
		                }
		            }
		            if(user.getUserPicPath() == null)
		            	user.setUserPicPath(userPicPath);
		            UserDAO.getUserDAO().updateUser(user);
	                request.setAttribute("user", user);
	                System.out.println("blabla>>>") ;
	                System.out.println( UserDAO.getUserDAO().getUserbyUsername(user.getUserName())) ;
	                RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoEnduser.jsp") ;
	 		   		rd.forward(request, response);

		        } catch (FileUploadException e) {
		        	response.getWriter().append("<html><body>"+e.toString()+"</body></html>") ;
		        } catch (Exception e) {
		        	response.getWriter().append("<html><body>"+e.toString()+"</body></html>") ;
		        }
		}
	}
}
