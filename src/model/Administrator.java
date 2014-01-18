package model;

public class Administrator extends User{

	private static final long serialVersionUID = 1L;

	public Administrator(){
		super() ;
	}
	
	public Administrator( String username, String password )
	{
		super() ;
		super.setUserName(username);
		super.setPassword(password) ;
	}
}