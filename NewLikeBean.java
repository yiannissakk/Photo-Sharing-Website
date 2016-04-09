package photoshare;

import org.apache.commons.io.output.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

public class NewLikeBean{
	private int useridL;
	private int pictureidL;

	public void setuseridL(int useridL) {
		this.useridL = useridL;
	}

	public int getuseridL() {
		return useridL;
	}

	public void setpictureidL(int pictureidL) {
		this.pictureidL = pictureidL;
	}

	public int getpictureidL() {
		return pictureidL;
	}
}