package photoshare;

import org.apache.commons.io.output.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

public class NewComment {
	private int commentid;
	private int userid;
	private String date;
	private String text;

	public int getCommentId() {
		return commentid;
	}

	public int getUserId() {
		return userid;
	}

	public String getDate() {
		return date;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setUserId(int userid) {
		this.userid = userid;
	}

	public void setCommentId (int commentid) {
		this.commentid = commentid;
	}
}