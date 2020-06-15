package com.rental.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.rental.bean.Account;
import com.rental.bean.Car;
import com.rental.bean.Deposit;
import com.rental.bean.Msg;
import com.rental.bean.RenewalDt;
import com.rental.bean.UMoney;
import com.rental.bean.Uaudit;
import com.rental.bean.sUser;
import com.rental.bean.Iday;

import com.rental.service.AccountService;
import com.rental.service.CarService;
import com.rental.service.DepositService;
import com.rental.service.UMoneyService;
import com.rental.service.UauditService;
import com.rental.service.sUserService;
import com.rental.util.CalculationDays;

@Controller
public class accountController {
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	CarService carService;
	
	@Autowired
	UMoneyService uMoneyService;
	
	@Autowired
	UauditService uauditService;
	
	@Autowired
	DepositService depositService;
	
	@Autowired
	sUserService suserService;
	

	
	@ResponseBody
	@RequestMapping("/selectNA")
	public Msg SlectAccount(@RequestParam("username") String username) {
	    List<Account> ass =  accountService.byNameAccount(username);
		return Msg.success().add("account",ass);
	}
	
	@ResponseBody
	@RequestMapping(value="/Iday",method=RequestMethod.POST)
	public Msg Iday(Iday iday, HttpSession session) {
		
		//查询账户余额
		sUser suser = suserService.selectByName(iday.getUsername());				
		//计算获取天数
		CalculationDays calculationDays = new CalculationDays();
		int day = calculationDays.CalculationDay(iday.getStarttime(), iday.getEndtime());
		session.setAttribute("iday", iday);
		//获取表单信息
		int cid = iday.getCid();
		String username = iday.getUsername();
		//根据id获取车辆信息
		Car car = carService.selectById(cid);
		//获取每日租金
		int dayr = car.getDayr();
		int money = dayr*day;
		
		if(suser.getMoney()>money) {
			carService.updateRemaining(car.getCid(),car.getRemaining()-1);
			uauditService.insertUaudit(new Uaudit(username, cid,car.getCname(),iday.getStarttime(),iday.getEndtime() , day, money));
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
		
	}
	
	
	
	
	//实现续租天数,
	@ResponseBody
	@RequestMapping("/Renewal")
	public Msg Renewal(RenewalDt renewalDt) throws Exception{
		
		//修改结束时间，通过订单编号aid
		//修改余额,通过用户名
		Account account = accountService.selectAccountById(renewalDt.getAid());
		//对结束日期进行修改
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//对日期进行修改
			Date parse = sdf.parse(account.getEtime());			
			Calendar calendar = new GregorianCalendar(); 
		     calendar.setTime(parse); 
		     calendar.add(Calendar.DATE,renewalDt.getRday());//把日期往后增加一天.正数往后推,负数往前推 
		     parse=calendar.getTime();
		     String format = sdf.format(parse);
		     
		     //插入修改日期
		     accountService.updateDateByName(account.getAid(),format);
		     
		     //修改账户
		     //获取车辆每日租金
		     //获取天数
		     //修改金额
		     //插入修改金额
		      Car car = carService.selectByName(account.getCname());
		      //获取账户
		      sUser suser = suserService.selectByName(account.getSuser());
		      
		      //计算金额
		      int prise = car.getDayr()*renewalDt.getRday();
		      //计算剩余金额
		      int money = suser.getMoney()-prise;
		      //计算总的租用天数
		      int day = account.getRday()+renewalDt.getRday();
		      int smoney = account.getConsumption()+prise;
		      
		      //修改account
		      accountService.updateDM(renewalDt.getAid(),day,smoney);
		      
		      
		      //修改数据
		      suserService.updatesUserMoney(account.getSuser(), money);
		      return Msg.success();
		     
		
	}
	
	
	
	//修改订单状态
	@ResponseBody
	@RequestMapping(value="/Return",method=RequestMethod.POST)
	public Msg  Return(int aid) {
		int up = accountService.updateStatus(aid);
		if(up==1) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}
	
	//充值
		@ResponseBody
		@RequestMapping(value="/Topup",method=RequestMethod.POST)
		public Msg  Topup(UMoney uMoney) {
			//查询用户
			depositService.insertDeposit(new Deposit(uMoney.getUsername(), uMoney.getMoney(), 0));
			return Msg.success();
		}
	//退余额	
		@ResponseBody
		@RequestMapping(value="/Retreat",method=RequestMethod.POST)
		public Msg  Retreat(UMoney uMoney) {
			//查询用户
			depositService.insertDeposit(new Deposit(uMoney.getUsername(), uMoney.getMoney(), 1));
			return Msg.success();
		}
	//充押金
		@ResponseBody
		@RequestMapping(value="/Deposit",method=RequestMethod.POST)
		public Msg  Deposit(String username) {
			//查询用户
			depositService.insertDeposit(new Deposit(username, 500, 2));
			return Msg.success();
		}	
	//退押金
		@ResponseBody
		@RequestMapping(value="/Depositrefund",method=RequestMethod.POST)
		public Msg  Depositrefund(String username) {
			//查询用户
			depositService.insertDeposit(new Deposit(username, 500, 3));
			return Msg.success();
		}
}











