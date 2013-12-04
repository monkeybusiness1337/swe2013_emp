package model ;

import java.util.UUID;

public class Enduser extends User {

	public String email;
	
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

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

  

}