package com.ruike.eas.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/27.
 */
public class DateUtil {
    static SimpleDateFormat sdf= null;
    public static String dateFormat(Date date,String format){
        sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    public static Date dateFormat(String date,String format){
        sdf = new SimpleDateFormat(format);
        Date date1 = null;
        try {
           date1 = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date1;
    }
}
