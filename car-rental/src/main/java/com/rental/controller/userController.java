package com.rental.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.rental.bean.Account;
import com.rental.bean.Car;
import com.rental.bean.Driver;
import com.rental.bean.Information;
import com.rental.bean.Msg;
import com.rental.bean.UMoney;
import com.rental.bean.Uaudit;
import com.rental.bean.User;
import com.rental.bean.sUser;
import com.rental.service.sUserService;
import com.rental.service.AccountService;
import com.rental.service.CarService;
import com.rental.service.DriverService;
import com.rental.service.UMoneyService;
import com.rental.service.UauditService;
import com.rental.service.UserService;



@Controller
public class userController {
	
	@Autowired
	UauditService uauditService;
	
	@Autowired
	sUserService suserService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	CarService carService;
	
	@Autowired
	UMoneyService uMoneyService;
	
	@Autowired
	DriverService driverService;
	
	
	
	@ResponseBody
	@RequestMapping("/login")
	public Msg login(Information information) {
		
		sUser suser = new sUser(information.getUsername(), information.getPassword());
		sUser psdTest = suserService.psdTest(suser.getUsername());
		if(psdTest==null) {
			return Msg.nameFail();
		}else if(psdTest.getPassword().equals(suser.getPassword())) {
			return Msg.success();
		}else {
			return Msg.fail();
		}		
	}
	
	@ResponseBody
	@RequestMapping("/countName")
	public Msg select(@RequestParam("username") String username) {
		
		int count = suserService.selectUsername(username);

		if(count==0) {
			return Msg.success();
		}else {
			return Msg.fail();
		}		
	}
	
	//修改密码changePassword
	@ResponseBody
	@RequestMapping("/changePassword")
	public Msg changePassword(@RequestParam("username") String username,@RequestParam("password") String password) {
		
		suserService.updatePassword(username,password);
		userService.updatePassword(username,password);
		return Msg.success();	
	}
	
	//登录
	@RequestMapping("/list")
	public String list(sUser suser,Model model) {
		List<Car> cars = carService.selectCar();
		model.addAttribute("cars",cars);
		model.addAttribute("suser",suser);
		return "index";
	}
	
	@RequestMapping("/Account")
	public String Account(sUser suser,Model model) {
		String username = suser.getUsername();
		sUser umoney = suserService.selectByName(username);
		List<Uaudit> uaudits = uauditService.selectByName(username);
		//查询驾照审核
		Driver driver = driverService.selectByName(username);
		model.addAttribute("driver",driver);
		model.addAttribute("uaudits",uaudits);
		model.addAttribute("suser",umoney);
		return "Account";
	}
	
	@RequestMapping("/Order")
	public String Order(sUser suser,Model model) {
		model.addAttribute("suser",suser);
		//查出押金和驾证审核
		sUser sUser2 = suserService.selectByName(suser.getUsername());
		model.addAttribute("sUser2",sUser2);
		Driver driver = driverService.selectByName(suser.getUsername());
		model.addAttribute("driver",driver);
		return "Order";
	}
	
	@RequestMapping("/Audit")
	public String Audit(sUser suser,Model model) {
		model.addAttribute("suser",suser);
		//根据名字查询待审核的订单
		List<Account> accounts = accountService.selevtAccountByName(suser.getUsername(),"2");

		model.addAttribute("account",accounts);
		return "Audit";
	}
	
	@RequestMapping("/Renew")
	public String Renew(sUser suser,Model model) {
		
		model.addAttribute("suser",suser);
		//根据名字查询正在租用的订单
		List<Account> accounts = accountService.selevtAccountByName(suser.getUsername(),"0");

		model.addAttribute("account",accounts);
		model.addAttribute("accountJson",new Gson().toJson(accounts));
		return "Renew";
	}
	
	
	//支付
	@ResponseBody
	@RequestMapping("/Pay")
	public Msg Pay(int zid) {
		//调出待支付订单
		Uaudit uaudit = uauditService.selectById(zid);
		//调出账户设置支付之后的余额
		sUser suser = suserService.selectByName(uaudit.getUsername());
		//调出车辆信息
		Car car = carService.selectById(uaudit.getCid());
		//计算余额
		int money = suser.getMoney()-uaudit.getDmoney();
		//修改用户余额
		suserService.updatesUserMoney(uaudit.getUsername(),money);
				
		//添加订单
		int insertAccont = accountService.insertAccont(
				new Account(suser.getUsername(), uaudit.getCname(), 
						    uaudit.getDay(), uaudit.getDmoney(), 
						    uaudit.getStarttime(), uaudit.getEndtime(),
						    "0", car.getImgadd()));
		
		
		//删除审核
		uauditService.deleteUauditById(zid);
		
		
		return Msg.success();
	}
	
	//注册页面
	@RequestMapping("/RegisteredJsp")
	public String Registered() {
		return "Registered";
	}
	
	//忘记密码
	@RequestMapping("/forgetPassword")
	public String forgetPassword() {
		return "forgetPassword";
	}
	
	
	
}
