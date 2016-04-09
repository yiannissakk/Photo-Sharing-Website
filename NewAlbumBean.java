package photoshare;

import org.apache.commons.io.output.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

public class NewAlbum{
	private int albumid;
	private String name;
	private int user_id;
	private String dateofcreation;

	public void setAlbumId(int albumid) {
		this.albumid = albumid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUserId(int user_id) {
		this.user_id = user_id;
	}

	public void setDateOfCreation(int dateofcreation) {
		this.dateofcreation = dateofcreation;
	}

	public int getAlbumId() {
		return albumid;
	}

	public String getName() {
		return name;
	}

	public int getUserID() {
		return user_id;
	}

	public String getDateOfCreation() {
		return dateofcreation;
	}
}