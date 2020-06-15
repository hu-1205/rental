package com.rental.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rental.bean.Car;
import com.rental.bean.Msg;
import com.rental.service.CarService;


@Controller
public class uploadController {
	
	@Autowired
	CarService carService;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Msg upload(@RequestParam("ps_file") MultipartFile ps_file,
    		@RequestParam("in_cname")String ps_name ,
    		@RequestParam("in_cride")Integer in_cride ,
    		@RequestParam("in_dayr")Integer in_dayr,     
    		@RequestParam("in_block")String in_block,
    		@RequestParam("in_remaining")Integer in_remaining,
    		@RequestParam("in_duration")Integer in_duration
    		) {
		
        if (!ps_file.isEmpty()) {
            //获取文件上传路径    	
            String storePath = "E:\\javaProject\\car-rental\\src\\main\\webapp\\static\\imgs";            
            String fileName = ps_file.getOriginalFilename();                        
            String[] split = fileName.split(".jpg");                       
            fileName = split[0] + ".jpg";
            
            //插入car          , , , 
            int insertCar = carService.insertCar(new Car(ps_name, in_cride, in_dayr, fileName, in_block, in_duration, in_remaining));
            if(insertCar==0) {
            	return Msg.fail();
            }
            
            File filePath = new File(storePath, fileName);           
            if (!filePath.getParentFile().exists()) {
                filePath.getParentFile().mkdirs();// 如果目录不存在，则创建目录
            }
            
            
            try {
                ps_file.transferTo(new File(storePath + File.separator + fileName));// 把文件写入目标文件地址
                
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
