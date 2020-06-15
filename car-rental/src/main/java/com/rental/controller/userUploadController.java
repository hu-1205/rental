package com.rental.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rental.bean.Driver;
import com.rental.bean.Msg;
import com.rental.bean.User;
import com.rental.bean.sUser;
import com.rental.service.DriverService;
import com.rental.service.UserService;
import com.rental.service.sUserService;

@Controller
public class userUploadController {
	
	@Autowired
	DriverService driverService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	sUserService suserService;
	
	      
	@RequestMapping(value = "/Registered", method = RequestMethod.POST)
    @ResponseBody
    public Msg upload(@RequestParam("ps_file1") MultipartFile ps_file1,
    		@RequestParam("ps_file2") MultipartFile ps_file2,
    		@RequestParam("in_cname")String username ,
    		@RequestParam("in_password")String password,
    		@RequestParam("in_phone")String phone,     
    		@RequestParam("in_gender")Integer gender,
    		@RequestParam("in_age")Integer age
    		) {
		
        if (!ps_file1.isEmpty()&&!ps_file2.isEmpty()) {
            //获取文件上传路径    	
            String storePath = "E:\\javaProject\\car-rental\\src\\main\\webapp\\static\\drivers";            
            String fileName1 = ps_file1.getOriginalFilename();
            String fileName2 = ps_file2.getOriginalFilename();
            String[] split1 = fileName1.split(".jpg");
            String[] split2 = fileName2.split(".jpg"); 
            fileName1 = split1[0] + ".jpg";
            fileName2 = split2[0] + ".jpg";
            
            //插入driver 
            Driver driver = new Driver(username,fileName1,fileName2,"0");
            int insertDriver = driverService.insertDriver(driver);
            
            //插入用户
            User user = new User(username, password, phone, gender, age);
            int userInsert = userService.userInsert(user);
           
            
            //插入账户
            sUser suser = new sUser(username, password);
            int suserInsert = suserService.userInsert(suser);
            if(insertDriver==0) {
            	return Msg.fail();
            }
            
            File filePath1 = new File(storePath, fileName1);
            File filePath2 = new File(storePath, fileName2);
            if (!filePath1.getParentFile().exists()) {
                filePath1.getParentFile().mkdirs();// 如果目录不存在，则创建目录
            }
            
            
            try {
                ps_file1.transferTo(new File(storePath + File.separator + fileName1));// 把文件写入目标文件地址
                ps_file2.transferTo(new File(storePath + File.separator + fileName2));// 把文件写入目标文件地址
                
            } catch (Exception e) {
                e.printStackTrace();                
                return Msg.fail();                
            }
            return Msg.success();
        } else {
        	return Msg.success();   
        }
 
    }
	

}
