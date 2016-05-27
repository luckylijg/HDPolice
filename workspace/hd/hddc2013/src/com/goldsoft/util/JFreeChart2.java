package com.goldsoft.util;

import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.util.ArrayUtilities;

public class JFreeChart2 {
	@SuppressWarnings("rawtypes")
    public static CategoryDataset createCategoryDataset(Comparable[] columnKeys,Comparable[] rowKeys, double[][] data) {
        if (columnKeys == null) {
            throw new IllegalArgumentException("Null 'columnKeys' argument.");
        }
        if (ArrayUtilities.hasDuplicateItems(columnKeys)) {
            throw new IllegalArgumentException(
                    "Duplicate items in 'columnKeys'.");
        }

        int columnCount = 0;
        for (int r = 0; r < data.length; ++r) {
            columnCount = Math.max(columnCount, data[r].length);
        }
        if (columnKeys.length != columnCount) {
            throw new IllegalArgumentException(
                    "The number of column keys does not match the number of columns in the data array.");
        } 			 

        DefaultCategoryDataset result = new DefaultCategoryDataset();
          /*  for (int c = 0; c < data[0].length; ++c) {
                Comparable columnKey = columnKeys[c];
                result.addValue(new Double(data[0][c]), columnKey, columnKey);
            }*/
        for (int r = 0; r < data.length; r++) {
            Comparable rowKey = rowKeys[r];
           for (int c = 0; c < data[r].length; c++) {
                Comparable columnKey = columnKeys[c];
               result.addValue(new Double(data[r][c]), rowKey, columnKey);
           }
       }
        return result;
    }

	
	/*public static CategoryDataset createCategoryDataset(String rowKeyPrefix,
            String columnKeyPrefix, double[][] data) {

        DefaultCategoryDataset result = new DefaultCategoryDataset();
        for (int r = 0; r < data.length; r++) {
             Comparable rowKey = rowKeys[c];
            for (int c = 0; c < data[r].length; c++) {
                 Comparable columnKey = columnKeys[c];
                result.addValue(new Double(data[r][c]), rowKey, columnKey);
            }
        }
        return result;

    }
*/
}
