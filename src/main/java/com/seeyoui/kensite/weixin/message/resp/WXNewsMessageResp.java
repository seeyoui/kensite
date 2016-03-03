package com.seeyoui.kensite.weixin.message.resp;

import java.util.List;

public class WXNewsMessageResp extends WXBaseMessageResp {
	private int ArticleCount;
	private List<WXArticleResp> Articles;

	public int getArticleCount() {
		return ArticleCount;
	}

	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}

	public List<WXArticleResp> getArticles() {
		return Articles;
	}

	public void setArticles(List<WXArticleResp> articles) {
		Articles = articles;
	}
}
