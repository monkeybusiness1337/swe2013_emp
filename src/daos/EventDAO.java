/**
 * The EventDAO is responsible for the persistent IO regarding objects of type Event. The save routine is stable but non-optimized.
 * @author max
 * @version 0.1
 */

package daos;

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
import model.Event;
import helpers.constants;

/**
 *
 * @author unfug
 */
public class EventDAO {

    private static final String EventFile = constants.SERSFOLDER + File.separator + "events.ser";

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
	private EventDAO(String pathToFile) throws IOException {
		this.pathToFile = pathToFile;
	}

        public static EventDAO getEventDAO(){
            try {
                return new EventDAO(EventFile) ;
            } catch (IOException ex) {
                Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null ;
        }

	/**
	 * Implementation of getEventList- Method defined by the Interface EventDAO
	 *
	 * @throws IOException
	 * @see EventDAO
	 */
	public List<Event> getEventList() {
		try {
			/** creating a fileinputstream and then an objectinput stream from it*/
			fileIn = new FileInputStream(pathToFile);
			in = new ObjectInputStream(fileIn);
			/**
			 * reading content of file and casting to arraylist of abstract Events..
			 * if reading from the right file it'll be always legal to cast
			 * the read object to an arraylist of type abstractEvent */
			@SuppressWarnings("unchecked")
			ArrayList<Event> Events = (ArrayList<Event>) in.readObject();
			/** closing streams */
			in.close();
			fileIn.close();
			/** return retrieved Events*/
			return Events;
		} catch (Exception e) {
			System.out.print("There was a problem while building the Eventlist..");
			e.printStackTrace();
		}
		return null ;

	}

	/**
	 * Implementation of getEventbyEventname- Method defined by the Interface
	 * EventDAO
	 *
	 * @see EventDAO
	 */
	public Event getEventbyEventname(String Eventname) {
		/** iterate over list of persistent Events */
		for (Event Event : getEventList())
			/** compare Events by Eventname (Eventname = pk) */
			if (Event.getEventName().equals(Eventname))
				return Event;
		/** if the Event wasn't found return null */
		return null;
	}

	/**
	 * Implementation of saveEvent- Method defined by the Interface EventDAO
	 * inperformant way of implementation
	 * @see EventDAO
	 */
	public void saveEvent(Event Event) throws IllegalArgumentException {
		try {
			/** get list of persistent Events */
			ArrayList<Event> Events = (ArrayList<Event>) getEventList();
                       //ArrayList<Event> Events = new ArrayList<Event>() ;
			/** creating streams for writing to file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** add Event new Event to Event list */
			Event match = null;
			for (Event u : Events) {
				/** compare by Eventname (Eventname = pk) */
				if (u.getEventId().equals(Event.getEventId())) {
					/** if found the right Event, save him and break the loop*/
					match = u;
					break;
				}
			}
			if( match == null )
			  Events.add(Event);
			else
				throw new IllegalArgumentException( "Event already in file.");

			/** write new Eventlist to file */
			output.writeObject(Events);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while registering new Event!!!" + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of deleteEvent- Method defined by the Interface EventDAO
	 * inperformant way of implementation
	 * @see EventDAO
	 */
	public void deleteEvent(Event event) throws IllegalArgumentException {
		try {
			/** get list of persistent Events */
			ArrayList<Event> Events = (ArrayList<Event>) getEventList();
			/** variable needed to save match */
			Event match = null;

			/** iterate over Event list */
			for (Event u : Events) {
				/** compare by Eventname (Eventname = pk) */
				if (u.getEventId().equals(event.getEventId())) {
					/** if found the right Event, save him and break the loop*/
					match = u;
					break;
				}
			}
			
			/** remove Event from list */
			Events.remove(Events.indexOf(match));
			

			/** create the streams needed to write the file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** write new Eventlist to file */
			output.writeObject(Events);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (IOException e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while deleting Event!!!" + e.getMessage()) ;
		}
	}

	public void deleteEvent(String eventId) throws IllegalArgumentException {
		try {
			/** get list of persistent Events */
			ArrayList<Event> Events = (ArrayList<Event>) getEventList();
			/** variable needed to save match */
			Event match = null;

			/** iterate over Event list */
			for (Event u : Events) {
				/** compare by Eventname (Eventname = pk) */
				if (u.getEventId().equals(eventId)) {
					/** if found the right Event, save him and break the loop*/
					match = u;
					break;
				}
			}

			/** remove Event from list */
			Events.remove(Events.indexOf(match));

			/** create the streams needed to write the file */
			file = new FileOutputStream(pathToFile);
			buffer = new BufferedOutputStream(file);
			output = new ObjectOutputStream(buffer);

			/** write new Eventlist to file */
			output.writeObject(Events);
			/** flush it */
			output.flush();

			/** and finally close the streams */
			output.close();
			buffer.close();
			file.close();
		} catch (IOException e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while deleting Event!!!" + e.getMessage()) ;
		}
	}

	/**
	 * Implementation of updateEvent- Method defined by the Interface EventDAO
	 * bad way of implementation
	 * @see EventDAO
	 */
	public void updateEvent(Event Event) throws IllegalArgumentException {
		try {
			/** delete Event (identified by Eventname) */
			deleteEvent(Event);
			/** save Event again with new data */
			saveEvent(Event);
		} catch (Exception e) {
			/** throw illegal argument exception */
			throw new IllegalArgumentException("Error while updating Event!!!" + e.getMessage()) ;
		}
	}
}
