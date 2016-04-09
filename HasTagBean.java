package photoshare;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class HasTagBean {
  private int pictureidT;
  private String tag;
  
  public int getPictureId() {
    return pictureidT;
  }

  public String getTag() {
    return tag;
  }
  
  public void setPictureId(pictureidT) {
    this.pictureidT = pictureidT;
  }

   public void setTag(String tag) {
    this.tag = tag;
  }
}