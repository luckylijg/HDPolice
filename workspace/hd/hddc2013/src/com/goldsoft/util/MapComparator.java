package com.goldsoft.util;

import java.util.Comparator;
import java.util.Map;

import com.goldsoft.model.Module;

public class MapComparator implements Comparator<Map<String,String>> {

	/*@Override
	public int compare(Module module1,Module module2) {
		
		if(Integer.parseInt(module1.getModuleid())>Integer.parseInt(module2.getModuleid())){
			return 1;
		}else{
			return -1;
		}
	}
*/
	@Override
	public int compare(Map<String, String> o1, Map<String, String> o2) {
		
		return Integer.parseInt(o1.get("score"))-Integer.parseInt(o2.get("score"));
	}
}
