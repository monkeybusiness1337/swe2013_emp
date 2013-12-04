package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Event implements Serializable{

    private String eventId;
    
    private Organizer organizer;
    private String genre;
    private String picturePath;
    private String eventDate;
    private String description;
    private String eventName ;
    private String eventPlace ;
    
    private List<Enduser> invitedUsers;
    private List<Enduser> participatedUsers;
    private List<Comment> comments;

    
    public Event(){
    	this.eventId = UUID.randomUUID().toString() ;
        invitedUsers = new ArrayList<Enduser>() ;
        participatedUsers = new ArrayList<Enduser>() ;
        comments = new ArrayList<Comment>() ;
    }
    
    public Event(Organizer organizer, String genre, String picturePath, String eventDate, String description, String eventName, String eventPlace, List<Enduser> invitedUsers, List<Enduser> participatedUsers, List<Comment> comments) {
        this.eventId = UUID.randomUUID().toString() ;
        this.organizer = organizer;
        this.genre = genre;
        this.picturePath = picturePath;
        this.eventDate = eventDate;
        this.description = description;
        this.eventName = eventName ;
        this.invitedUsers = invitedUsers;
        this.participatedUsers = participatedUsers;
        this.comments = comments;
        this.eventPlace = eventPlace ;
    }

    
    public Event(String eventId, Organizer organizer, String genre, String picturePath, String eventDate, String description, String eventName, String eventPlace, List<Enduser> invitedUsers, List<Enduser> participatedUsers, List<Comment> comments) {
        this.eventId = eventId;
        this.organizer = organizer;
        this.genre = genre;
        this.picturePath = picturePath;
        this.eventDate = eventDate;
        this.description = description;
        this.eventName = eventName ;
        this.invitedUsers = invitedUsers;
        this.participatedUsers = participatedUsers;
        this.comments = comments;
        this.eventPlace = eventPlace ;
    }

    
    
    public String getEventPlace() {
		return eventPlace;
	}

	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public Organizer getOrganizer() {
        return organizer;
    }

    public void setOrganizer(Organizer organizer) {
        this.organizer = organizer;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Enduser> getInvitedUsers() {
        return invitedUsers;
    }

    public void setInvitedUsers(List<Enduser> invitedUsers) {
        this.invitedUsers = invitedUsers;
    }

    public List<Enduser> getParticipatedUsers() {
        return participatedUsers;
    }

    public void setParticipatedUsers(List<Enduser> participatedUsers) {
        this.participatedUsers = participatedUsers;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    /*
    @Override
    public String toString(){
        StringBuilder returnString = new StringBuilder() ;
        
        returnString.append("[Event: ") 
                      .append("eventId=").append(eventId).append(",")
                      .append("organizer=").append(organizer.getUserId()).append(",")
                      .append("genre=").append(genre).append(",")
                      .append("picturePath=").append(picturePath).append(",")
                      .append("eventDate=").append(eventDate).append(",")
                      .append("description=").append(description).append(",")
                      .append("];") ;
        
        return returnString.toString() ;
    }*/
    
   
}