package tests;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import daos.UserDAO;
import daos.PrivateMessageDAO;
import model.PrivateMessage;
import model.User;
import model.Enduser;

public class PrivateMessageTest {
	private User user1;
	private User user2;
	private PrivateMessage message1;
	private PrivateMessage message2;
	@Before
	public void setUp() throws Exception {
		user1 = new Enduser();
		user2 = new Enduser();
		UserDAO.getUserDAO().saveUser(user1);
		UserDAO.getUserDAO().saveUser(user2);
		message1 = new PrivateMessage();
		message1.setBody("Testbody");
		message1.setSubject("Testsubject");
		message1.setReceiver(user2);
		message1.setSender(user1);
		message2 = new PrivateMessage();
		message2.setBody("Testbody2");
		message2.setSubject("Testsubject2");
		message2.setReceiver(user1);
		message2.setSender(user2);
	}

	@After
	public void tearDown() throws Exception {
		
		
	}

	@Test
	public void testSaveMessage() {
		List<PrivateMessage> first = PrivateMessageDAO.getPrivateMessageDAO().getPrivateMessageList();
		PrivateMessageDAO.getPrivateMessageDAO().savePrivateMessage(message1);
		List<PrivateMessage> second = PrivateMessageDAO.getPrivateMessageDAO().getPrivateMessageList();
		assertFalse("Listen sollten nicht gleich sein!", first.equals(second));
		
	}
	
	@Test
	public void testDeleteMessage() {
		
		PrivateMessageDAO.getPrivateMessageDAO().savePrivateMessage(message1);
		PrivateMessageDAO.getPrivateMessageDAO().savePrivateMessage(message2);
		PrivateMessageDAO.getPrivateMessageDAO().deletePrivateMessage(message1);
		PrivateMessageDAO.getPrivateMessageDAO().deletePrivateMessage(message2);
		List<PrivateMessage> second = PrivateMessageDAO.getPrivateMessageDAO().getPrivateMessageList();
		
		assertFalse("message1 und message2 sollten nicht in den Listen sein!", second.contains(message1)&&second.contains(message2));
	}

}
