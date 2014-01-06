package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Comment implements Serializable {

	private Integer commentId;
	private String commentBody;
	private String draftDate;
	private User autor;

	public Comment() {

	}

	public Comment(Integer commentId, String commentBody, String draftDate,
			User autor) {
		super();
		this.commentId = commentId;
		this.commentBody = commentBody;
		this.draftDate = draftDate;
		this.autor = autor;
	}

	public Integer getCommentId() {
		return commentId;
	}
	
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getCommentBody() {
		return commentBody;
	}

	public void setCommentBody(String commentBody) {
		this.commentBody = commentBody;
	}

	public String getDraftDate() {
		return draftDate;
	}

	public void setDraftDate(String draftDate) {
		this.draftDate = draftDate;
	}

	public User getAutor() {
		return autor;
	}

	public String getAutorName() {
		return autor.getUserName();
	}
	
	public void setAutor(User autor) {
		this.autor = autor;
	}

}