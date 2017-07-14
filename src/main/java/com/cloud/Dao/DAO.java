package com.cloud.Dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.cloud.Model.FileOb;
import com.cloud.Model.User;
import java.io.IOException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.NoSuchPaddingException;
import javax.sql.RowSet;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.apache.commons.lang3.StringUtils;

public class DAO {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Boolean register(final User e) {
        String query = "insert into register2 values(?,?,?,?,?,?,?,?,?,?,?)";
        return jdbcTemplate.execute(query, new PreparedStatementCallback<Boolean>() {
            @Override
            public Boolean doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException {

                try {
                    ps.setString(1, e.getName().replace(",",""));
                    ps.setString(2, e.getAge());
                    ps.setString(3, e.getQualification());
                    ps.setString(4, e.getDob());
                    ps.setString(5, e.getGender());
                    ps.setString(6, e.getAddress());
                    ps.setString(7, e.getMobile());
                    ps.setString(8, e.getReligion());
                    ps.setString(9, e.getNationality());
                    ps.setString(10,e.getEmail());
                    ps.setString(11, e.getName().replace(",","") + "File");

                } catch (Exception ex) {
                    Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
                }

                return ps.execute();
            }
        });

    }

    
    public JSONObject Retrieve() throws Exception {
        boolean login;
  
        String query = "SELECT * FROM register2";
      
        
        return jdbcTemplate.query(query, new ResultSetExtractor<JSONObject>() {

            @Override

            public JSONObject extractData(ResultSet rs) throws SQLException, DataAccessException {
                 
                String user = null;
                String age = null;
                String qualification = null;
                String dob = null;
                String gender = null;
                String address = null;
                String mobile = null;
                String religion = null;
                String nationality = null;
                String email = null;
                String fileId = null;
                
                JSONObject o = new JSONObject();
               
                        
                int count = 0;
                while (rs.next()) {

                    user = rs.getString("user");
                    age = rs.getString("age");
                    qualification = rs.getString("qualification");
                    dob = rs.getString("dob");
                    gender = rs.getString("gender");
                    address = rs.getString("address");
                    mobile = rs.getString("mobile");
                    religion = rs.getString("religion");
                    nationality = rs.getString("nationality");
                    email = rs.getString("email");
                    fileId = rs.getString("fileId");
                    
                    o.put("name", user);
                    o.put("age",age);
                    o.put("qualification", qualification);
                    o.put("dob",dob);
                    o.put("gender",gender);
                    o.put("address",address);
                    o.put("mobile",mobile);
                    o.put("religion",religion);
                    o.put("nationality", nationality);
                    o.put("email",email);
                    o.put("fileId",fileId);

                }

                return o;
            }
        });

    }


    public String querystatus() throws SQLException {

        String query = "SELECT * FROM status";
        System.out.println("query = " + query);

        return jdbcTemplate.query(query, new ResultSetExtractor<String>() {

            @Override

            public String extractData(ResultSet rs) throws SQLException, DataAccessException {
                String file = null;

                ArrayList<FileOb> fileList = new ArrayList<FileOb>();
                while (rs.next()) {
                    file = rs.getString("s");

                }
                return file;
            }
        });
    }
}
