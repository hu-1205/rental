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
import com.rental.bean.Administrator;
import com.rental.bean.Car;
import com.rental.bean.Deposit;
import com.rental.bean.Driver;
import com.rental.bean.Information;
import com.rental.bean.Msg;
import com.rental.bean.User;
import com.rental.bean.sUser;
import com.rental.service.AccountService;
import com.rental.service.AdministratorService;
import com.rental.service.CarService;
import com.rental.service.DepositService;
import com.rental.service.DriverService;
import com.rental.service.UserService;
import com.rental.service.sUserService;


@Controller
public class administratorConteoller {
	
	@Autowired
	sUserService suserService;
	
	@Autowired
	AdministratorService administratorService;
	
	@Autowired
	CarService carService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	DepositService depositService;
	
	@Autowired
	DriverService driverService;
	
	
	//验证管理员信息
	@ResponseBody
	@RequestMapping("/Verification")
	public Msg login(Information information) {
		
		Administrator selectAll = administratorService.selectAllByName(information.getUsername());
		if(selectAll==null) {
			return Msg.nameFail();
		}else if(selectAll.getPassword().equals(information.getPassword())) {
			return Msg.success();
		}else {
			return Msg.fail();
		}		
	}
	
		//管理员登录
		//车辆管理页面
		@RequestMapping("/CarManage")
		public String Admin(sUser suser,Model model) {
			//查询车辆信息
			List<Car> cars = carService.selectCar();
			model.addAttribute("carsJson",new Gson().toJson(cars));
			model.addAttribute("cars",cars);
			model.addAttribute("suser",suser);
			return "CarManage";
		}
		//用户管理UserManage.jsp
		@RequestMapping("/UserManage")
		public String UserManage(sUser suser,Model model) {
			//查询所有用户信息
			List<User> users = userService.selectAllUser();
			model.addAttribute("users",users);
			model.addAttribute("suser",suser);
			return "UserManage";
		}
		//审核管理AuditManage.jsp
		@RequestMapping("/AuditManage")
		public String AuditManage(sUser suser,Model model) {
			model.addAttribute("suser",suser);
			//查询所有待审核的订单
			List<Account> accounts = accountService.selevtAccountByStatus("2");
			model.addAttribute("account",accounts);
			return "AuditManage";
		}
		
		//充值审核DepositManage
		@RequestMapping("/DepositManage")
		public String DepositManage(sUser suser,Model model) {
			model.addAttribute("suser",suser);
			List<Deposit> deposits = depositService.selectAllDeposit();
			
			model.addAttribute("deposits",deposits);
			return "DepositManage";
		}
		
		//审核驾驶证管理userAuditManage.jsp
		@RequestMapping("/userAuditManage")
		public String userAuditManage(sUser suser,Model model) {
			model.addAttribute("suser",suser);
			//查询所有待审核的订单
			List<Driver> selectAll = driverService.selectAll();	
			model.addAttribute("drivers",selectAll);
			return "userAuditManage";
		}
		
		
		
		//删除车辆
		@ResponseBody
		@RequestMapping(value="/deleteCar",method=RequestMethod.POST)
		public Msg deleteCar(@RequestParam("cid")int cid) {
			
			int d = carService.deleteCarById(cid);		
			return Msg.success();
			
			
		}
		
		//通过审核
		@ResponseBody
		@RequestMapping(value="/Change",method=RequestMethod.POST)
		public Msg Change(@RequestParam("aid")int aid) {
			
			//查出账单
			Account account = accountService.selectAccountById(aid);
			Car car = carService.selectByName(account.getCname());
			carService.updateRemaining(car.getCid(), car.getRemaining()+1);
			int d = accountService.changeAudit(aid,"1");
			
			return Msg.success();
						
		}
		//审核驾照通过
		@ResponseBody
		@RequestMapping(value="/changeDriver")
		public Msg changeDriver(@RequestParam("name")String name) {
			
			driverService.updateFlag(name);
			
			return Msg.success();
						
		}
		
		@ResponseBody
		@RequestMapping(value="/changeBohui")
		public Msg changeBohui(@RequestParam("name")String name) {
			
			driverService.updateFlagB(name);
			
			return Msg.success();
						
		}
		
		
		
		//删除用户
		@ResponseBody
		@RequestMapping(value="/DeleteUser",method=RequestMethod.POST)
		public Msg DeleteUser(@RequestParam("id")int id,@RequestParam("username")String username) {
			User user = userService.searchUser(id);
			int deleteUser = userService.DeleteUser(id);
			//删除充值记录
			depositService.deleteName(user.getUsername());
			//删除审核记录
			accountService.deleteName(user.getUsername());
			suserService.deletesUser(username);
			return Msg.success();
						
		}
		
		//查询用户
		@ResponseBody
		@RequestMapping("/searchUser")
		public Msg searchUser(@RequestParam("id")int id) {
			
			User user = userService.searchUser(id);
			return Msg.success().add("user", user);
						
		}
		
		//修改用户updateUser
		@ResponseBody
		@RequestMapping("/updateUser")
		public Msg updateUser(User user) {
			//修改用户信息
			int updateUser = userService.updateUser(user);
			//修改用户密码
			suserService.updatesUser(new sUser(user.getUsername(),user.getPassword()));
			return Msg.success();
						
		}
		
		
		//调取资金待审核事件
		@ResponseBody
		@RequestMapping("/Checkfunds")
		public Msg Checkfunds(User user) {
			//修改用户信息
			int updateUser = userService.updateUser(user);
			//修改用户密码
			suserService.updatesUser(new sUser(user.getUsername(),user.getPassword()));
			return Msg.success();
						
		}
		
		
		
		//审核资金
		@ResponseBody
		@RequestMapping("/By")
		public Msg By(int xid) {
			//查询待审核信息
			Deposit deposit = depositService.selectDeposit(xid);
			sUser suser = suserService.selectByName(deposit.getUsername());
			 
			//0，资金充值；1，退出资金；2，押金充值；3，退出押金
			if(deposit.getFlag()==0) {
				//0，资金充值
				int money = suser.getMoney()+deposit.getMoney();
				suserService.updatesUserMoney(deposit.getUsername(),money);
				depositService.updateFlage(xid,4);
			}else if(deposit.getFlag()==1) {
				//1，退出资金；
				int money = suser.getMoney()-deposit.getMoney();
				suserService.updatesUserMoney(deposit.getUsername(),money);
				depositService.updateFlage(xid,4);
			}else if(deposit.getFlag()==2) {
				//2，押金充值；
				suserService.updatesUserDeposit(500, suser.getUsername());
				depositService.updateFlage(xid,4);
			}else {
				//3，退出押金;
				suserService.updatesUserDeposit(0, suser.getUsername());
				depositService.updateFlage(xid,4);
			}
			return Msg.success();
						
		}	
		//资金驳回
		@ResponseBody
		@RequestMapping("/turnDown")
		public Msg turnDown(int xid) {
			depositService.updateFlage(xid,5);
			return Msg.success();
		}
		
		
		
		
}
