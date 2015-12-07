package com.seeyoui.kensite.quartz;

import static org.quartz.JobBuilder.*; 
import static org.quartz.SimpleScheduleBuilder.*; 
import static org.quartz.CronScheduleBuilder.*; 
import static org.quartz.CalendarIntervalScheduleBuilder.*; 
import static org.quartz.TriggerBuilder.*; 
import static org.quartz.DateBuilder.*;
import static org.quartz.JobKey.*;
import static org.quartz.TriggerKey.*;

import java.text.ParseException;

import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class QuartzUtils {
	private static SchedulerFactory sf = new StdSchedulerFactory();
	private static String JOB_GROUP_NAME = "SYS_TASK_JOB";
	private static String TRIGGER_GROUP_NAME = "SYS_TASK_TRIGGER";
	
	private static Scheduler get() throws SchedulerException, ParseException {
		// the 'default' scheduler is defined in "quartz.properties" found
		// in the current working directory, in the classpath, or 
		// resorts to a fall-back default that is in the quartz.jar
		return sf.getScheduler();
	}
	
	public static void start() throws SchedulerException, ParseException {
		// Scheduler will not execute jobs until it has been started (though they 
		// can be scheduled before start())
		get().start();
	}
	
	public static void shutDown(boolean st) throws SchedulerException, ParseException {
		//true	shutdown() does not return until executing Jobs complete execution
		//false	shutdown() returns immediately, but executing Jobs continue running to completion
		get().shutdown(st);
	}
	
	public static void scheduleJob(String jobName, Class<? extends Job> job, String time) 
			throws SchedulerException, ParseException {
		// Define job instance
		JobDetail jobDetail = newJob(job).withIdentity(jobName, JOB_GROUP_NAME).build();
		// Define a Trigger that will fire "now", and not repeat
		CronTrigger trigger = newTrigger().withIdentity(jobName, TRIGGER_GROUP_NAME)
				.withSchedule(cronSchedule(time)).build();
		// Schedule the job with the trigger
		get().scheduleJob(jobDetail, trigger);
	}
	
	public static void unscheduleJob(String jobName) 
			throws SchedulerException, ParseException {
		// Unschedule a particular trigger from the job (a job may have more than one trigger)
		get().unscheduleJob(triggerKey(jobName, TRIGGER_GROUP_NAME));
	}
	
	public static void deleteJob(String jobName) 
			throws SchedulerException, ParseException {
		// Schedule the job with the trigger
		get().deleteJob(jobKey(jobName, JOB_GROUP_NAME));
	}
	
	public static void updateJob(String jobName, Class<? extends Job> job)
			throws SchedulerException, ParseException {
		// Add the new job to the scheduler, instructing it to "replace"
		// the existing job with the given name and group (if any)
		// durable
		JobDetail jobNew = newJob(job).withIdentity(jobName, JOB_GROUP_NAME).storeDurably(true).build();
		// store, and set overwrite flag to 'true'
		get().addJob(jobNew, true);
	}
	
	public static void updateTrigger(String jobName, String time)
			throws SchedulerException, ParseException {
		// retrieve the trigger 
		Trigger oldTrigger = get().getTrigger(triggerKey(jobName, TRIGGER_GROUP_NAME));
		// obtain a builder that would produce the trigger 
		TriggerBuilder tb = oldTrigger.getTriggerBuilder(); 
		// update the schedule associated with the builder, and build the new trigger 
		// (other builder methods could be called, to change the trigger in any desired way) 
		Trigger newTrigger = tb.withSchedule(cronSchedule(time)).build(); 
		get().rescheduleJob(oldTrigger.getKey(), newTrigger);
	}
}
