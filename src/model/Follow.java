package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Follow implements Serializable{

    private String followId;
    
    private String followerId;
    private String followedId;
    
    public Follow(){
    	this.followId = UUID.randomUUID().toString() ;
    }
    
    public Follow( String f1, String f2 ) {
        this.followId = UUID.randomUUID().toString() ;
        this.followerId = f1;
        this.followedId = f2;
    }

    public Follow( Enduser u1, Enduser u2 )
    {
    	this.followedId = UUID.randomUUID().toString();
        this.followerId = u1.getUserId();
    	this.followedId = u2.getUserId();
    }

    public void setFollower( Enduser u )
    {
    	this.followerId = u.getUserId();
    }
    public void setFollower( String i )
    {
    	this.followerId = i;
    }
    public String getFollower()
    {
    	return this.followerId;
    }
    
    public void setFollowed( Enduser u )
    {
    	this.followedId = u.getUserId();
    }
    public void setFollowed( String i )
    {
    	this.followedId = i;
    }
    public String getFollowed()
    {
    	return this.followedId;
    }

    public String getFollowId()
    {
    	return this.followId;
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