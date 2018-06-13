package meiHu.entity;

import java.util.Date;

public class ForumUser {
    private Integer uid;

    private String uname;

    private String password;

    private String tel;

    private String email;

    private String sex;

    private Integer point;

    private ForumTitle title ;

    private String headpic;

    private Date registertime;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public ForumTitle getTitle() {
        return title;
    }

    public void setTitle(ForumTitle title) {
        this.title = title;
    }

    public String getHeadpic() {
        return headpic;
    }

    public void setHeadpic(String headpic) {
        this.headpic = headpic == null ? null : headpic.trim();
    }

    public Date getRegistertime() {
        return registertime;
    }

    public void setRegistertime(Date registertime) {
        this.registertime = registertime;
    }

    public ForumUser(Integer uid, String uname, String password) {
        this.uid = uid;
        this.uname = uname;
        this.password = password;
    }

   public ForumUser() {
    }

    public ForumUser(Integer uid, String uname, String password, String tel, String email, String sex, Integer point, ForumTitle title, String headpic, Date registertime) {
        this.uid = uid;
        this.uname = uname;
        this.password = password;
        this.tel = tel;
        this.email = email;
        this.sex = sex;
        this.point = point;
        this.title = title;
        this.headpic = headpic;
        this.registertime = registertime;
    }

    @Override
    public String toString() {
        return "ForumUser{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", point=" + point +
                ", title=" + title +
                ", headpic='" + headpic + '\'' +
                ", registertime=" + registertime +
                '}';
    }
}