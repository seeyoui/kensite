package com.seeyoui.kensite.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class QuartzManager {
	public static void main(String[] args) throws Exception {
		Class<? extends Job> job1 = (Class<? extends Job>) Class.forName("com.seeyoui.kensite.quartz.Job1");
		Class<? extends Job> job2 = (Class<? extends Job>) Class.forName("com.seeyoui.kensite.quartz.Job2");
		Class<? extends Job> job3 = (Class<? extends Job>) Class.forName("com.seeyoui.kensite.quartz.Job3");
		String job_name = "测试计划";
		System.out.println("【系统启动】");
		QuartzUtils.start();
		System.out.println("【加入JOB】");
		QuartzUtils.scheduleJob(job_name, job1, "0/2 * * * * ?"); // 每2秒钟执行一次
		Thread.sleep(10000); 
		System.out.println("【加入JOB1】");
		QuartzUtils.scheduleJob(job_name+"2", job2, "0/2 * * * * ?"); // 每2秒钟执行一次
		Thread.sleep(10000); 
		System.out.println("【修改JOB为JOB3】");
		QuartzUtils.updateJob(job_name, job3);
		Thread.sleep(10000); 
		System.out.println("【修改时间】");
		QuartzUtils.updateTrigger(job_name, "0/5 * * * * ?");// 每5秒钟执行一次
		QuartzUtils.updateTrigger(job_name+"2", "0/5 * * * * ?");// 每5秒钟执行一次
		Thread.sleep(10000); 
		System.out.println("【移除JOB】");
		QuartzUtils.deleteJob(job_name);
		Thread.sleep(10000);
		System.out.println("【移除】");
		QuartzUtils.shutDown(true);
		Thread.sleep(5000);
	}
}