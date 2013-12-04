package model ;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public abstract class User implements Serializable{

    private String userId;
    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private String registerDate;
    private String birthDate;
    private List<PrivateMessage> myPrivateMessages;

    public User(){
    	userId = UUID.randomUUID().toString() ;
        myPrivateMessages = new ArrayList<PrivateMessage>() ;
    }
    
    public User(String userId, String userName, String password, String firstName, String lastName, String registerDate, String birthDate) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.registerDate = registerDate;
        this.birthDate = birthDate;
        this.myPrivateMessages = new ArrayList<PrivateMessage>();
    }
    
    public User(String userId, String userName, String password, String firstName, String lastName, String registerDate, String birthDate, List<PrivateMessage> myPrivateMessages) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.registerDate = registerDate;
        this.birthDate = birthDate;
        this.myPrivateMessages = myPrivateMessages;
    }
    
    
    
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public List<PrivateMessage> getMyPrivateMessages() {
        return myPrivateMessages;
    }

    public void setMyPrivateMessages(List<PrivateMessage> myPrivateMessages) {
        this.myPrivateMessages = myPrivateMessages;
    }
 
}