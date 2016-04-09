package photoshare;

import org.apache.commons.io.output.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

public class TagBean {
	private String word;

	public void setTag(String word) {
		this.word = word;
	}

	public String getTag() {
		return tag;
	}
}