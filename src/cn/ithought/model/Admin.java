package cn.ithought.model;

import java.security.NoSuchAlgorithmException;

import com.jfinal.plugin.activerecord.Model;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
public class Admin extends Model<Admin> {

    private static final long serialVersionUID = 1L;

    public static final Admin DAO = new Admin();

    private static final String TABLE = "t_admin";

    public boolean login(String name, String pass) {
        return DAO.findFirst("select * from " + TABLE
                + " where name=? and pass=?", name, getMD5(pass.getBytes())) != null;
    }

    public static String getMD5(byte[] src) {
        StringBuffer sb = new StringBuffer();
        try {
            java.security.MessageDigest md = java.security.MessageDigest
                    .getInstance("MD5");
            md.update(src);
            for (byte b : md.digest())
                sb.append(Integer.toString(b >>> 4 & 0xF, 16)).append(
                        Integer.toString(b & 0xF, 16));
        } catch (NoSuchAlgorithmException e) {
        }
        return sb.toString();
    }
}
