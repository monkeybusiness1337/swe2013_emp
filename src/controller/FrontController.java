package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import model.Enduser;
import model.Event;
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
   			Enduser newUser = new Enduser(request.getParameter("username"), request.getParameter("password")) ;
   			UserDAO.getUserDAO().saveUser(newUser);
   			request.setAttribute("user", newUser);
   			RequestDispatcher rd = request.getRequestDispatcher("/editUserInfo.jsp") ;
	   		rd.forward(request, response);
	   		
	   		if(request.getParameter("password").equals(request.getParameter("password2")) && request.getParameter("password").length() > 5){
	   			if(UserDAO.getUserDAO().getUserbyUsername(request.getParameter("username")) == null){	
	   				UserDAO.getUserDAO().saveUser(new Enduser(request.getParameter("username"), request.getParameter("password")));
	   				rd = request.getRequestDispatcher("/editUserInfo.jsp") ;
	   				rd.forward(request, response);
	   			}
	   			else {
	   				response.getWriter().append("<html><body>User Already Exists!</body></html>") ;
	   			}
	   		} else {
	   			response.getWriter().append("<html><body>Password too short!</body></html>") ;
   			}
   		} else if(request.getParameter("site") != null  && request.getParameter("site").equals("login")){
   			User userToLogin = UserDAO.getUserDAO().getUserbyUsername(request.getParameter("username")) ;
   			if(userToLogin.getPassword().equals(request.getParameter("password"))){
   				session = userToLogin ;
   				RequestDispatcher rd = request.getRequestDispatcher("/organizerLoggedIn.jsp") ;
   	   			rd.forward(request, response);
   			}
   			else{
   				response.getWriter().append("<html><body>fail!</body></html>") ;
   			}
   			
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
