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

import model.PrivateMessage;

public class PrivateMessageDAO {
	private static final String privateMessageFile = constants.SERSFOLDER + File.separator + "pm.ser";

	/**
	 * private variables needed to write to file
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
	private String pathToFile;

	/**
	 * constructor that sets the path to the file with given value
	 * 
	 * @param pathToFile
	 * @throws IOException
	 */
	private PrivateMessageDAO(String pathToFile) throws IOException {
		this.pathToFile = pathToFile;
	}

	public static PrivateMessageDAO getPrivateMessageDAO() {
		try {
			return new PrivateMessageDAO(privateMessageFile);
		} catch (IOException ex) {
			Logger.getLogger(PrivateMessageDAO.class.getName()).log(Level.SEVERE,
					null, ex);
		}
		return null;
	}

	/**
	 * Implementation of getPrivateMessageList- Method defined by the Interface
	 * PrivateMessageDAO
	 * 
	 * @throws IOException
	 * @see PrivateMessageDAO
	 */
	public List<PrivateMessage> getPrivateMessageList() {
		try {
			/**
			 * creating a fileinputstream and then an objectinput stream from it
			 */
			fileIn = new FileInputStream(pathToFile);
			in = new ObjectInputStream(fileIn);
			/**
			 * reading content of file and casting to arraylist of abstract
			 * PrivateMessages.. if reading from the right file it'll be always legal
			 * to cast the read object to an arraylist of type abstractPrivateMessage
			 */
			@SuppressWarnings("unchecked")
			ArrayList<PrivateMessage> privateMessages = (ArrayList<PrivateMessage>) in.readObject();
			/** closing streams */
			in.close();
			fileIn.close();
			/** return retrieved PrivateMessages */
			return privateMessages;
		} catch (Exception e) {
			System.out.print("There was a problem while building the PrivateMessagelist..");
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * Implementation of savePrivateMessage- Method defined by the Interface PrivateMessageDAO
	 * inperformant way of implementation
	 * 
	 * @see PrivateMessageDAO
	 */
	public void savePrivateMessage(PrivateMessage comment) throws IllegalArgumentException {
		try {
			/** get list of persistent PrivateMessages */
			ArrayList<PrivateMessage> privateMessages = (ArrayList<PrivateMessage>) getPrivateMessageList();
			// ArrayList<PrivateMessage> PrivateMessages = new ArrayList<PrivateMessage>() ;
			/** creating streams for writing to file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** add PrivateMessage new PrivateMessage to PrivateMessage list */
			privateMessages.add(comment);

			/** write new PrivateMessagelist to file */
			output.writeObject(comment);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException(
					"Error while registering new PrivateMessage!!!" + e.getMessage());
		}
	}

	/**
	 * Implementation of deletePrivateMessage- Method defined by the Interface
	 * PrivateMessageDAO inperformant way of implementation
	 * 
	 * @see PrivateMessageDAO
	 */
	public void deletePrivateMessage(PrivateMessage comment) throws IllegalArgumentException {
		try {
			/** get list of persistent PrivateMessages */
			ArrayList<PrivateMessage> privateMessages = (ArrayList<PrivateMessage>) getPrivateMessageList();
			/** variable needed to save match */
			PrivateMessage match = null;

			/** iterate over PrivateMessage list */
			for (PrivateMessage u : privateMessages) {
				/** compare by PrivateMessagename (PrivateMessagename = pk) */
				if (u.getPrivateMessageId() == comment.getPrivateMessageId()) {
					/** if found the right PrivateMessage, save him and break the loop */
					match = u;
					break;
				}
			}

			/** remove PrivateMessage from list */
			privateMessages.remove(privateMessages.indexOf(match));

			/** create the streams needed to write the file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** write new PrivateMessagelist to file */
			output.writeObject(privateMessages);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (IOException e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException(
					"Error while deleting PrivateMessage!!!" + e.getMessage());
		}
	}

	/**
	 * Implementation of updatePrivateMessage- Method defined by the Interface
	 * PrivateMessageDAO bad way of implementation
	 * 
	 * @see PrivateMessageDAO
	 */
	public void updatePrivateMessage(PrivateMessage comment) throws IllegalArgumentException {
		try {
			/** delete PrivateMessage (identified by PrivateMessagename) */
			deletePrivateMessage(comment);
			/** save PrivateMessage again with new data */
			savePrivateMessage(comment);
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException(
					"Error while updating PrivateMessage!!!" + e.getMessage());
		}
	}
}
