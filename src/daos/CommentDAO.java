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

import model.Comment;

public class CommentDAO {

    private static final String CommentFile = constants.SERSFOLDER + File.separator + "comments.ser";
    
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
	private CommentDAO(String pathToFile) throws IOException {
		this.pathToFile = pathToFile;
	}
        
        public static CommentDAO getCommentDAO(){
            try {
                return new CommentDAO(CommentFile) ;
            } catch (IOException ex) {
                Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null ;
        }

	/**
	 * Implementation of getCommentList- Method defined by the Interface CommentDAO
	 * 
	 * @throws IOException
	 * @see CommentDAO
	 */
	public List<Comment> getCommentList() {
		try {
			/** creating a fileinputstream and then an objectinput stream from it*/
			fileIn = new FileInputStream(pathToFile);
			in = new ObjectInputStream(fileIn);
			/** 
			 * reading content of file and casting to arraylist of abstract Comments..
			 * if reading from the right file it'll be always legal to cast
			 * the read object to an arraylist of type abstractComment */
			@SuppressWarnings("unchecked")
			ArrayList<Comment> comments = (ArrayList<Comment>) in.readObject();
			/** closing streams */
			in.close();
			fileIn.close();
			/** return retrieved Comments*/
			return comments;
		} catch (Exception e) {
			System.out.print("There was a problem while building the Commentlist..");
			e.printStackTrace();
		} 
		return null ;

	}

	

	/**
	 * Implementation of saveComment- Method defined by the Interface CommentDAO
	 * inperformant way of implementation
	 * @see CommentDAO
	 */
	public void saveComment(Comment comment) throws IllegalArgumentException {
		try {
			/** get list of persistent Comments */
			ArrayList<Comment> comments = (ArrayList<Comment>) getCommentList();
                       //ArrayList<Comment> Comments = new ArrayList<Comment>() ;
			/** creating streams for writing to file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** add Comment new Comment to Comment list */
			comments.add(comment);

			/** write new Commentlist to file */
			output.writeObject(comment);
			/** flush it */
			output.flush();
			
			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while registering new Comment!!!" + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of deleteComment- Method defined by the Interface CommentDAO
	 * inperformant way of implementation
	 * @see CommentDAO
	 */
	public void deleteComment(Comment comment) throws IllegalArgumentException {
		try {
			/** get list of persistent Comments */
			ArrayList<Comment> comments = (ArrayList<Comment>) getCommentList();
			/** variable needed to save match */
			Comment match = null;
			
			/** iterate over Comment list */
			for (Comment u : comments) {
				/** compare by Commentname (Commentname = pk) */
				if (u.getCommentId() == comment.getCommentId()) {
					/** if found the right Comment, save him and break the loop*/
					match = u;
					break;
				}
			}

			/** remove Comment from list */
			comments.remove(comments.indexOf(match));
			
			/** create the streams needed to write the file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** write new Commentlist to file */
			output.writeObject(comments);
			/** flush it */
			output.flush();
			
			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (IOException e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while deleting Comment!!!" + e.getMessage()) ;
		}
	}
	
	/**
	 * Implementation of updateComment- Method defined by the Interface CommentDAO
	 * bad way of implementation
	 * @see CommentDAO
	 */
	public void updateComment(Comment comment) throws IllegalArgumentException {
		try {
			/** delete Comment (identified by Commentname) */
			deleteComment(comment);
			/** save Comment again with new data */
			saveComment(comment);
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while updating Comment!!!" + e.getMessage()) ;
		}
	}
}
