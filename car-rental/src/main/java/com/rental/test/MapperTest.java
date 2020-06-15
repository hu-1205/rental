package com.rental.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rental.bean.Account;
import com.rental.bean.User;
import com.rental.bean.sUser;
import com.rental.dao.AccountMapper;
import com.rental.dao.UserMapper;
import com.rental.dao.sUserMapper;


/*
 * 测试dao层工作
 * 推荐spring的项目就可以使用Spring的单元测试，可以自动注入需要的组件
 * 1,导入SpringTest模块
 * 2，@ContextConfiguration指定Spring配置文件的位置
 * 3,所有的test运行的时候都是SpringJUnit4ClassRunner支持运行的
 * 4,直接autowired要使用的组件即可
 * */
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	sUserMapper suserMapper;
	
	@Autowired
	AccountMapper accountMapper;
	
	@Autowired
	SqlSession sqlSession;
	@Test
	public void CRUDTest() {
//		//1,创建IOC容器
//		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//		
//		//2,从容器里头获取mapper
//		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
		//System.out.println(departmentMapper);
		
//		//1.插入几个部门
//		Department department = new Department(104,"销售部");
//		int insertSelective = departmentMapper.insertSelective(department);
//		System.out.println(insertSelective);
		//插入员工
//		int insertSelective2 = employeeMapper.insertSelective(new Employee(6,"张三","m","2343asd",105));
//		System.out.println(insertSelective2);
//		int updateByPrimaryKey = employeeMapper.updateByPrimaryKey(new Employee(6,"李四","m","234534asd",105));
//		System.out.println(updateByPrimaryKey);
		
		//批量插入
		AccountMapper mapper3 = sqlSession.getMapper(AccountMapper.class);
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		sUserMapper mapper2 = sqlSession.getMapper(sUserMapper.class);
		for(int i = 0;i<10;i++) {
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = simpleDate.format(new Date());
			String substring = UUID.randomUUID().toString().substring(0,4);
			mapper3.insert(new Account("admin","大众",2,500,format));
		}
		
		
		//sUser selectByName = mapper2.selectByPrimaryKey(username)
		System.out.println("插入成功！");
		 //List<Employee> selectByExampleWithDept = employeeMapper.selectByExampleWithDept(null);
		//Employee ByPrimaryKey = mapper.selectByPrimaryKeyWithDept(1);
//		Department department = new Department(105,"开发部");
//		Employee employee = new Employee(33,"ss","g","@qq.com",105,department);
		//for(Employee e:selectByExampleWithDept) {
		//	 System.out.println(e);
		//}
		
		
	}
}
