package photoshare;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class NewUserBean {
  private String email = "";
  private String password1 = "";
  private String password2 = "";
  private String dob = "";
  private String firstname = "";
  private String lastname = "";
  private String gender = "";
  private String hometown = "";

  public String saySomething() {
    System.out.println("Hello!");
    return "Test";
  }
  
  public String getEmail() {
    return email;
  }

  public String getPassword1() {
    return password1;
  }

  public String getPassword2() {
    return password2;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setPassword1(String password1) {
    this.password1 = password1;
  }

  public void setPassword2(String password2) {
    this.password2 = password2;
  }

  public String getdob() {
    return dob;
  }

  public void setdOb(String dob) {
    this.dob = dob;
  }

  public String getFirstName() {
    return firstname;
  }

  public void setFirstName(String firstname) {
    this.firstname = firstname;
  }

  public String getLastName() {
    return lastname;
  }

  public void setLastName(String lastname) {
    this.lastname = lastname;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getHometown() {
    return hometown;
  }

  public void setHometown(String hometown) {
    this.hometown = hometown;
  }
}