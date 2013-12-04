package model;

import java.util.ArrayList;
import java.util.List;

public class Organizer extends User {

    private String email;
    private String tel;
    private List<Event> events;

    public Organizer() {
        events = new ArrayList<Event>() ;
    }

    public Organizer(String userId, String userName, String password, String firstName, String lastName, String registerDate, String birthDate) {
        super(userId, userName, password, firstName, lastName, registerDate, birthDate);
    }
    
    public Organizer(String userId, String userName, String password, String firstName, String lastName, String registerDate, String birthDate, List<PrivateMessage> myPrivateMessages) {
        super(userId, userName, password, firstName, lastName, registerDate, birthDate, myPrivateMessages);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public List<Event> getEvents() {
        return events;
    }

    public void setEvents(List<Event> events) {
        this.events = events;
    }
    /*
    @Override
    public String toString(){
        StringBuilder returnString = new StringBuilder() ;
        returnString.append("[Organizer:")
                      .append("userId=").append(super.getUserId()).append(",")
                      .append("userName=").append(super.getUserName()).append(",")
                      .append("password=").append(super.getPassword()).append(",")
                      .append("firstName=").append(super.getFirstName()).append(",")
                      .append("lastName=").append(super.getLastName()).append(",")
                      .append("registeredDate=").append(super.getRegisterDate()).append(",")
                      .append("birthDate=").append(super.getBirthDate()).append("];") ;
        
        return returnString.toString() ;
    }*/
    
}