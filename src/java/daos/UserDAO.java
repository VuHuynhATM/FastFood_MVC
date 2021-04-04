/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

/**
 *
 * @author tuanv
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String url = "SELECT a.userID,a.fullName,a.password,a.phone,a.email,a.address,b.roleName\n"
                    + "FROM tblUser a JOIN tblRole b ON a.roleID=b.roleID\n"
                    + "WHERE a.userID=? AND a.password=?";
            pst = conn.prepareStatement(url);
            pst.setString(1, userID);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new UserDTO();
                user.setUserID(userID);
                user.setPassword(password);
                user.setFullName(rs.getString("fullName"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("roleName"));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public void create(UserDTO user) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO [dbo].[tblUser](userID,fullName,password,email,address,phone,roleID)\n"
                    + "VALUES(?,?,?,?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, user.getUserID());
            stm.setString(2, user.getFullName());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setString(6, user.getPhone());
            stm.setString(7, "1");
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean checkUserGmail(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT userID\n"
                        + "FROM tblUser a\n"
                        + "WHERE a.userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);;
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
