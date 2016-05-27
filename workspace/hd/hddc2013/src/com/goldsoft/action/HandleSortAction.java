package com.goldsoft.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.core.common.PagingList;
import com.goldsoft.model.HandleSort;
import com.goldsoft.model.QuestionSort;
import com.goldsoft.service.HandleSortService;

public class HandleSortAction extends BaseAction {

	

	@Autowired
	@Qualifier("handleSortServiceImpl")
	private HandleSortService handleSortSortService;
	private String result;
	private int type;
	private String name;
	private String description;
	private HandleSort handleSort;
	private int handlesortid;
	private PagingList<HandleSort> list;
	
	public String ajaxList(){
		
		//System.out.println("handlesortaction");
		List<HandleSort> list=this.handleSortSortService.getList();
		
		Map<Integer,String> map=new HashMap<Integer,String>();
		
		for(HandleSort handle:list){
			map.put(handle.getHandlesortid(), handle.getName());
		}
		JSONObject obj = JSONObject.fromObject(map);   
		
		this.result=obj.toString();
		
		return SUCCESS;
	}
	
	public String list(){
		this.pager=this.handleSortSortService.getListByPage();
		return "list";
	}
	
	public String inAdd(){
		return "inAdd";
	}
	
	public String add(){
		HandleSort handleSort=new HandleSort();
		handleSort.setName(name);
		handleSort.setDescription(description);
		this.handleSortSortService.add(handleSort);
		return "add";
	}
	
	public String edit(){
		
		handleSort=this.handleSortSortService.get(handlesortid);
		
		return "edit";
	}
	
	public String update(){
		
		HandleSort handleSort=this.handleSortSortService.get(handlesortid);
		handleSort.setName(name);
		handleSort.setDescription(description);
		this.handleSortSortService.update(handleSort);
		
		return "update";
	}
	
	public String delete(){
		this.handleSortSortService.delete(handlesortid);
		return "delete";
	}

	public String getResult() {
		return result;
	}

	public void setType(int type) {
		this.type = type;
	}

	public HandleSort getHandleSort() {
		return handleSort;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setHandlesortid(int handlesortid) {
		this.handlesortid = handlesortid;
	}

	public PagingList<HandleSort> getList() {
		return list;
	}
	
}
