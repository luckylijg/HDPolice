package com.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	/**
	 * 将String类型时间 转换成 Date类型时间 ，格式为yyyy--MM,例：2009-10   
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public Date getDateYM(String date) throws Exception {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM");
		Date dateYM = localSimpleDateFormat.parse(date);
		return dateYM;
	}

	/**
	 * 将String类型时间 转换成 Date类型时间 ，格式为yyyy--MM--dd,例：返回2009-10-10   
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public Date getDate(String date) throws Exception {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		Date date1 = localSimpleDateFormat.parse(date);
		return date1;
	}

	/**
	 * 将Date类型时间 转换成 String类型时间 ，格式为yyyy--MM,例：返回2009-10   
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public String getStringYMDate(Date date) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM");
		String str = localSimpleDateFormat.format(date);
		return str;
	}

	/**
	 * 将Date类型时间 转换成 Date类型时间 ，格式为yyyy--MM,例：返回2009-10   
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public Date getDateYM(Date date) throws Exception {

		Date date1 = getDateYM(getStringYMDate(date));
		return date1;
	}

	/**
	 * 将Date类型时间 转换成 Date类型时间 ，将时间转换成当月1号，格式为yyyy--MM--01,例：2009-10-22,返回 2009-10-01   
	 * @param date
	 * @return
	 */
	public Date getDate01(Date date) {
		if (null == date)
			return null;
		Date date1 = null;
		String str = null;
		try {
			str = getStringYMDate(date);
			str = str + "-01";
			date1 = getDate(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date1;

	}

	/**
	 * 将Date类型时间 转换成 Date类型时间 ，将时间转换成下月1号，格式为yyyy--MM--01,例：2009-10-01，返回2009-11-01   
	 * @param date
	 * @return
	 */
	public Date getNextDate01(Date date) {
		Date date1 = null;
		String str = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		try {
			str = getStringYMDate(calendar.getTime());
			str = str + "-01";
			date1 = getDate(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date1;

	}

	/**
	 * 将日期Date类型转换成String类型, 格式为 yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public String getStringDate(Date date) {
		if (null == date)
			return null;
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		String str = localSimpleDateFormat.format(date);
		return str;
	}

	/**
	 * 将String日期类型转化为8位Integer类型数字，格式为 yyyyMMdd,例如2009-09-28，则返回20090928。
	 * 
	 */
	public Integer getIntDate(String date) {
		String str = date;
		str = str.replace("-", "").substring(0, 8);
		Integer intDate = Integer.parseInt(str);
		return intDate;
	}

	/**
	 * 将String日期类型转化为6位Integer类型数字，格式为 yyyyMM,例如2009-09-28，则返回200909。
	 * 
	 */
	public Integer getIntDateYM(String date) {
		String str = date;
		str = str.replace("-", "").substring(0, 6);
		Integer intDate = Integer.parseInt(str);
		return intDate;
	}

	/**
	 * 将Date日期类型转化为6位Integer类型数字，格式为 yyyyMM,例如2009-09-28，则返回200909。
	 * 
	 */
	public Integer getIntDateYM(Date date) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		String str = localSimpleDateFormat.format(date);
		str = str.replace("-", "").substring(0, 6);
		Integer intDate = Integer.parseInt(str);
		return intDate;
	}

	/**
	 * 将日期Date类型转换成Integer类型 ,格式为 yyyyMMdd 例：返回20091011
	 * @param date
	 * @return
	 */
	public Integer getIntDate(Date date) {
		String str = getStringDate(date);
		str = str.replace("-", "").substring(0, 8);
		Integer intDate = Integer.parseInt(str);
		return intDate;
	}

	/**
	 * 将日期Date类型转换成Integer类型2位数字,例如2009-09-28，则返回28。
	 * @param date
	 * @return
	 */
	public Integer getDay(Date date) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		String str = localSimpleDateFormat.format(date);
		//str = str.replace("-", "").substring(8, 9);
		str = str.substring(str.length() - 2, str.length());
		Integer day = Integer.parseInt(str);
		return day;
	}

	/**
	 * 将日期Date类型转换成String类型,得到传入时间的月份,例如2009-09-28，则返回09。
	 * @param date
	 * @return
	 */
	public String getMonthOfYear(Date date) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		String str = localSimpleDateFormat.format(date);
		str = str.substring(5, 7);
		return str;
	}

	/**
	 * 将日期String类型转换成String类型,得到传入时间的月份,例如2009-09-28，则返回09。
	 * @param date
	 * @return
	 */
	public String getMonthOfYear(String date) {
		String str = date.substring(5, 7);
		return str;
	}

	/**
	 * 将日期Date类型转换成Integer类型,得到传入时间的月份,例如2009-09-28，则返回9 ; 2009-12-23,则返回12 。
	 * @param date
	 * @return
	 */
	public Integer getIntMonthOfYear(Date date) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		String str = localSimpleDateFormat.format(date);
		str = str.substring(5, 7);
		Integer day = Integer.parseInt(str);
		return day;
	}

	/**
	 * 将日期Date类型转换成Integer类型8位当月第一天数字,例如2009-09-18，则返回20090901。
	 * @param date
	 * @return
	 */
	public Integer getFisrtDayOfMonth(Date date) {
		String srt = getStringYMDate(date);
		Integer it = getIntDate(srt + "01");
		return it;
	}

	/**
	 * 将日期Date类型转换成Integer类型8位当月最后一天数字,例如2009-09-18，则返回20090930。
	 * @param date
	 * @return
	 */
	public Integer getLastDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, 1);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		Integer it = getIntDate(cal.getTime());
		return it;
	}

	/**
	 * 将日期Date类型转换成Date类型当月第一天数字,例如2009-09-18，则返回2009-09-01。
	 * @param date
	 * @return
	 */
	public Date getFisrtDayInMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		Date dat = cal.getTime();
		return dat;
	}

	/**
	 * 将日期Date类型转换成Integer类型当月最后一天数字,例如2009-12-18，则返回2009-12-31。
	 * @param date
	 * @return
	 */
	public Date getLastDayInMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, 1);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		Date dat = cal.getTime();
		return dat;
	}

	/**
	 * 将两个Date类型的日期进行比较，看date1 是否在 date2之前，返回boolean
	 * @param date1
	 * @param date2
	 * @return
	 */
	public boolean isBefore(Date date1, Date date2) {
		boolean aa = false;
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		if (cal1.before(cal2))
			aa = true;
		return aa;
	}

	/**
	 * 将两个Date类型的日期进行比较，看date1 和 date2是否相等，返回boolean
	 * @param date1
	 * @param date2
	 * @return
	 */
	public boolean isEquals(Date date1, Date date2) {
		boolean aa = false;
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		if (cal1.equals(cal2))
			aa = true;
		return aa;
	}

	/**
	 * 将Date类型的转换成Date类型的带 时分秒 格式的时间 ，返回2007-09-05 16:07:35
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public Date getDateHMS(Date date) throws Exception {
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowtime = d.format(date);
		return getDateOfHms(nowtime);
	}

	/**
	 * 将带时分秒的String类型的转换成Date类型的带 时分秒 格式的时间 ，返回2007-09-05 16:07:35
	 * @param dateHMS
	 * @return
	 * @throws Exception
	 */
	public Date getDateOfHms(String dateHMS) throws Exception {
		SimpleDateFormat ff = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = ff.parse(dateHMS);
		return date1;
	}

	/**
	 * 根据 Date类型的时间 ，得到该时间的下月Date类型时间，例：2008-03-08，返回 2008-04-08
	 * @param date
	 * @return
	 */
	public Date getNextMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, 1);
		Date da = cal.getTime();
		return da;

	}

	/**
	 * 根据 Date类型的时间 ，得到该时间的上月Date类型时间，例： 2008-04-08，返回 2008-03-08
	 * @param date
	 * @return
	 */
	public Date getBeforeMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -1);
		Date da = cal.getTime();
		return da;

	}

	/**
	 * 根据 Date类型的时间 ，得到该时间的上月Date类型时间的最后一天，例： 2008-04-08，返回 2008-03-31, 2009-12-23 返回 2009-11-30.
	 * @param date
	 * @return
	 */
	public Date getBeforeLastDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -1);
		Date da = getLastDayInMonth(cal.getTime());
		return da;
	}

	/**
	 * 根据传入的Date类型的日期，得到该日期当月的最后一天，返回int类型。例如：2009-12-19，返回31 。
	 * @param date
	 * @return
	 */
	public int getMaxDayOfMonth(Date date) {
		Calendar cCurrDate = Calendar.getInstance();
		cCurrDate.setTime(date);
		int currDateDay = getDay(cCurrDate.getTime());
		return currDateDay;
	}

	/**
	 * 判断dateA小于等于dateB   
	 * @param dateA
	 * @param dateB
	 * @return
	 */
	public boolean beforeAndEquals(Date dateA, Date dateB) {
		if (dateA.after(dateB)) {
			return false;
		}
		return true;
	}

	/**
	 * 判断dateA大于等于dateB 
	 * @param dateA
	 * @param dateB
	 * @return
	 */
	public boolean afterAndEquals(Date dateA, Date dateB) {
		if (dateA.before(dateB)) {
			return false;
		}
		return true;
	}

	/**
	 * 返回两个日期的天数差
	 * <p>
	 * 返回-1表示计算出错,一般为输入的日期串格式不正确,正确格式:yyyy-MM-dd
	 */
	//	public static int getDiffDay(String begindate, String enddate) {
	//		// return 0;
	//		try {
	//			return getInstance().calFactualDate(begindate, enddate) + 1;
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		return -1;
	//	}
	/**
	 * 功能：判断输入年份是否为闰年<br>
	 * 
	 * @param year
	 * @return 是：true 否：false
	 * @author pure
	 */
	public static boolean leapYear(int year) {
		boolean leap;
		if (year % 4 == 0) {
			if (year % 100 == 0) {
				if (year % 400 == 0)
					leap = true;
				else
					leap = false;
			} else
				leap = true;
		} else
			leap = false;
		return leap;
	}

	public Long getDateSubMi(String date1, String date2) throws Exception {
		Date date11 = new SimpleDateFormat("yyyy-mm-dd").parse(date1);
		Date date22 = new SimpleDateFormat("yyyy-mm-dd").parse(date2);

		long l = date11.getTime() - date22.getTime() > 0 ? date11.getTime()
				- date22.getTime() : date22.getTime() - date11.getTime();
		return l;
	}

	public Long getDateSubDay(String date1, String date2) throws Exception {
		Date date11 = new SimpleDateFormat("yyyy-mm-dd").parse(date1);
		Date date22 = new SimpleDateFormat("yyyy-mm-dd").parse(date2);

		long day = (date11.getTime() - date22.getTime())
				/ (24 * 60 * 60 * 1000) > 0 ? (date11.getTime() - date22
				.getTime())
				/ (24 * 60 * 60 * 1000) : (date22.getTime() - date11.getTime())
				/ (24 * 60 * 60 * 1000);
		return day;
	}

	/**
	 * 得到的时间的差
	 * @param minTime
	 * @param maxTime
	 * @return
	 */
	public String getSubtract(String minTime, String maxTime) {
		try {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date startTime = format.parse(minTime);
			Date endTime = format.parse(maxTime);
			Calendar cmax = Calendar.getInstance();
			cmax.setTime(endTime);
			Calendar cmin = Calendar.getInstance();
			cmin.setTime(startTime);
			if (cmax.after(cmin)) {
				long passed = cmax.getTimeInMillis() - cmin.getTimeInMillis();
				int hour = (int) (passed / (1000 * 60 * 60));
				int min = (int) ((passed % (1000 * 60 * 60)) / (1000 * 60));
				int second = (int) (((passed % (1000 * 60 * 60)) % (1000 * 60)) / 1000);
				String result = (hour < 9 ? "0" + hour : hour + "");
				result += ":" + (min < 9 ? "0" + min : min + "");
				result += ":" + (second < 9 ? "0" + second : second + "");

				return result;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		DateUtil dateUtil = new DateUtil();
		String minTime = "2008-12-6 23:59:59";
		String maxTime = "2008-12-7 00:26:29";
		String result = dateUtil.getSubtract(minTime, maxTime);
		System.out.println("开始时间：" + minTime);
		System.out.println("结束时间:" + maxTime);
		System.out.println("相减后的时间：" + result);
		long i = dateUtil.dateDiff(
				new SimpleDateFormat("yyyy-MM-dd").format(new Date()),
				"2010-8-23", "yyyy-MM-dd");
		System.out.println(i);
	}

	public long dateDiff(String startTime, String endTime, String format) {
		//按照传入的格式生成一个simpledateformate对象
		SimpleDateFormat sd = new SimpleDateFormat(format);
		long nd = 1000 * 24 * 60 * 60;//一天的毫秒数
		long nh = 1000 * 60 * 60;//一小时的毫秒数
		long nm = 1000 * 60;//一分钟的毫秒数
		long ns = 1000;//一秒钟的毫秒数
		long diff;
		try {
			//获得两个时间的毫秒时间差异
			diff = sd.parse(endTime).getTime() - sd.parse(startTime).getTime();
			long day = diff / nd;//计算差多少天
			long hour = diff % nd / nh;//计算差多少小时
			long min = diff % nd % nh / nm;//计算差多少分钟
			long sec = diff % nd % nh % nm / ns;//计算差多少秒
			//输出结果
			return day;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
