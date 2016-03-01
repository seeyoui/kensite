<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Kensite开发平台</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
	<style type="text/css">
		.template-list li {
		    cursor: pointer;
		    margin: 3px 0;
		    padding: 10px;
		}
		li {
		    line-height: 20px;
		}
	</style>
</head>

<body>
	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;width:350px;bottom:0px;">
			<div class="easyui-tabs" style="width:350px;height:600px">
        		<div title="标题" style="padding:10px">
					<ul class="template-list">
						<li title="点击插入此内容">
							<section class="wwei-editor">
								<section style="border:none;margin: 5px;"> 
									<section style="color: rgb(70, 118, 217); text-align: center; margin: 0px auto -2px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(70, 118, 217); padding: 5px 5px 10px; border-top-width: 2px; border-top-style: solid;">
										<p tyle="text-align: center; border-color: rgb(70, 118, 217); color: inherit;">
											<span style="border-color: rgb(70, 118, 217); color: inherit; font-size: 18px;">请输入内容</span>
										</p>
									</section>
									<section style="width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: rgb(70, 118, 217); border-top-color: rgb(70, 118, 217); height: 10px; color: inherit; box-sizing: border-box; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important;"></section>
									<section style="width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: rgb(254, 254, 254); border-top-color: rgb(254, 254, 254); height: 10px; margin-top: -12px; color: inherit; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important;"></section>
								</section>
							</section>
						</li>
						<li title="点击插入此内容">
							<section class="wwei-editor" style="border: none;margin: 0">
								<section style="display: inline-block; vertical-align: bottom; width: 100%;">
									<section style="border-top-width: 1px; border-top-style: solid; border-color: rgb(110, 141, 187); width: 90%; float: left;"></section>
									<section style="width: 8px; height: 8px; margin-top: -4px; border-radius: 100%; float: left; color: rgb(255, 255, 255); background-color: rgb(110, 141, 187);"></section>
								</section>
								<section style="width: 2em; height: 2em; line-height: 2em; display: inline-block; vertical-align: top; margin: -1.2em 0px 0px; border: 1px solid rgb(110, 141, 187); border-radius: 100%; font-size: 1em; font-family: 'Microsoft YaHei'; font-style: normal; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); background-color: rgb(110, 141, 187);">1</section>
							</section>
						</li>
						<li title="点击插入此内容">
							<section class="wwei-editor">
								<section style="border: none; margin: 0.5em 0px; box-sizing: border-box; padding: 0px;">
								<section style="display: inline-block; vertical-align: top; font-size: 1.2em; font-family: inherit; font-weight: inherit; text-align: right; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(70, 118, 217); box-sizing: border-box;">
							<section
								style="display: inline-block; vertical-align: top; height: 2em; padding: 0px 0.5em; line-height: 2em; box-sizing: border-box; color: rgb(255, 255, 238); border-color: rgb(167, 185, 222); background-color: rgb(70, 118, 217);">
							<section
								style="box-sizing: border-box; border-color: rgb(70, 118, 217); color: inherit;">话题</section></section>
							<section
								style="display: inline-block; vertical-align: top; border-left-width: 0.5em; border-left-style: solid; border-top-width: 1em; border-top-style: solid; font-family: inherit; border-top-color: rgb(70, 118, 217); border-left-color: rgb(70, 118, 217); box-sizing: border-box; border-right-width: 0.5em !important; border-right-style: solid !important; border-right-color: transparent !important; border-bottom-width: 1em !important; border-bottom-style: solid !important; border-bottom-color: transparent !important; color: inherit;"></section></section>
							<section
								style="display: inline-block; line-height: 1.5em; padding: 0.3em; font-size: 1.2em; font-family: inherit; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; color: inherit;">
							<section style="box-sizing: border-box; color: inherit;">
							<p
								style="font-family: sans-serif; padding: 0px; margin: 0px; font-size: 16px; color: inherit;">微信营销怎么做？</p>
							</section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="white-space: normal; border-style: none none none solid; border-color: rgb(167, 185, 222); padding: 10px 2px; font-size: 14px; line-height: 20px; font-family: arial, helvetica, sans-serif; color: rgb(255, 255, 238); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; background-color: rgb(70, 118, 217);">
							<section
								style="display: inline-block; border-color: rgb(70, 118, 217); color: inherit;">
							<svg
								style="vertical-align: top; border-color: rgb(70, 118, 217); color: inherit;"
								viewBox="0 0 32 32" height="20" width="20" version="1.1"
								xmlns:xlink="http://www.w3.org/1999/xlink"
								xmlns="http://www.w3.org/2000/svg"> <path
								style="border-color: rgb(255, 255, 255); color: inherit;"
								d="M19.998 31.469v-4.209c4.648-1.651 7.996-6.044 7.996-11.26 0-5.214-3.348-9.608-7.996-11.26v-4.209c6.893 1.78 11.994 8.019 11.994 15.469s-5.101 13.69-11.994 15.469zM16 31.992l-7.996-7.996h-5.997c-1.105 0-1.999-0.894-1.999-1.999v-11.994c0-1.105 0.894-1.999 1.999-1.999h5.997l7.996-7.996c0 0 1.999-0.25 1.999 1.999 0 4.556 0 23.878 0 27.986 0 2.249-1.999 1.999-1.999 1.999zM14.001 8.004l-3.998 3.998h-5.997v7.996h5.997l3.998 3.998v-15.992zM25.995 16c0 3.721-2.553 6.821-5.997 7.713v-4.269c1.191-0.693 1.999-1.968 1.999-3.444s-0.808-2.751-1.999-3.444v-4.269c3.444 0.892 5.997 3.992 5.997 7.713z"
								fill="#fff" /></svg></section> <section
								style="padding: 0px; margin: 0px 0px 0px 5px; line-height: 20px; display: inline-block; vertical-align: top; border-color: rgb(70, 118, 217); color: inherit;">
							<p
								style="padding: 0px; margin: 0px; border-color: rgb(70, 118, 217); color: inherit;">公告：网站开通VIP享受更优质服务！</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="padding:2px 0 0 0;margin-top:10px;border-left:10px solid #333;">
							<p
								style="margin: 0; line-height: 30px; font-family: 'Microsoft Yahei'; font-size: 18px; padding-left: 20px; border-left: 2px solid #646464; border-bottom: 1px solid #ddd; margin-left: 6px;">请输入标题</p>
							</section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<blockquote
								style="white-space: normal; margin: 5px 0px 0px; padding: 10px; max-width: 100%; border-left-width: 5px; border-left-style: solid; border-left-color: #e21010; line-height: 25px; color: #666;">
								<p
									style="margin: 0; font-family: 'Microsoft Yahei'; font-size: 16px;">请输入标题</p>
							</blockquote>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								class="p_variable_border" style="border:0 none;"> <section
								style="border: none rgb(30, 155, 232); margin: 0.8em 5% 0.3em;">
							<section
								style="color: rgb(30, 155, 232); font-size: 20px; letter-spacing: 3px; padding: 9px 4px 14px; text-align: center; margin: 0px auto; border: 4px solid rgb(30, 155, 232); border-radius: 8px;">微信编辑器<br><p
									style="display: block; font-size: 10px; line-height: 12px; border-color: rgb(30, 155, 232); color: inherit; padding: 0; margin: 0; text-transform: uppercase;">wwei.cn</p>
							</section> <section
								style="width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: rgb(30, 155, 232); border-top-color: rgb(30, 155, 232); height: 10px; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important; color: inherit;"></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="-webkit-box-reflect:below 0px -webkit-gradient(linear, 0% 0%, 0% 100%, from(transparent), color-stop(0.2, transparent), to(rgba(250, 250, 250, 0.3))); margin-top:15px;line-height:20px;color:#334;">
							<section
								style="display: block; -webkit-margin-before: 1em; -webkit-margin-after: 1em; -webkit-margin-start: 0px; -webkit-margin-end: 0px; text-align: center;">
							<p style="padding: 0; margin: 0; font-family: '微软雅黑';">
								<span style="font-size: 30px;"><strong>倒影标题</strong></span>
							</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section
								style="outline: rgb(15, 174, 255) dotted 1px;"
								class="wwei-editor"> <section style="border:0 none;">
							<section
								style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(30, 155, 232);overflow: hidden;">
							<section
								style="display: inline-block; float: left; width: 32px; height: 32px; vertical-align: top; text-align: center; border-color: rgb(30, 155, 232); color: inherit;">
							<section
								style="display: table; width: 100%; color: inherit; border-color: rgb(30, 155, 232);">
							<section
								style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: rgb(255, 255, 255); border-color: rgb(30, 155, 232);">
							<span
								style="color: rgb(30, 155, 232); font-size: 50px; border-color: rgb(30, 155, 232);">2</span></section>
							<section
								style="width: 18px; height: 70px; margin-left: -8px; margin-top: 5px; border-left-width: 1px; border-left-style: solid; border-color: rgb(30, 155, 232); box-sizing: border-box; -webkit-transform: rotate(35deg); transform: rotate(35deg); color: inherit; background-color: rgb(254, 254, 254);"></section></section></section>
							<section
								style="margin-left: 40px; padding-top: 18px; font-style: normal; font-size: 30px; color: rgb(115, 115, 115); border-color: rgb(30, 155, 232);">
							<span style="color: inherit; font-size: 20px;">请输入标题</span></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="border: none; margin: 0.5em 0 1.5em"> <section
								style="width: 3em; margin: auto; font-size: 1em; font-family: inherit; font-style: normal; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(249, 110, 87); background-color: transparent;">
							<section
								style="width: 3em; height: 3em; display: inline-block; vertical-align: middle; line-height: 3.5em; white-space: nowrap; overflow: hidden; text-align: center; border-radius: 50%; font-family: inherit; font-style: normal; color: rgb(255, 255, 255); background-color: rgb(249, 110, 87);">标题</section>
							<section
								style="margin: -0.92em auto auto; width: 0px; border-top-width: 3em; border-top-style: solid; border-top-color: rgb(249, 110, 87); border-left-width: 1.4em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 1.4em !important; border-right-style: solid !important; border-right-color: transparent !important; font-family: inherit; font-style: normal; text-align: center; color: rgb(255, 255, 255); border-bottom-color: rgb(249, 110, 87);"></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="border: 0px; margin: 0.8em 0px 0.5em; text-align: center; clear: both; padding: 0px;">
							<section
								style="display: inline-block; padding: 0.2em 0.5em 0.15em; font-size: 2em; margin: 0 auto; text-align: center; border-left-width: 1px; border-left-style: solid; border-color: rgb(249, 110, 87); border-right-width: 1px; border-right-style: solid; font-family: inherit; font-style: normal; font-weight: bolder; text-decoration: inherit; color: rgb(249, 110, 87); background-color: rgba(255, 255, 255, 0.992157);">
							<section class="p_variable_color"
								style="font-size: 0.8em; line-height: 1em; vertical-align: top; font-family: inherit; font-style: normal; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(249, 110, 87);">
							<p style="margin: 0; padding: 0;">上方标题字多一点</p>
							</section> <section style="margin-top: 0.2em;line-height: 1"> <section
								style="display: inline-block; padding: 0 0.5em; font-weight: bolder; font-family: inherit; font-style: normal; text-align: center; background-color: rgba(255, 255, 254, 0.992157);">
							<p style="margin: 0; padding: 0;">主标题</p>
							</section> <section
								style="margin-top: -0.5em; margin-bottom: 0.5em; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(249, 110, 87);"></section></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="border: 0px; margin: 1em 0px 1.5em; clear: both; padding: 0px;">
							<section
								style="text-align: center; font-size: 1em; font-family: inherit; font-style: normal; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(35, 79, 147); background-color: transparent;">
							<section class="p_variable_border p_variable_bg"
								style="width: 2em; height: 2em; margin: 0 auto; border-radius: 100%; background-color: rgb(35, 79, 147);">
							<section
								style="display: inline-block; font-size: 1em; line-height: 2; font-family: inherit; font-style: normal; text-align: center; color: rgb(255, 255, 255);">
							<p style="margin: 0; padding: 0;">1</p>
							</section></section> <section style="margin-top: -1em; margin-bottom: 1em">
							<section
								style="border-top-width: 1px; border-top-style: solid; border-color: rgb(35, 79, 147); width: 35%; float: left;"></section>
							<section
								style="border-top-width: 1px; border-top-style: solid; border-color: rgb(35, 79, 147); width: 35%; float: right;"></section></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								class="p_variable_border"
								style="margin-top:2em; padding: 0.5em 0;white-space: normal;border: none;border-style: none;">
							<section class="p_variable_color"
								style="font-size: 18px; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(254, 254, 254);">
							<section
								style="display: inline-block;font-size: 1em;font-family: inherit;background-color: rgb(18, 36, 61);margin-top: 4px;height: 34px;float: left;line-height: 34px;padding: 0 1em;margin-left: 10px;">
							<section class="pBrush">标题</section></section> <section
								style="border-bottom: 2px solid rgb(110,109,123);height: 38px; font-size: 18px; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(254, 254, 254);"></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="border:0;padding:0;margin:0;-webkit-transform: skew(-20deg);text-align:center;">
							<section style="font-size: 1em; color: inherit;"> <section
								style="display: inline-block; color: rgb(255, 255, 238); border-color: rgb(170, 220, 246); background-color: rgb(58, 188, 255);">
							<section
								style="display: inline-block; padding: 0px 10px; border-color: rgb(58, 188, 255); color: inherit; background-color: rgba(255, 255, 255, 0.701961);">
							<section
								style="display: inline-block; color: inherit; border-color: rgb(170, 220, 246); background-color: rgb(58, 188, 255);">
							<section
								style="display: inline-block; padding: 0px 10px; border-color: rgb(58, 188, 255); color: inherit; background-color: rgba(255, 255, 255, 0.498039);">
							<section
								style="display: inline-block; color: inherit; border-color: rgb(170, 220, 246); background-color: rgb(58, 188, 255);">
							<section
								style="display: inline-block; padding: 0px 10px; border-color: rgb(58, 188, 255); color: inherit; background-color: rgba(255, 255, 255, 0.298039);">
							<section
								style="display: inline-block; color: inherit; border-color: rgb(170, 220, 246); background-color: rgb(58, 188, 255);">
							<h4 class="pBrush"
								style="-webkit-transform: skew(20deg); margin: 0px; padding: 10px; border-color: rgb(58, 188, 255); color: inherit;">超人气标题</h4>
							</section></section></section></section></section></section></section> <section
								style="border-top-width: 2px; border-top-style: solid; border-top-color: rgb(58, 188, 255); margin-top: -1.2em; color: inherit;"></section>
							<section style="margin-bottom: 1.2em; color: inherit;"></section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<h2
								style="padding: 0px; margin: 8px 0px 0px; font-weight: normal; font-size: 16px; font-family: 微软雅黑; white-space: normal; height: 32px; text-align: justify; color: rgb(62, 62, 62); line-height: 18px; border-bottom-color: rgb(227, 227, 227); border-bottom-width: 1px; border-bottom-style: solid;">
								<span
									style="padding: 0px 2px 3px; color: rgb(0, 112, 192); line-height: 28px; border-bottom-color: rgb(0, 187, 236); border-bottom-width: 2px; border-bottom-style: solid; float: left; display: block;"><span
									style="padding: 4px 10px; border-top-left-radius: 80%; border-top-right-radius: 100%; border-bottom-right-radius: 90%; border-bottom-left-radius: 20%; color: rgb(255, 255, 255); margin-right: 8px; background-color: rgb(0, 187, 236);">序号.</span><span
									style="color: rgb(0, 187, 236);">标题党</span></span>
							</h2>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<blockquote
								style="padding: 10px; margin: 5px 0px 0px; white-space: normal; max-width: 100%; line-height: 25px; font-size: 14px; font-family: arial, helvetica, sans-serif; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; color: rgb(255, 255, 255); border-left-color: rgb(0, 187, 236); border-left-width: 10px; border-left-style: solid; box-shadow: rgb(153, 153, 153) 2px 2px 4px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; word-wrap: break-word !important; box-sizing: border-box !important; background-color: rgb(55, 57, 57);">
								<span
									style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span
									style="max-width: 100%; font-family: 微软雅黑; font-size: 16px; word-wrap: break-word !important; box-sizing: border-box !important;">1、这里输入标题</span></span>
							</blockquote>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="max-width: 100%;margin: 0.8em 0px 0.5em; overflow: hidden; ">
							<section class="wweibrush"
								style="box-sizing: border-box !important;  height:36px;display: inline-block;color: #FFF; font-size: 16px;font-weight:bold; padding:0 10px;line-height: 36px;float: left; vertical-align: top; background-color: rgb(249, 110, 87); "
								placeholder="请输入标题">请输入标题</section> <section
								style="box-sizing: border-box !important; display: inline-block;height:36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(249, 110, 87); border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<h2
								style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(0, 112, 192); min-height: 32px; border-bottom: 2px solid rgb(0, 112, 192); text-align: justify;">
								<span
									style="background-color: rgb(0, 112, 192); border-radius: 80% 100% 90% 20%; color: rgb(255, 255, 255); display: block; float: left; line-height: 20px; margin: 0px 8px 0px 0px; max-width: 100%; padding: 4px 10px; word-wrap: break-word !important"
									placeholder="1" class="autonum">1</span><strong
									class="wweibrush">第一标题</strong>
							</h2>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<h2
								style="margin: 10px 0px; padding: 10px; font-size: 16px; line-height: 25px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; color: rgb(202, 251, 215); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; border-left-style: solid; border-color: rgb(10, 137, 43); background-color: rgb(14, 184, 58);"
								placeholder="深色边框标题" class="wweibrush">深色边框标题</h2>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="margin: 2px 0.8em 1em 0; text-align: center; font-size: 1em; vertical-align: middle; white-space: nowrap;">
							<section
								style="height: 0px; white-space: nowrap;  border-top: 1.5em solid rgb(71, 193, 168); border-bottom: 1.5em solid rgb(71, 193, 168); border-left-width: 1.5em ! important; border-left-style: solid ! important; border-right-width: 1.5em ! important; border-right-style: solid ! important; border-color: rgb(71, 193, 168);"></section>
							<section
								style="height: 0; white-space: nowrap; margin: -2.75em 1.65em;border-top: 1.3em solid #ffffff;border-bottom: 1.3em solid #ffffff;border-left: 1.3em solid transparent;border-right: 1.3em solid transparent;"></section>
							<section
								style="height: 0px; white-space: nowrap; margin: 0.45em 2.1em; vertical-align: middle; border-top: 1.1em solid rgb(71, 193, 168); border-bottom: 1.1em solid rgb(71, 193, 168); border-left-width: 1.1em ! important; border-left-style: solid ! important; border-right-width: 1.1em ! important; border-right-style: solid ! important; border-color: rgb(71, 193, 168);">
							<section
								style="max-height: 1em; padding: 0px; margin-top: -0.5em; color: rgb(254, 255, 253); font-size: 1.2em; line-height: 1em; white-space: nowrap; overflow: hidden; font-style: normal;"
								placeholder="一行短标题" class="wweibrush">一行短标题</section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<h2
								style="white-space: normal; font-size: 16px; margin: 10px 0px; padding: 10px; max-width: 100%; border-top: solid 2px; border-left: 0px; border-bottom: solid 2px; line-height: 25px; color: rgb(109, 151, 200); font-weight: bold; text-align: center;"
								placeholder="请输入标题" class="wweibrush">请输入标题</h2>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="clear: both; padding: 0px; border: 0px none; margin: 1em 0px 0.5em;">
								<section
									style="border-top-width: 2px; border-top-style: solid; border-color: rgb(142, 201, 101); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); box-sizing: border-box;">
								<section
									style="padding: 0px 0.5em; background-color: rgb(142, 201, 101); display: inline-block; font-size: 16px;"
									class="wweibrush">微信编辑器</section></section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="font-size: 1em; white-space: normal; margin: 1em 0px 0.8em; text-align: center; vertical-align: middle;">
							<section
								style="height: 0px; margin: 0px 1em; border: 1.5em solid rgb(255, 202, 0); border-left-color: transparent !important;border-right-color: transparent !important;"></section>
							<section
								style="height: 0px; margin: -2.75em 1.65em; border-width: 1.3em; border-style: solid; border-color: rgb(255, 255, 255) transparent;"></section>
							<section
								style="height: 0px; margin: 0.45em 2.1em; vertical-align: middle; border:1.1em solid rgb(255, 202, 0); border-left-color: transparent !important;  border-right-color: transparent !important;">
							<section
								style="max-height: 1em; padding: 0px; margin-top: -0.5em; color: rgb(255, 255, 255); font-size: 1.2em; line-height: 1em; overflow: hidden;"
								placeholder="一行短标题" class="wweibrush">一行短标题</section></section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="border: 3px solid rgb(255, 129, 36); padding: 5px;">
							<section
								style="border: 1px solid rgb(255, 158, 87); padding: 15px; text-align: center; color: inherit;">
							<p style="color: inherit;">微信编辑器</p>
							<p style="color: inherit; font-size: 24px">
								<strong style="color: inherit"><span
									style="color: inherit; font-size: 24px" data-brushtype="text"
									class="wweibrush">操作方便才是硬道理</span></strong>
							</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<p
								style="max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25px; font-size: 20px; box-sizing: border-box !important; text-shadow: rgb(0, 187, 236) 1px 0px 4px, rgb(0, 187, 236) 0px 1px 4px, rgb(0, 187, 236) 0px -1px 4px, rgb(0, 187, 236) -1px 0px 4px; word-wrap: break-word !important; color: rgb(255, 255, 255); font-weight: bold;"
								placeholder="请输入标题" class="wweibrush">请输入标题</p>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="margin: 0.5em 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-size: medium; line-height: 25px; white-space: normal; border: none rgb(255, 175, 205); word-wrap: break-word !important; text-align: right;">
								<section
									style="margin: 0px; padding: 1.5em 0px; max-width: 100%; box-sizing: border-box; width: 12.5em; height: 9.3em;  text-align: center; color: rgb(175, 0, 66); word-wrap: break-word !important; background-image: url(http://pro.wwei.cn/Public/wxeditor/css/0.png); background-color: rgb(255, 175, 205); background-size: cover;display:inline-block">
								<section
									style="margin: 0px 0px 0px 20px; padding: 0px; max-width: 100%; box-sizing: border-box; width: 160px; overflow: hidden; -webkit-transform: rotate(-13deg); font-size: 22px;  font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">肆意</section></section>
								<section
									style="margin: 10px 20px; padding: 0px; max-width: 100%; box-sizing: border-box; width: 150px; overflow: hidden; -webkit-transform: rotate(-15deg);  font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"
									data-brushtype="text" class="wweibrush">
								<p>青春，背景色你的地盘你做主</p>
								</section></section></section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
								<section
									style="display: inline-block; box-sizing: border-box; color: inherit;">
								<section
									style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);"
									data-brushtype="text" class="wweibrush">微信编辑器</section> <section
									style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);"
									data-brushtype="text" class="wweibrush">做最易用的编辑器</section></section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<p>
								<span
									style="border-color: rgb(30, 155, 232); color: rgb(30, 155, 232); font-size: 4em; font-weight: bolder; line-height: 1em; vertical-align: middle">“</span><span
									style="color: inherit; font-size: 2em; font-style: normal; line-height: 1.2em; vertical-align: middle"
									data-brushtype="text" class="wweibrush">标题</span><span
									style="border-color: rgb(30, 155, 232); color: rgb(30, 155, 232); font-size: 2em; font-style: normal; line-height: 1.2em; vertical-align: middle"
									data-brushtype="text" class="wweibrush">标题</span><span
									style="border-color: rgb(30, 155, 232); color: rgb(30, 155, 232); font-size: 4em; font-weight: bolder; line-height: 1em; vertical-align: middle">”</span>
							</p>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor"> <section
								style="font-size:20px; background: rgb(223, 240, 203);border:0 none;"
								data-bcless="true"> <span
								style="background: rgb(255, 255, 255); color: rgb(150, 206, 84); display: inline-block; padding: 0px 15px 0px 0px"
								class="wweibrush">微信编辑器</span> <span
								style="background: none repeat scroll 0 0 #fff; display: inline-block; margin-left: 5px">&nbsp;</span>
							<span
								style="background: none repeat scroll 0 0 #fff; display: inline-block; margin-left: 5px">&nbsp;</span>
							<span
								style="background: none repeat scroll 0 0 #fff; display: inline-block; margin-left: 5px">&nbsp;</span></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<p
								style="max-width: 100%; line-height: 24px; font-weight: bold; background-color: rgb(244, 156, 4); color: rgb(255, 255, 255); border-radius: 45%; text-align: center; margin: 10px 0px; padding: 10px 15px;"
								placeholder="请输入标题" data-brushtype="text" class="wweibrush">请输入标题</p>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="border: 0px rgb(107, 77, 64); text-align: center; margin: 0.8em 0px 0.5em; box-sizing: border-box; padding: 0px;">
								<section
									style="color: rgb(107, 77, 64); display: inline-block; width: 1em; font-size: 2.5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(107, 77, 64);">
								<section
									style="box-sizing: border-box; color: inherit; border-color: rgb(107, 77, 64);"
									data-brushtype="text" class="wweibrush">两字</section></section>
								<section
									style="display: inline-block; margin-left: 0.5em; margin-top: 0.2em; text-align: left; box-sizing: border-box; color: inherit;">
								<section style="box-sizing: border-box; color: inherit;">
								<section
									style="background-color:rgb(107, 77, 64); border-color:rgb(107, 77, 64); box-sizing:border-box; color:rgb(224, 209, 202); display:inline-block; font-size:2em; font-weight:inherit; line-height:1; padding:0.1em; text-align:inherit; text-decoration:inherit"
									data-brushtype="text" class="wweibrush">副标题1</section></section> <section
									style="color: rgb(107, 77, 64); margin: 0.5em 0px; font-size: 1.5em; line-height: 1em; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(107, 77, 64);">
								<section
									style="box-sizing: border-box; color: inherit; border-color: rgb(107, 77, 64);"
									data-brushtype="text" class="wweibrush">副标题2</section></section></section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<h2
								style="padding-bottom: 9px; border-bottom: 1px solid #eee; argin-top: 20px; margin-bottom: 10px; font-weight: 500; line-height: 1.1; font-size: 22px;"
								data-brushtype="text" class="wweibrush">极简标题</h2>
							</section></li>
						<li title="点击插入此内容"><section
								style="color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal; display: inline-block; height: 2em; max-width: 100%; line-height: 1em; box-sizing: border-box; border-top-width: 1.1em; border-top-style: solid; border-top-color: rgb(0, 187, 236); border-bottom-width: 1.1em; border-bottom-style: solid; border-bottom-color: rgb(0, 187, 236); border-right-width: 1em; border-right-style: solid; border-right-color: transparent;"
								class="wwei-editor"> <section
								style="height: 2em; margin-top: -1em; color: white; padding: 0.5em 1em; max-width: 100%; white-space: nowrap; text-overflow: ellipsis;">这里输入标题</section></section></li>
						<li title="点击插入此内容"><section
								style="color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal; text-align: center; margin: 0px 1em; line-height: 1.6em;"
								class="wwei-editor"> <img
								style="border: 0px; width: 266px; vertical-align: middle; height: 36px !important;"
								src="http://pro.wwei.cn/Public/wxeditor/css/gs640.png"><section
									style="color: white; font-size: 1em; margin-top: -2.1em; white-space: nowrap;">请输入标题</section></section></li>
					</ul>
				</div>
				<div title="正文" style="padding:10px">
					<ul class="template-list">
						<li title="点击插入此内容" style="background-color: rgb(255, 255, 255);"><section
								class="wwei-editor">
							<section
								style="padding: 0px 8px; border-left-width: 3px; border-left-style: solid; border-color: rgba(163, 163, 163, 0.843137); font-size: 22px; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box;">
							<section
								style="line-height: 1.4; box-sizing: border-box; color: inherit;">
							<section
								style="border-color: rgb(117, 117, 118); color: rgb(117, 117, 118); font-size: 20px;"
								data-brushtype="text" class="wweibrush">标题</section></section>
							<section
								style="color: rgb(117, 117, 118); line-height: 1.4; margin-top: 5px; padding-left: 3px; font-size: 14px; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(117, 117, 118);"
								data-style="border-color: rgb(117, 117, 118); color: inherit; font-size: 12px;"
								class="wweibrush">
							<p
								style="border-color: rgb(117, 117, 118); color: inherit; font-size: 12px;">内容描述</p>
							</section></section></section></li>
						<li title="点击插入此内容" style="background-color: rgb(255, 255, 255);"><section
								class="wwei-editor">
							<blockquote
								style="white-space: normal; margin: 5px 0px 0px; padding: 10px; max-width: 100%; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(0, 176, 80); line-height: 25px; color: rgb(102, 102, 102);">
								<p placeholder="请输入内容内容。" class="wweibrush">请输入内容内容。</p>
							</blockquote>
							</section></li>
						<li title="点击插入此内容" style="background-color: rgb(255, 255, 255);"><section
								class="wwei-editor">
							<fieldset
								style="border: 0px; margin: 5px 0px; box-sizing: border-box; padding: 0px;">
								<section style="height: 1em; box-sizing: border-box;">
								<section
									style="height: 100%; width: 1.5em; float: left; border-top-width: 0.4em; border-top-style: solid; border-color: rgb(249, 110, 87); border-left-width: 0.4em; border-left-style: solid; box-sizing: border-box;"></section>
								<section
									style="height: 100%; width: 1.5em; float: right; border-top-width: 0.4em; border-top-style: solid; border-color: rgb(249, 110, 87); border-right-width: 0.4em; border-right-style: solid; box-sizing: border-box;"></section>
								<section
									style="display: inline-block; color: transparent; clear: both; box-sizing: border-box;"></section></section>
								<section
									style="margin: -0.8em 0.1em -0.8em 0.2em; padding: 0.8em; border: 1px solid rgb(249, 110, 87); border-radius: 0.3em; box-sizing: border-box;">
								<section class="wweibrush"
									style="color: rgb(51, 51, 51); font-size: 1em; line-height: 1.4; word-break: break-all; word-wrap: break-word;"
									placeholder="四角宽边框的样式">四角宽边框的样式</section></section>
								<section style="height: 1em; box-sizing: border-box;">
								<section
									style="height: 100%; width: 1.5em; float: left; border-bottom-width: 0.4em; border-bottom-style: solid; border-color: rgb(249, 110, 87); border-left-width: 0.4em; border-left-style: solid; box-sizing: border-box;"></section>
								<section
									style="height: 100%; width: 1.5em; float: right; border-bottom-width: 0.4em; border-bottom-style: solid; border-color: rgb(249, 110, 87); border-right-width: 0.4em; border-right-style: solid; box-sizing: border-box;"></section></section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容" style="background-color: rgb(255, 255, 255);"><section
								class="wwei-editor">
							<blockquote
								style="white-space: normal; font-size: 14px; line-height: 25px; margin: 2px 0px; padding: 10px 10px; border: 2px dashed #dedcde; max-width: 100%;"
								class="wweibrush">
								<p placeholder="虚线框内容，作为摘要或段落内容。">虚线框内容，作为摘要或段落内容。</p>
							</blockquote>
							</section></li>
						<li title="点击插入此内容" style="background-color: rgb(255, 255, 255);"><section
								class="wwei-editor">
							<section
								style="margin: 3px; padding: 15px;color: rgb(62, 62, 62); line-height: 24px;box-shadow: rgb(170, 170, 170) 0px 0px 3px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-box-shadow: rgb(170, 170, 170) 0px 0px 3px;"
								class="wweibrush">
							<p>边框阴影内容区域</p>
							</section></section></li>
						<li title="点击插入此内容" style="background-color: rgb(255, 255, 255);"><section
								class="wwei-editor">
							<blockquote
								style="border-width: 1px 1px 1px 5px; border-style: solid; border-color: rgb(238, 238, 238) rgb(238, 238, 238) rgb(238, 238, 238) rgb(159, 136, 127); border-radius: 3px; padding: 10px; margin: 10px 0px;">
								<h4
									style="color: rgb(159, 136, 127); font-weight: bold; font-size: 18px; margin: 5px 0px; border-color: rgb(159, 136, 127);"
									class="wweibrush">标题文字</h4>
								<section style="color: inherit;font-size:14px"
									data-style="color:inherit;font-size:14px;" class="wweibrush">
								<p>内容描述.</p>
								</section>
							</blockquote>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section
								style="color: inherit; font-size: 16px; padding: 5px 10px 0px 35px; margin-left: 27px; border-left-width: 2px; border-left-style: dotted; border-left-color: rgb(228, 228, 228);">
							<section
								style="width: 32px; height: 32px; margin-left: -53px; margin-top: 23px; color: rgb(202, 251, 215); text-align: center; line-height: 32px; border-top-left-radius: 16px; border-top-right-radius: 16px; border-bottom-right-radius: 16px; border-bottom-left-radius: 16px; background: rgb(14, 184, 58);"
								class="autonum">1</section>
							<section
								style="margin-top: -30px;padding-bottom: 10px; color: inherit;"
								class="wweibrush">
							<p
								style="clear: both; line-height: 1.5em; font-size: 14px; color: inherit;">
								<span style="color: inherit; font-size: 16px"><strong
									style="color: inherit">如何进入【微信编辑器】？</strong></span>
							</p>
							<p
								style="clear: both; line-height: 1.5em; font-size: 14px; color: inherit;">网页搜索“微信编辑器”，点击第一条搜索结果即可进入编辑器页面</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section
								style=" margin:10px auto; border:1px solid rgb(197,200,204);background-color:rbg(249,249,249);text-align:center;    border-radius:5px;box-shadow:0 1px 0 rgb(255,255,255), 0 2px 0 rgb(197,200,204), 0 3px 0 rgb(255,255,255), 0 4px 0 rgb(197,200,204);">
							<section
								style=" margin:0px; display:block;    height:25px;    border-bottom:0px solid rgb(197,200,204);border-radius:4px 4px 0 0;background-color:#dbdbdd">
							<section
								style=" display:inline-block; border:none solid rgb(163,164,167);background-color:#adadad; height:14px; width:14px;border-radius: 7px;margin-right:100px;">
							<section
								style="margin-top:30px; border:none solid rgb(163,164,167);background-color:rgb(222,222,222);height:14px; width:14px;border-radius: 7px;"></section>
							<section
								style=" margin-top:-37px;    margin-left:2px;    width:8px;    height:30px;    border:1px solid #cacaca;    background-color:rgb(255,255,255);border-radius: 3px;"></section></section>
							<section
								style=" display:inline-block; border:none solid rgb(163,164,167);background-color:#adadad; height:14px; width:14px;border-radius: 7px;">
							<section
								style="margin-top:30px; border:none solid rgb(163,164,167);background-color:rgb(222,222,222);height:14px; width:14px;border-radius: 7px;"></section>
							<section
								style=" margin-top:-37px;    margin-left:2px;    width:8px;    height:30px;    border:1px solid #cacaca;    background-color:rgb(255,255,255);border-radius: 3px;"></section></section></section>
							<section style="margin:40px 10px;">
							<p>请输入内容</p>
							</section></section></section></li>
						<li title="点击插入此内容"><blockquote
								style="padding: 15px 25px; margin: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑; white-space: normal; max-width: 100%; word-wrap: break-word; top: 0px; line-height: 24px; vertical-align: baseline; border-left-color: rgb(0, 187, 236); border-left-width: 10px; border-left-style: solid; background-color: rgb(239, 239, 239);">
								<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">可在这输入内容，wwei微信编辑器，微信编辑首选。</p>
							</blockquote></li>
						<li title="点击插入此内容"><blockquote
								style="padding: 5px 15px; margin: 0px; font-family: 微软雅黑; white-space: normal; max-width: 100%; color: rgb(255, 255, 255); line-height: 25px; font-weight: bold; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border: 0px; background-color: rgb(0, 187, 236);">
								<span style="font-size: 16px;">这输入标题</span>
							</blockquote>
							<blockquote
								style="padding: 10px 15px 20px; margin: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑; white-space: normal; max-width: 100%; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border: 0px; line-height: 25px; background-color: rgb(239, 239, 239);">
								<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">可在这输入内容，wwei微信编辑器，微信编辑首选。</p>
							</blockquote></li>
						<li title="点击插入此内容"><section
								style="color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal; margin-top: 1.5em; display: inline-block; height: 2em; max-width: 100%; line-height: 1em; box-sizing: border-box; border-top-width: 1.1em; border-top-style: solid; border-top-color: rgb(0, 187, 236); border-bottom-width: 1.1em; border-bottom-style: solid; border-bottom-color: rgb(0, 187, 236); border-right-width: 1em; border-right-style: solid; border-right-color: transparent;">
							<section
								style="height: 2em; margin-top: -1em; color: white; padding: 0.5em 1em; max-width: 100%; white-space: nowrap; text-overflow: ellipsis;">事项1</section></section><span
							style="color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; background-color: rgb(255, 255, 255);"></span>
						<section
								style="color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal; padding: 1em;">
							<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">
								请输入活动内容<br>请输入活动内容<br>......
							</p>
							</section></li>
						<li title="点击插入此内容"><section
								style="color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal;">
							<section
								style="border: 1px solid rgb(0, 187, 236); box-shadow: rgb(165, 165, 165) 0em 1em 0.1em -0.6em; line-height: 1.6em; background-color: white;">
							<section
								style="padding: 1em; text-align: center; font-size: 1.4em; font-weight: bold; line-height: 1.4em; color: white; background-color: rgb(0, 187, 236);">请输入名称</section>
							<section style="margin-top: 1.5em;">
							<img
								style="border: 0px; vertical-align: top; margin-left: 1em; width: 30px;"
								src="http://pro.wwei.cn/Public/wxeditor/css/i640.png"><section
									style="display: inline-block; width: 108.390625px; margin-left: 0.5em; padding: 0.2em;">时间</section></section>
							<section style="margin-top: 1em;">
							<img
								style="border: 0px; vertical-align: top; margin-left: 1em; width: 30px;"
								src="http://pro.wwei.cn/Public/wxeditor/css/s640.png"><section
									style="display: inline-block; width: 108.390625px; margin-left: 0.5em; padding: 0.2em;">地点</section></section>
							<br><br><br>
							</section></section></li>
						<li title="点击插入此内容"><p
								style="padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal;">&nbsp;</p>
							<p></p>
							<section
								style="color: rgb(51, 51, 51); font-size: 12px; white-space: normal; font-family: sans-serif, Arial, Verdana, 'Trebuchet MS'; background-image: url(http://www.17sucai.com/preview/1/2014-04-08/%E6%97%B6%E9%97%B4%E8%BD%B4/images/log/line-bg.png); background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 104px 30px; background-repeat: repeat-y;">
							<p
								style="padding: 0px; margin-top: 0px; margin-bottom: 0px; line-height: 40px; font-size: 24px;">2015年</p>
							<h1
								style="padding: 0px 0px 0px 60px; margin: -40px 0px 0px 85px; font-weight: normal; font-size: 24px; line-height: 40px; top: 0px; color: rgb(88, 166, 251); background-image: url(http://www.17sucai.com/preview/1/2014-04-08/%E6%97%B6%E9%97%B4%E8%BD%B4/images/log/clock.png); background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;">wwei更新日志</h1>
							<section style="clear: both; line-height: 32px;">
							<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p>
							<p
								style="padding: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 20px;">5月1日</p>
							<p
								style="padding: 0px; margin-top: -42px; margin-bottom: 0px; margin-left: 90px;">
								<img style="border: 0px; vertical-align: bottom;"
									src="http://p4.qhimg.com/d/inn/05a63fc5/circle-h.png">
							</p>
							<section style="margin-left: 140px; margin-top: -32px;">
							<p
								style="padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(99, 208, 41); font-size: 20px;">微信图文编辑</p>
							<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">微信在线编辑器</p>
							<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p>
							</section>
							<p
								style="padding: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 20px;">3月3日</p>
							<p
								style="padding: 0px; margin-top: -42px; margin-bottom: 0px; margin-left: 90px;">
								<img style="border: 0px; vertical-align: bottom;"
									src="http://p4.qhimg.com/d/inn/05a63fc5/circle-h.png">
							</p>
							<section style="margin-left: 140px; margin-top: -32px;">
							<p
								style="padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(99, 208, 41); font-size: 20px;">会员VIP功能</p>
							<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">新增了一大批功能</p>
							</section></section></section>
							<p></p></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="margin: 2em 1em 1em; padding: 0px; border: 0px rgb(255, 179, 167); border-image-source: none; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-size: 16px; line-height: 25px; word-wrap: break-word !important;">
								<section
									style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box; line-height: 1.4; margin-left: -0.5em;">
								<section
									style="max-width: 100%; box-sizing: border-box; border-color: rgb(0, 0, 0); padding: 3px 8px; border-radius: 4px;color: rgb(167, 23, 0); font-size: 1em;display: inline-block; -webkit-transform: rotateZ(-10deg);transform: rotate(-10deg);transform-origin: left center 0; -webkit-transform-origin: 0% 100%; word-wrap: break-word !important; background-color: rgb(255, 179, 167);">
								<span style="color: rgb(255, 255, 255)">微信编辑器</span></section></section>
								<section
									style="max-width: 100%; box-sizing: border-box; padding: 22px 16px 16px; border: 1px solid rgb(255, 179, 167);color: rgb(0, 0, 0); font-size: 14px;margin-top: -24px;"
									class="wweibrush">
								<p style="line-height: 24px;">
									<span style="color: rgb(89, 89, 89); font-size: 14px">微信编辑器提供非常好用的微信图文编辑器。可以随心所欲的变换颜色调整格式，更有神奇的自动配色方案。</span>
								</p>
								</section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="margin: 0px; padding: 5px; border: 1px solid rgb(204, 204, 204); max-width: 100%; color: rgb(62, 62, 62); line-height: 24px; text-align: justify; box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 250);">
								<legend
									style="margin: 0px; padding: 0px; text-align: left; margin-left: 20px; width: auto;">
									<strong><strong
										style="background-color: rgb(255, 255, 245); color: rgb(102, 102, 102); line-height: 20px"><span
											style="background-color: red; border-bottom-left-radius: 3em 1em; border-bottom-right-radius: 0.5em 2em; border-top-left-radius: 0.5em 4em; border-top-right-radius: 3em 1em; box-shadow: rgb(165, 165, 165) 4px 4px 2px; color: white; max-width: 100%; padding: 4px 10px; text-align: justify"
											data-brushtype="text" class="wweibrush">公告通知</span></strong></strong>&nbsp;&nbsp;
								</legend>
								<section
									data-style="margin-top: 2px; margin-bottom: 0px; padding: 0px; max-width: 100%; min-height: 1.5em; line-height: 2em;font-weight:bold;"
									class="wweibrush">
								<p
									style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; min-height: 1.5em; line-height: 2em;">
									各位小伙伴们，微信图文美化编辑器正式上线了，欢迎大家多使用多提供反馈意见。使用<span
										style="color: inherit"><strong>谷歌与火狐浏览器</strong></span>，可获得与手机端一致的显示效果。ie内核的低版本浏览器可能有不兼容的情况
								</p>
								</section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section style="max-width: 100%; margin: 2px; padding: 0px;">
							<section
								style="max-width: 100%;margin-left:1em; line-height: 1.4em;">
							<span style="font-size: 14px"><strong
								style="color: rgb(62, 62, 62); line-height: 32px; white-space: pre-wrap"><span
									style="background-color: rgb(86, 159, 8); border-radius: 5px; color: rgb(255, 255, 255); padding: 4px 10px"
									placeholder="关于微信编辑器" data-mce-style="color: #a5a5a5;"
									data-brushtype="text" class="wweibrush">关于微信编辑器</span></strong></span>&nbsp;&nbsp;</section>
							<section
								style="font-size: 1em; max-width: 100%; margin-top: -0.7em; padding: 10px 1em; border: 1px solid rgb(192, 200, 209); border-radius: 0.4em; color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);"
								data-style="color:rgb(89, 89, 89); font-size:14px; line-height:28px"
								class="wweibrush">
							<p>
								<span placeholder="提供非常好用的微信文章编辑工具。">非常好用的在线图文编辑工具</span>&nbsp;&nbsp;&nbsp;&nbsp;
							</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<blockquote
								style="orphans: 2; white-space: normal; widows: 2; font-size: 14px; line-height: 22.39px; margin: 10px 0px; padding: 15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://pro.wwei.cn/Public/wxeditor/css/left_quote.jpg); background-color: rgb(241, 241, 241); background-position: 1% 5px; background-repeat: no-repeat no-repeat;"
								class="wweibrush">这里插入分号引用样式的内容。</blockquote>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="margin: 0.5em 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); line-height: 25px; white-space: normal; border: 0px rgb(238, 222, 176); word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 0px; width: 100%; box-sizing: border-box;display: inline-block; text-align: center; word-wrap: break-word !important;">
								<img
									style="box-sizing: border-box; color: inherit; height: 65px; margin: 0px auto; padding: 0px; visibility: visible !important; width: 60px; word-wrap: break-word !important"
									src="http://pro.wwei.cn/Public/wxeditor/css/06.png"></section>
								<section
									style="margin: -2.3em 0px 0px; padding: 2em 0px 0px; max-width: 100%; box-sizing: border-box; min-height: 15em; font-size: 1em;  font-weight: inherit; text-decoration: inherit; color: rgb(131, 104, 28); border-color: rgb(238, 222, 176); word-wrap: break-word !important; background-image: url(http://pro.wwei.cn/Public/wxeditor/css/07.png); background-color: rgb(238, 222, 176); background-repeat: repeat;">
								<section
									style="margin: 0.3em auto; padding: 0.5em; max-width: 100%; box-sizing: border-box; width: 7em; height: 3.5em; line-height: 2em; overflow: hidden; -webkit-transform: rotate(-5deg); font-size: 32px;  font-weight: inherit; text-align: center; text-decoration: inherit; color: inherit; word-wrap: break-word !important; background-image: url(http://pro.wwei.cn/Public/wxeditor/css/08.png); background-repeat: no-repeat;background-size: contain;">
								<section
									style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
								<span
									style="box-sizing: border-box; color: inherit; margin: 0px; max-width: 100%; padding: 0px; word-wrap: break-word !important">公告</span></section></section>
								<section
									style="margin: 0px; padding: 1em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: inherit;"
									class="wweibrush">
								<p>本背景可以换色哦~</p>
								</section></section></section>
							</fieldset>
							<p>
								<br>
							</p>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<blockquote
								style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36); word-wrap: break-word !important; box-sizing: border-box !important; background-size: cover; background-image: url(http://pro.wwei.cn/Public/wxeditor/css/0.gif);">
								<section style="color:#ffffff" class="wweibrush">
								<p style="text-align: center; color: inherit;">
									<br>
								</p>
								<p
									style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;">
									<span style="font-size: 18px"><strong>雪花动态背景样式，请输入文字</strong></span>
								</p>
								</section>
							</blockquote>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section
								style="margin: 10px 0px; padding: 50px 0px; color: rgb(202, 251, 215); text-align: center; background-color: rgb(14, 184, 58);">
							<span
								style="border: 1px solid rgb(202, 251, 215); font-size: 18px; line-height: 42px; padding: 10px 15px">微信编辑器</span>
							<section style="margin-top:30px;" class="wweibrush">
							<p>秒刷，最易用的图文排版工具</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<p
								style="margin: 2px 5px 0px 0px; padding: 0px; color: rgb(75, 92, 196); float: left; font-size: 2.7em; line-height: 1em; margin-right: 5px"
								data-brushtype="text" class="wweibrush">秒刷</p>
							<section data-style="clear:none;" class="wweibrush">
							<p style="clear: none;">
								选择需要应用样式的文字，然后选择要使用的样式，即可实现秒刷效果。秒刷支持所有样式，如有使用遇到问题，欢迎加入QQ群<strong>390183835</strong>，将问题反馈给我们
							</p>
							<p style="clear: none; color: red;">回车使下沉占两行的文字独自为一个段落，然后再使用秒刷。建议下沉的为一个或者2个文字，不要多了。</p>
							</section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="padding: 5px; border: 1px solid rgb(204, 204, 204); line-height: 24px; color: inherit; background-color: rgb(254, 254, 254);">
								<legend
									style="margin: 0px 0px 0px 15px; padding: 0px; width: auto; font-size: 16px; color: inherit;">
									<span style="color: inherit; margin: 0px; padding: 0px"><strong
										style="color: rgb(102, 102, 102); margin: 15px 8px 0px 0px"><span
											style="background-color: rgb(145, 168, 252); border-color: rgb(145, 168, 252); border-radius: 5px; color: rgb(255, 255, 255); padding: 4px 10px"
											data-brushtype="text" class="wweibrush">Wwei</span>&nbsp;</strong><span
										style="border-color: rgb(145, 168, 252); color: rgb(145, 168, 252); margin: 0px; padding: 0px"
										data-brushtype="text" class="wweibrush">Wwei&nbsp;</span></span>
								</legend>
								<section
									style="margin: 15px; margin-bottom: 0px; padding: 0px; line-height: 2em; color: rgb(62, 62, 62); font-size: 14px;"
									data-style="text-indent: 2em;;" class="wweibrush">
								<p style="text-indent: 2em; color: inherit;">Wwei.cn平台是一个互联网运营平台，为运营者提供图文编辑工具，运营经验，收录公众号，定制开发微网站等服务，让运营更轻松高效。</p>
								</section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<fieldset
								style="margin: 0.5em 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-family: inherit; font-size: medium; line-height: 25px; white-space: normal; border: none rgb(254, 253, 254); word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 3.8em 0px; max-width: 100%; box-sizing: border-box; width: 12.5em; height: 12.5em; float: right; text-align: center; word-wrap: break-word !important; background-image: url(http://pro.wwei.cn/Public/wxeditor/css/09.png); background-size: cover;">
								<section
									style="margin: 0px 0px 0px 16px; padding: 0px; max-width: 100%; box-sizing: border-box; width: 140px; overflow: hidden; -webkit-transform: rotate(-13deg); font-size: 22px; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(102, 102, 102); word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: inherit;">Tips</section></section>
								<section
									style="margin: 10px 20px; padding: 0px; max-width: 100%; box-sizing: border-box; width: 150px; overflow: hidden; -webkit-transform: rotate(-15deg); font-size: 14px; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(102, 102, 102); word-wrap: break-word !important;">
								<section
									style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: inherit;"
									class="wweibrush">
								<p>我是图片不能换色哦</p>
								</section></section></section>
							</fieldset>
							</section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section>
							<section style="width:48%;display:inline-block;float:left;">
							<section
								style="padding:20px 25px;border:1px solid #e7e7e7;text-align:center;">
							<p>
								<img style="height: 50px; margin-bottom: 15px"
									src="http://pro.wwei.cn/Public/wxeditor/css/logo-135-web.png">
							</p>
							<h3
								style="font-size: 16px; font-weight: bold; margin: 0 0 10px 0;"
								class="134title">微信编辑器</h3>
							<section data-style="clear:none;" class="wweibrush">
							<p style="clear: none; margin: 0 0; line-height: 1.5em;">生而排版</p>
							<p style="clear: none; margin: 0 0; line-height: 1.5em;">
								<span style="text-align: center">为你而美</span>
							</p>
							</section></section></section>
							<section
								style="margin-left:4%;width:48%;display:inline-block;text-align:center;">
							<section style="padding:20px 25px;border:1px solid #e7e7e7;">
							<p>
								<img style="height: 50px; margin-bottom: 15px"
									src="http://pro.wwei.cn/Public/wxeditor/css/0(6).jpg">
							</p>
							<h3
								style="font-size: 16px; font-weight: bold; margin: 0 0 10px 0;"
								class="134title">秒刷</h3>
							<section data-style="clear:none;margin:0 0;line-height:1.5em;"
								class="wweibrush">
							<p style="clear: none; margin: 0 0; line-height: 1.5em;">一键排版</p>
							<p style="clear: none; margin: 0 0; line-height: 1.5em;">珍惜生命</p>
							</section></section></section>
							<p style="height: 2px; clear: both;">
								<br>
							</p>
							</section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section
								style="white-space: normal; border: none; margin: 0.5em 0px; box-sizing: border-box; padding: 0px;"
								class="I">
							<section
								style="width: 5em; height: 5em; float: left; margin: 0px 0.3em 0.3em 0px; display: inline-block; vertical-align: bottom; text-align: center; border-radius: 100%; font-size: 1.2em; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 238); border-color: rgb(167, 185, 222); box-sizing: border-box; background-color: rgb(70, 118, 217);"
								class="tn-Powered-by-XIUMI">
							<section
								style="display: table; width: 100%; height: 5em; box-sizing: border-box; border-color: rgb(70, 118, 217); color: inherit;"
								class="tn-Powered-by-XIUMI">
							<section
								style="display: table-cell; vertical-align: middle; line-height: 1.2; box-sizing: border-box; border-color: rgb(70, 118, 217); color: inherit;"
								class="tn-Powered-by-XIUMI">
							<p
								style="box-sizing: border-box; border-color: rgb(70, 118, 217); color: inherit;">刘翔</p>
							<p
								style="box-sizing: border-box; border-color: rgb(70, 118, 217); color: inherit;">
								<span
									style="font-size: 12px; border-color: rgb(70, 118, 217); color: inherit;">田径运动员</span>
							</p>
							</section></section></section>
							<section
								style="margin-top: 1em; font-size: 0.9em; font-family: inherit; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; color: inherit;"
								class="tn-Powered-by-XIUMI">
							<section style="box-sizing: border-box; color: inherit;"
								class="tn-Powered-by-XIUMI">
							<strong style="color: inherit;"><span
								style="font-size: 20px; color: inherit;">[头条]刘翔葛天离婚</span></strong></section>
							<section style="box-sizing: border-box; color: inherit;"
								class="tn-Powered-by-XIUMI">
							<br style="box-sizing: border-box; color: inherit;"
								class="tn-Powered-by-XIUMI">
							</section>
							<section style="box-sizing: border-box; color: inherit;"
								class="tn-Powered-by-XIUMI">
							<span style="font-size: 16px; color: inherit;">2015年6月25日，刘翔在微博宣布与演员妻子葛天离婚。他在微博自曝与葛天相恋4个月后结婚，现在两人因性格不合而离婚。</span></section>
							<p style="box-sizing: border-box; color: inherit;">
								<br style="color: inherit;">
							</p>
							<section
								style="border: 0px; box-sizing: border-box; padding: 0px; color: inherit;"
								class="tn-Powered-by-XIUMI">
							<section
								style="margin: 0.5em 0px; border-top-style: dashed; border-top-width: 1px; border-color: rgb(70, 118, 217); box-sizing: border-box; color: inherit;"
								class="tn-Powered-by-XIUMI"></section>
							<section
								style="width: 0px; height: 0px; clear: both; color: inherit;"></section></section>
							<p style="box-sizing: border-box; color: inherit;">
								<span style="font-size: 16px; color: inherit;"></span>
							</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<section
								style="border-top-width: 2px; border-top-style: groove; border-top-color: rgb(70, 118, 217); box-sizing: border-box; padding: 0px; display: table; width: 100%;">
							<section style="width: 25%; float: left; color: inherit;">
							<section
								style="display: inline-block; border-bottom-left-radius: 100px; border-bottom-right-radius: 100px; padding: 5px 20px 15px; margin-left: 15px; white-space: nowrap; color: rgb(255, 255, 238); border-color: rgb(167, 185, 222); background-color: rgb(70, 118, 217);">
							<span style="color: rgb(255, 255, 255); font-size: 36px">01</span></section></section>
							<section
								style="width: 65%; margin: 15px 0px 10px; display: inline-block; float: right; box-sizing: border-box; padding: 0px; text-align: right; color: inherit;"
								data-style="text-align:left;font-size:13px;">
							<p style="text-align: left; color: inherit;">
								<span style="font-size: 13px; color: inherit;">名叫小默，不知道是哪个卖家把名字写开了，今天一块递打电话，我接起来说为，他说您好，是小黑犬吗？</span>
							</p>
							<p style="text-align: left; color: inherit;">
								<span style="font-size: 13px; color: inherit;">我不打死你！！</span>
							</p>
							</section></section></section></li>
						<li title="点击插入此内容"><section class="wwei-editor">
							<blockquote
								style="margin: 3px; padding: 10px 15px; border-width: 3px; border-color: rgb(107, 77, 64); border-top-left-radius: 50px; border-bottom-right-radius: 50px; box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 250);">
								<section
									data-style="margin-top: 15px; margin-bottom: 0px; padding: 0px; color: rgb(107, 77, 64); line-height: 2em; font-size: 20px; border-color: rgb(107, 77, 64);font-size: 18px;font-weight:bold;"
									class="wweibrush">
								<p
									style="margin-top: 15px; margin-bottom: 0px; padding: 0px; color: rgb(107, 77, 64); line-height: 2em; font-size: 20px; border-color: rgb(107, 77, 64);">
									<span style="font-size: 18px"><strong
										style="border-color: rgb(107, 77, 64); color: inherit">读而思</strong></span>
								</p>
								</section>
								<p
									style="margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 2em; min-height: 1.5em; color: inherit;">
									<span style="font-size: 12px"><strong
										style="background-color: rgb(107, 77, 64); border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; color: rgb(224, 209, 202); font-size: 13px; padding: 0px 15px"
										data-brushtype="text" class="wweibrush">duersi</strong></span>
								</p>
								<section
									data-style="margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; font-size: 14px; min-height: 1.5em; color: inherit;"
									class="wweibrush">
								<p>
									<span style="font-size: 14px">编辑完成后，将内容复制粘贴到微信后台素材管理的编辑器中即可。</span>
								</p>
								<p
									style="margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; font-size: 16px; min-height: 1.5em; color: inherit;">
									<span style="font-size: 14px"></span>
								</p>
								</section>
							</blockquote>
							</section></li>
					</ul>
				</div>
       		</div>
 		</div>
		<div style="position:absolute;top:0px;left:350px;width:545px;bottom:0px;">
			<script id="formdesign" type="text/plain" style="width:540px;"></script>
		</div>
	</div>
	<script type="text/javascript">
		//实例一个Ueditor
		var wechartDesign = UE.getEditor('formdesign', {
			toolbars : [
					[ "source", "undo", "redo", "bold", "italic", "underline",
							"forecolor", "backcolor", "justifyleft",
							"justifycenter", "justifyright", "justifyjustify",
							"indent", "insertunorderedlist",
							"insertorderedlist", "|", "searchreplace",
							"removeformat", "autotypeset" ],
					[ "paragraph", "fontfamily", "fontsize", "rowspacingtop",
							"lineheight", "inserttable", "insertimage",
							"emotion", "horizontal", "spechars", 'link',
							'unlink' ] ],
			toolken : true
		//是否在toolbars显示，表单设计器的图标
		});
		wechartDesign.ready(function() {
			wechartDesign.setHeight(517);
			var _tempLi = $('.template-list li');
			_tempLi.hover(function(){
				$(this).css({"background-color":"#f5f5f5"});
			},function(){
				$(this).css({"background-color":"#fff"});
			});
			_tempLi.click(function(){
				var _tempHtml = $(this).html();
				//wechartDesign.setContent("");
				wechartDesign.execCommand('insertHtml', _tempHtml + "<p><br/></p>");
			});
		});
	</script>
</body>
</html>
