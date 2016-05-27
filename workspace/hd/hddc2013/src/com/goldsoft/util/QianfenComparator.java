package com.goldsoft.util;

import java.util.Comparator;
import java.util.List;

import com.goldsoft.model.Module;

public class QianfenComparator implements Comparator<List> {

	@Override
	public int compare(List list1,List list2) {

		if(Integer.parseInt(list1.get(2).toString())>Integer.parseInt(list2.get(2).toString())){
			return -1;
		}else{
			return 1;
		}
	}
}
