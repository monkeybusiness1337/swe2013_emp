package model;

public class PrivateMessage {

	private Integer privateMessageId;
	private String sendDate;
	private String subject;
	private String body;
	private User sender;
	private User receiver;

	public PrivateMessage() {

	}

	public PrivateMessage(Integer privateMessageId, String sendDate,
			String subject, String body, User sender, User receiver) {
		this.privateMessageId = privateMessageId;
		this.sendDate = sendDate;
		this.subject = subject;
		this.body = body;
		this.sender = sender;
		this.receiver = receiver;
	}

	public Integer getPrivateMessageId() {
		return privateMessageId;
	}

	public void setPrivateMessageId(Integer privateMessageId) {
		this.privateMessageId = privateMessageId;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

}