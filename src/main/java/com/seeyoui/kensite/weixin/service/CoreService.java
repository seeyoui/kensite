package com.seeyoui.kensite.weixin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.bpmn.model.Activity;

import com.seeyoui.kensite.weixin.constants.WXConstants;
import com.seeyoui.kensite.weixin.message.resp.WXArticleResp;
import com.seeyoui.kensite.weixin.message.resp.WXNewsMessageResp;
import com.seeyoui.kensite.weixin.message.resp.WXTextMessageResp;
import com.seeyoui.kensite.weixin.util.MessageUtil;

/**
 * 核心服务类
 * 
 */
public class CoreService {

	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		String url = request.getContextPath();
		try {
			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");

			// 默认返回的文本消息内容
			String respContent = "请求处理异常，请稍候尝试！";

			// 默认回复此文本消息
			WXTextMessageResp textMessage = new WXTextMessageResp();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			// 由于href属性值必须用双引号引起，这与字符串本身的双引号冲突，所以要转义
			// textMessage.setContent("欢迎访问<a href=\""+StringConstant.WEB_URL+"/microShop/index.do\">微商城</a>!");
			textMessage.setContent("欢迎欢迎，热烈欢迎！！！");
			// 将文本消息对象转换成xml字符串
			respMessage = MessageUtil.messageToXml(textMessage);

			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				// 接收用户发送的文本消息内容
				String content = requestMap.get("Content");
				if ("1".equals(content)) {
					// 创建图文消息
					WXNewsMessageResp newsMessage = new WXNewsMessageResp();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage .setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setFuncFlag(0);
					List<WXArticleResp> articleList = new ArrayList<WXArticleResp>();
					for (int i=0; i<3; i++) {
						WXArticleResp article = new WXArticleResp();
						article.setTitle("[活动]"+i);
						article.setDescription("这是活动描述");
						article.setPicUrl("https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31va0VxKrnKt6jgJV0lXPicDReRNujpZcTjhIrER92pAnJ44ADEAkET3YuA/0");
						article.setUrl("");
						articleList.add(article);
					}
					// 设置图文消息个数
					newsMessage.setArticleCount(articleList.size());
					// 设置图文消息包含的图文集合
					newsMessage.setArticles(articleList);
					// 将图文消息对象转换成xml字符串
					respMessage = MessageUtil.messageToXml(newsMessage);
				} else if("0".equals(content)) {
					String html = "<a href=\"http://42.96.206.93/park/weixin.jsp\">瞅瞅</a>";
					textMessage.setContent(html);
					respMessage = MessageUtil.messageToXml(textMessage);
				} else {
					textMessage.setContent("你想说什么" + content);
					respMessage = MessageUtil.messageToXml(textMessage);
				}
			}
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				respContent = "您发送的是图片消息！";
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				respContent = "您发送的是地理位置消息！";
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				respContent = "您发送的是链接消息！";
			}
			// 音频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				respContent = "您发送的是音频消息！";
			}
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					// <a
					// href='http://61.177.151.154/menshine/microShop/guest/bindAccount.do?openid="+fromUserName+"'>绑定车辆</a>
					respContent = getMainMenu();
					textMessage.setContent(respContent);
					respMessage = MessageUtil.messageToXml(textMessage);
				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					 // 事件KEY值，与创建自定义菜单时指定的KEY值对应
					 String eventKey = requestMap.get("EventKey");
					 if(eventKey.equals("lock_car")) {
						 
					 }
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return respMessage;
	}

	/**
	 * emoji表情转换(hex -> utf-16)
	 * 
	 * @param hexEmoji
	 * @return
	 */
	public static String emoji(int hexEmoji) {
		return String.valueOf(Character.toChars(hexEmoji));
	}

	// public static ActivityService getActivityService() {
	// if (activityService == null){
	// activityService = SpringContextHolder.getBean(ActivityService.class);
	// }
	// return activityService;
	// }

	/**
	 * 主菜单
	 * 
	 * @return
	 */
	public static String getMainMenu() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("您好，请回复数字选择服务：").append("\n\n");
		buffer.append("1  /礼物商城活动").append("\n");
		buffer.append("2  /玫瑰会员等级").append("\n");
		buffer.append("3  /爱心会员积分").append("\n");
		buffer.append("4  /握手账号绑定").append("\n\n");
		buffer.append("回复“?”显示此帮助菜单");
		return buffer.toString();
	}
}