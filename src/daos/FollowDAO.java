package daos;

import helpers.constants;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Follow;

public class FollowDAO {

    private static final String FollowFile = constants.SERSFOLDER + File.separator + "follow.ser";
    
    /**
	 *  private variables needed to write to file 
	 */
	private OutputStream file;
	private OutputStream buffer;
	private ObjectOutput output;

	/** 
	 * private variables needed to read from file 
	 */
	private FileInputStream fileIn;
	private ObjectInputStream in;

	/** 
	 * private attribute containing filepath
	 */
	private String pathToFile ;
	
	/**
	 * constructor that sets the path to the file with given value
	 * @param pathToFile
	 * @throws IOException
	 */
	public FollowDAO(String pathToFile) throws IOException {
		this.pathToFile = pathToFile;
	}
        
        public static FollowDAO getFollowDAO(){
            try {
                return new FollowDAO(FollowFile) ;
            } catch (IOException ex) {
                Logger.getLogger(FollowDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null ;
        }

	/**
	 * Implementation of getFollowList- Method defined by the interface FollowDAO
	 * 
	 * @throws IOException
	 * @see FollowDAO
	 */
	public List<Follow> getFollowList() {
		try {
			/** creating a fileinputstream and then an objectinput stream from it*/
			fileIn = new FileInputStream(pathToFile);
			in = new ObjectInputStream(fileIn);
			/** 
			 * reading content of file and casting to arraylist of Follows*/
			@SuppressWarnings("unchecked")
			ArrayList<Follow> follows = (ArrayList<Follow>) in.readObject();
			/** closing streams */
			in.close();
			fileIn.close();
			/** return retrieved Follows*/
			return follows;
		} catch (Exception e) {
			System.out.print("There was a problem while building the Follow list.");
			e.printStackTrace();
		} 
		return null ;

	}

	public void createOutputFile()
	{
		try {
			ArrayList<Follow> follows = new ArrayList<Follow>();
			
			/** creating streams for writing to file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** write new Follow-list to file */
			output.writeObject( follows );
			/** flush it */
			output.flush();
			
			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		}
	    catch (Exception e) {
		/** throw illegal argument exception */
		throw new IllegalArgumentException("Error while creating file. " + e.getMessage()) ;
	    }
	}    

	/**
	 * Implementation of saveFollow- Method defined by the Interface FollowDAO
	 * inperformant way of implementation
	 * @see FollowDAO
	 */
	public void saveFollow(Follow follow) throws IllegalArgumentException {
		try {
			/** get list of persistent Follows */
			ArrayList<Follow> follows = (ArrayList<Follow>) getFollowList();
			/** creating streams for writing to file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** add Follow to Follow list */
			follows.add( follow );

			/** write new Follow-list to file */
			output.writeObject( follows );
			/** flush it */
			output.flush();
			
			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while registering new Follow. " + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of deleteFollow - Method defined by the Interface FollowDAO
	 * inperformant way of implementation
	 * @see FollowDAO
	 */
	public void deleteFollow(Follow follow) throws IllegalArgumentException {
		try {
			/** get list of persistent Follows */
			ArrayList<Follow> follows = (ArrayList<Follow>) getFollowList();
			/** variable needed to save match */
			Follow match = null;
			
			/** iterate over Follow list */
			for (Follow u : follows) {
				if( u.getFollower().equals(follow.getFollower()) && u.getFollowed().equals(follow.getFollowed()) )
				{
					match = u;
					break;
				}
			}

			/** remove Follow from list */
			if( match != null )
			  follows.remove(follows.indexOf(match));
			
			/** create the streams needed to write the file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			output.writeObject(follows);
			/** flush it */
			output.flush();
			
			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (IOException e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while deleting Follow. " + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of updateFollow- Method defined by the Interface FollowDAO
	 * bad way of implementation
	 * @see FollowDAO
	 */
	public void updateFollow(Follow follow) throws IllegalArgumentException {
		try {
			deleteFollow( follow );
			saveFollow( follow );
		} catch (Exception e) {
			throw new IllegalArgumentException("Error while updating Follow. " + e.getMessage()) ;
		}
	}
}