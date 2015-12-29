package com.seeyoui.kensite.dozer;

import org.dozer.DozerBeanMapperSingletonWrapper;
import org.dozer.Mapper;

public class Dozer {
	public static void main(String[] args) {
		Mapper mapper = DozerBeanMapperSingletonWrapper.getInstance();
		Student user = new Student();
		user.setName("adf");
		StudentVO user2 = mapper.map(user, StudentVO.class);
		System.out.println(user2.getName());
		//or
		//Mapper mapper = DozerBeanMapperSingletonWrapper.getInstance();
		//DestinationObject destObject = new DestinationObject();
		//mapper.map(sourceObject, destObject);
	}
}
