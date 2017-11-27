package com.ruike.eas.util;

/**
 * Created by Administrator on 2017/11/17.
 */
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.ruike.eas.pojo.Stu;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelOperation {
    //读取excel
    public static List<Stu> readExcel(String filename, InputStream is,Integer Classid){
        Workbook wb = null;
        if(filename == null){
            return null;
        }
        List<Stu> stus = new ArrayList<Stu>();
        String extString = filename.substring(filename.lastIndexOf("."));
        try {
            if(".xls".equals(extString)){
                wb = new HSSFWorkbook(is);
            }else if(".xlsx".equals(extString)){
                wb = new XSSFWorkbook(is);
            }else{
                wb = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //获取第一个sheet
        Sheet sheet = wb.getSheetAt(0);
        //获取最大行数
        int rownum = sheet.getPhysicalNumberOfRows();
        //获取第一行
        Row row = sheet.getRow(0);
        //获取最大列数
        int colnum = row.getPhysicalNumberOfCells();
        for (int i = 1; i<rownum; i++) {
            Map<String,String> map = new LinkedHashMap<String,String>();
            row = sheet.getRow(i);
            if(row !=null){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Stu stu = new Stu();
                stu.setStu_no((String) getCellFormatValue(row.getCell(0)));
                stu.setStu_name((String) getCellFormatValue(row.getCell(1)));
                stu.setStu_sex(((String)getCellFormatValue(row.getCell(2))).equals("男")?1:0);
                try {
                    stu.setStu_birthday(sdf.parse((String) getCellFormatValue(row.getCell(3))));
                    stu.setStu_phone((String) getCellFormatValue(row.getCell(4)));
                    stu.setStu_startday(sdf.parse((String) getCellFormatValue(row.getCell(5))));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                stu.setStu_address((String) getCellFormatValue(row.getCell(6)));
                stu.setStu_parentphone((String) getCellFormatValue(row.getCell(7)));
                stu.setStu_carde((String) getCellFormatValue(row.getCell(8)));
                stu.setStu_education((String) getCellFormatValue(row.getCell(9)));
                stu.setStu_email((String) getCellFormatValue(row.getCell(10)));
                stu.setStu_state(1);
                stu.setStatus(0);
                stu.setCrateday(new Date());
                stu.setClass_id(Classid);
                stus.add(stu);
            }else{
                break;
            }
        }
        return stus;
    }
    public static Object getCellFormatValue(Cell cell){
        Object cellValue = null;
        if(cell!=null){
            cellValue = cell.getRichStringCellValue().getString();
        }else{
            cellValue = "";
        }
        return cellValue;
    }
}

