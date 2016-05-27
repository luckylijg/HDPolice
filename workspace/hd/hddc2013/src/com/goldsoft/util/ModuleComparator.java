package com.goldsoft.util;

import java.util.Comparator;

import com.goldsoft.model.Module;

public class ModuleComparator implements Comparator<Module> {

	@Override
	public int compare(Module module1,Module module2) {
		
		if(Integer.parseInt(module1.getModuleid())>Integer.parseInt(module2.getModuleid())){
			return 1;
		}else{
			return -1;
		}
	}
}
