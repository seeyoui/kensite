package com.seeyoui.kensite.weixin.main;

import java.net.URLEncoder;

import com.seeyoui.kensite.weixin.constants.WXConstants;
import com.seeyoui.kensite.weixin.pojo.WXAccessToken;
import com.seeyoui.kensite.weixin.pojo.WXButton;
import com.seeyoui.kensite.weixin.pojo.WXCommonButton;
import com.seeyoui.kensite.weixin.pojo.WXComplexButton;
import com.seeyoui.kensite.weixin.pojo.WXMenu;
import com.seeyoui.kensite.weixin.pojo.WXViewButton;
import com.seeyoui.kensite.weixin.util.WeixinUtil;

/**
 * 菜单管理器类
 * 
 * @author liufeng
 * @date 2013-08-08
 */
public class MenuManager {
	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = WXConstants.APPID;
		// 第三方用户唯一凭证密钥
		String appSecret = WXConstants.SECRET;

		// 调用接口获取access_token
		WXAccessToken at = WeixinUtil.getAccessToken(appId, appSecret);

		if (null != at) {
			// 调用接口创建菜单
			int result = WeixinUtil.createMenu(getMenu(), at.getToken());

			// 判断菜单创建结果
			if (0 == result)
				System.out.println("菜单创建成功！");
			else
				System.out.println("菜单创建失败，错误码：" + result);
		}
	}

	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	private static WXMenu getMenu() {
		String url = "http://42.96.206.93/park/";
		String web_name = "";
		WXCommonButton btn11 = new WXCommonButton();
		btn11.setName("报警设置");
		btn11.setType("click");
		btn11.setKey("warn_set");
		
		WXViewButton btn12 = new WXViewButton();
		btn12.setName("当前位置");
		btn12.setType("view");
		String main_url12 = URLEncoder.encode(url);
		String sub_url12 = URLEncoder.encode(web_name+"/microShop/weixin/carLocation.do");
		btn12.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url12+"&response_type=code&scope=snsapi_base&state="+sub_url12+"#wechat_redirect");

		WXCommonButton btn13 = new WXCommonButton();
		btn13.setName("远程锁车");
		btn13.setType("click");
		btn13.setKey("lock_car");
		
		WXCommonButton btn14 = new WXCommonButton();
		btn14.setName("远程解锁");
		btn14.setType("click");
		btn14.setKey("unlock_car");
		
		WXViewButton btn21 = new WXViewButton();
		btn21.setName("官方商城");
		btn21.setType("view");
		String main_url21 = URLEncoder.encode(url);
		String sub_url21 = URLEncoder.encode(web_name+"/microShop/guest/index.do");
		btn21.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url21+"&response_type=code&scope=snsapi_base&state="+sub_url21+"#wechat_redirect");

//		ViewButton btn22 = new ViewButton();
//		btn22.setName("热门活动");
//		btn22.setType("view");
//		String main_url22 = URLEncoder.encode(url);
//		String sub_url22 = URLEncoder.encode(web_name+"/microShop/guest/milkList.do?id=1c8b82ef1cfd4be9bcb94a9982119901");
//		btn22.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url22+"&response_type=code&scope=snsapi_base&state="+sub_url22+"#wechat_redirect");
		WXCommonButton btn22 = new WXCommonButton();
		btn22.setName("热门活动");
		btn22.setType("click");
		btn22.setKey("shop_activity");
		
		WXViewButton btn23 = new WXViewButton();
		btn23.setName("新品热卖");
		btn23.setType("view");
		String main_url23 = URLEncoder.encode(url);
		String sub_url23 = URLEncoder.encode(web_name+"/microShop/guest/hotGoodsList.do");
		btn23.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url23+"&response_type=code&scope=snsapi_base&state="+sub_url23+"#wechat_redirect");

		WXViewButton btn31 = new WXViewButton();
		btn31.setName("待支付订单");
		btn31.setType("view");
		String main_url31 = URLEncoder.encode(url);
		String sub_url31 = URLEncoder.encode("/microShop/unpayOrder.do?account=&payStatus=0&page=1&rows=100");
		btn31.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url31+"&response_type=code&scope=snsapi_base&state="+sub_url31+"#wechat_redirect");

		WXViewButton btn32 = new WXViewButton();
		btn32.setName("待收货订单");
		btn32.setType("view");
		String main_url32 = URLEncoder.encode(url);
		String sub_url32 = URLEncoder.encode("/microShop/unReceiveOrder.do?account=&payStatus=2&shippingStatus=0&page=1&rows=100");
		btn32.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url32+"&response_type=code&scope=snsapi_base&state="+sub_url32+"#wechat_redirect");

		WXViewButton btn33 = new WXViewButton();
		btn33.setName("已完成订单");
		btn33.setType("view");
		String main_url33 = URLEncoder.encode(url);
		String sub_url33 = URLEncoder.encode("/microShop/moreOrders.do?account=&page=1&rows=100&shippingStatus=2");
		btn33.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WXConstants.APPID+"&redirect_uri="+main_url33+"&response_type=code&scope=snsapi_base&state="+sub_url33+"#wechat_redirect");

		WXCommonButton btn34 = new WXCommonButton();
		btn34.setName("积分查询");
		btn34.setType("click");
		btn34.setKey("integral_query");
		
		WXCommonButton btn35 = new WXCommonButton();
		btn35.setName("售后服务");
		btn35.setType("click");
		btn35.setKey("after_service");
		
		WXComplexButton mainBtn1 = new WXComplexButton();
		mainBtn1.setName("我的爱车");
		mainBtn1.setSub_button(new WXButton[] {  btn12, btn13, btn14 });

		WXComplexButton mainBtn2 = new WXComplexButton();
		mainBtn2.setName("产品中心");
		mainBtn2.setSub_button(new WXButton[] { btn21, btn22, btn23 });

		WXComplexButton mainBtn3 = new WXComplexButton();
		mainBtn3.setName("会员中心");
		mainBtn3.setSub_button(new WXButton[] { btn31, btn32, btn33, btn34, btn35 });

		/**
		 * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br>
		 * 
		 * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br>
		 * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 });
		 */
		WXMenu menu = new WXMenu();
		menu.setButton(new WXButton[] { mainBtn1, mainBtn2, mainBtn3 });

		return menu;
	}
}