package com.seeyoui.kensite.common.base.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.seeyoui.kensite.common.constants.StringConstant;

/**
 * easui中的tree_data.json数据,只能有一个root节点 [{ "id":1, "text":"Folder1",
 * "iconCls":"icon-save", "children":[{ "text":"File1", "checked":true }] }]
 * 提供静态方法formatTree(List<TreeJson> list) 返回结果 TreeJson.formatTree(treeJsonlist)
 * ;
 * 
 * @author lwb
 * 
 */
public class TreeJson implements Serializable {
	/**
     * 
     */
	private static final long serialVersionUID = 1L;

	private String id;
	private String pid;
	private String text;
	private String iconCls;
	private String state;
	private boolean checked;
	private Attributes attributes = new Attributes();
	private List<TreeJson> children = new ArrayList<TreeJson>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		if(StringConstant.TRUE.equals(checked)) {
			this.checked = true;
		}
		if(StringConstant.FALSE.equals(checked)) {
			this.checked = false;
		}
	}

	public Attributes getAttributes() {
		return attributes;
	}

	public void setAttributes(Attributes attributes) {
		this.attributes = attributes;
	}

	public List<TreeJson> getChildren() {
		return children;
	}

	public void setChildren(List<TreeJson> children) {
		this.children = children;
	}

	public static List<TreeJson> formatTree(List<TreeJson> list) {

		TreeJson root = new TreeJson();
		TreeJson node = new TreeJson();
		List<TreeJson> treelist = new ArrayList<TreeJson>();// 拼凑好的json格式的数据
		List<TreeJson> parentnodes = new ArrayList<TreeJson>();// parentnodes存放所有的父节点

		if (list != null && list.size() > 0) {
			root = list.get(0);
			// 循环遍历oracle树查询的所有节点
			for (int i = 1; i < list.size(); i++) {
				node = list.get(i);
				if (node.getPid().equals(root.getId())) {
					// 为tree root 增加子节点
					parentnodes.add(node);
					root.getChildren().add(node);
				} else {// 获取root子节点的孩子节点
					getChildrenNodes(parentnodes, node);
					parentnodes.add(node);
				}
			}
		}
		treelist.add(root);
		return treelist;

	}

	private static void getChildrenNodes(List<TreeJson> parentnodes,
			TreeJson node) {
		// 循环遍历所有父节点和node进行匹配，确定父子关系
		for (int i = parentnodes.size() - 1; i >= 0; i--) {

			TreeJson pnode = parentnodes.get(i);
			// 如果是父子关系，为父节点增加子节点，退出for循环
			if (pnode.getId().equals(node.getPid())) {
				pnode.setState("closed");// 关闭二级树
				pnode.getChildren().add(node);
				return;
			} else {
				// 如果不是父子关系，删除父节点栈里当前的节点，
				// 继续此次循环，直到确定父子关系或不存在退出for循环
				parentnodes.remove(i);
			}
		}
	}
}
