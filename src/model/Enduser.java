package model ;

import java.util.UUID;

public class Enduser extends User {

	public String email;
	public String about ;
	public String userPicPath ;
	
	public Enduser(){
		
	}
	
	public Enduser(String email) {
		super();
		this.email = email;
	}
	
	public Enduser(String username, String password){
		super() ;
		super.setUserName(username);
		super.setPassword(password) ;
	}
	
	public Enduser(String userId, String userName, String password, String firstName, String lastName, String registerDate, String birthDate, String email) {
		super(userId, userName, password, firstName, lastName, registerDate, birthDate) ;
		this.email = email ;
	}
	
	public String getUserPicPath() {
		return userPicPath;
	}

	public void setUserPicPath(String userPicPath) {
		this.userPicPath = userPicPath;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

  

}