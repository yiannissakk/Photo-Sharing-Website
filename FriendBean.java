package photoshare;

import org.apache.commons.io.output.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

public class NewFriend{
	private int userid1;
	private int userid2;

	public void setuserid1(int userid1) {
		this.userid1 = userid1;
	}

	public int getuserid1() {
		return userid1;
	}

	public void setuserid2(int userid2) {
		this.userid2 = userid2;
	}

	public int getuserid2() {
		return userid2;
	}
}