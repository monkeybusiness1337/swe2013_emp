/**
 * The EventDAO is responsible for the persistent IO regarding objects of type User. The save routine is stable but non-optimized.
 * @author max
 * @version 0.1
*/

package daos;

import helpers.constants;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Organizer;
import model.User;



/**
 *
 * @author unfug
 */
public class UserDAO {

    private static final String userFile = constants.SERSFOLDER + File.separator + "users.ser";

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
	private UserDAO(String pathToFile) throws IOException {
		this.pathToFile = pathToFile;
	}

        public static UserDAO getUserDAO(){
            try {
                return new UserDAO(userFile) ;
            } catch (IOException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null ;
        }

        public User getUserbyUserId(String UserId) {
        	/** iterate over list of persistent users */
        	for (User user : getUserList())
        		if (user.getUserId().equals(UserId))
        			return user;
        	/** if the user wasn't found return null */
        	return null;
        }
        
	/**
	 * Implementation of getUserList- Method defined by the Interface UserDAO
	 *
	 * @throws IOException
	 * @see UserDAO
	 */
	public List<User> getUserList() {
		try {
			/** creating a fileinputstream and then an objectinput stream from it*/
			fileIn = new FileInputStream(pathToFile);
			in = new ObjectInputStream(fileIn);
			/**
			 * reading content of file and casting to arraylist of abstract users..
			 * if reading from the right file it'll be always legal to cast
			 * the read object to an arraylist of type abstractuser */
			@SuppressWarnings("unchecked")
			ArrayList<User> users = (ArrayList<User>) in.readObject();
			/** closing streams */
			in.close();
			fileIn.close();
			/** return retrieved users*/
			return users;
		} catch (Exception e) {
			System.out.print("There was a problem while building the userlist..");
			e.printStackTrace();
		}
		return null ;

	}

	/**
	 * Implementation of getUserbyUsername- Method defined by the Interface
	 * UserDAO
	 *
	 * @see UserDAO
	 */
	public User getUserbyUsername(String username) {
		/** iterate over list of persistent users */
		for (User user : getUserList())
			/** compare users by username (username = pk) */
			if (user.getUserName().equals(username))
				return user;
		/** if the user wasn't found return null */
		return null;
	}

	/**
	 * Implementation of saveUser- Method defined by the Interface UserDAO
	 * inperformant way of implementation
	 * @see UserDAO
	 */
	public void saveUser(User user) throws IllegalArgumentException {
		try {
			/** get list of persistent users */
			ArrayList<User> users = (ArrayList<User>) getUserList();
            //           ArrayList<User> users = new ArrayList<User>() ;
			/** creating streams for writing to file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** add user new user to user list */
			users.add(user);

			/** write new userlist to file */
			output.writeObject(users);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while registering new User!!!" + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of deleteUser- Method defined by the Interface UserDAO
	 * inperformant way of implementation
	 * @see UserDAO
	 */
	public void deleteUser(User user) throws IllegalArgumentException {
		try {
			/** get list of persistent users */
			ArrayList<User> users = (ArrayList<User>) getUserList();
			/** variable needed to save match */
			User match = null;

			/** iterate over user list */
			for (User u : users) {
				/** compare by username (username = pk) */
				if (u.getUserName().equals(user.getUserName())) {
					/** if found the right user, save him and break the loop*/
					match = u;
					break;
				}
			}

			/** remove user from list */
			users.remove(users.indexOf(match));

			/** create the streams needed to write the file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** write new userlist to file */
			output.writeObject(users);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (IOException e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while deleting User!!!" + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of updateUser- Method defined by the Interface UserDAO
	 * bad way of implementation
	 * @see UserDAO
	 */
	public void updateUser(User user) throws IllegalArgumentException {
		try {
			/** delete user (identified by username) */
			deleteUser(user);
			/** save user again with new data */
			saveUser(user);
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while updating User!!!" + e.getMessage()) ;
		}
	}
}
