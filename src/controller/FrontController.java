package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

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
			   	   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfoEnduser.jsp") ;
			   		   		rd.forward(request, response);
		   				}
		   				else if(request.getParameter("organizer") != null && request.getParameter("organizer").equals("on")){
		   					newUser = new Organizer(request.getParameter("username"), request.getParameter("password")) ;
		   					UserDAO.getUserDAO().saveUser(newUser);
			   	   			request.setAttribute("user", newUser);
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
   			if(userToLogin.getPassword().equals(request.getParameter("password"))){
   				session = userToLogin ;
   				
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
   				response.getWriter().append("<html><body>Wrong user or password!</body></html>") ;
   			}
   			
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("logout")){
   			session = null ;
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
   		}  else{
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
				                File file = new File(request.getRealPath("/")+"asd/"+fileItem.getName());
				                userPicPath = "asd/"+fileItem.getName() ;
				                fileItem.write(file);
		                	}
		                }
		            }
		            if(user.getUserPicPath() == null)
		            	user.setUserPicPath(userPicPath);
		            UserDAO.getUserDAO().updateUser(user);
	                request.setAttribute("user", user);
	                RequestDispatcher rd = request.getRequestDispatcher("/editUserInfo.jsp") ;
	 		   		rd.forward(request, response);
	 		   		
		        } catch (FileUploadException e) {
		        	response.getWriter().append("<html><body>"+e.toString()+"</body></html>") ;
		        } catch (Exception e) {
		        	response.getWriter().append("<html><body>"+e.toString()+"</body></html>") ;
		        }
			 
   		} 
}
