package com.ruike.eas.util;

/**
 * Created by Administrator on 2017/11/17.
 */
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.ruike.eas.pojo.ClassScore;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.pojo.StuScore;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelOperation {
    //读取excel
    public static List<Stu> readStuExcel(String filename, InputStream is , Integer class_id){
        Workbook wb = null;
        if(filename == null){
            return null;
        }
        List<Stu> stus = new ArrayList<Stu>();
        //根据后缀名决定用什么类型解析
        wb = getSheets(filename, is);
        //获取第一个sheet
        Sheet sheet = wb.getSheetAt(0);
        //获取最大行数
        int rownum = sheet.getPhysicalNumberOfRows();
        //获取第一行
        Row row = sheet.getRow(0);
        //获取最大列数
        int colnum = row.getPhysicalNumberOfCells();
        for (int i = 1; i<rownum; i++) {
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
                stu.setStu_state(0);
                stu.setStatus(0);
                stu.setCrateday(new Date());
                stu.setClass_id(class_id);
                stus.add(stu);
            }else{
                break;
            }
        }
        return stus;
    }

    /**
     *  将文件流转换为学生集合
     * @param filename 文件名
     * @param is 流
     * @param sc 学生成绩对象
     * @return 学生集合
     */
    public static List<StuScore> readStuScoreExcel(String filename, InputStream is , StuScore sc , ClassScore classScore){
        List<StuScore> stuScores = new ArrayList<StuScore>();
        Workbook wb = null;
        if(filename == null){
            return null;
        }
        //根据后缀名决定用什么类型解析
        wb = getSheets(filename, is);
        //获取第一个sheet
        Sheet sheet = wb.getSheetAt(0);
        //获取最大行数
        int rownum = sheet.getPhysicalNumberOfRows();
        //获取第一行
        Row row = sheet.getRow(0);
        //获取最大列数
        int colnum = row.getPhysicalNumberOfCells();
        Date date = new Date();
        double wtScores = 0;
        double ctScores = 0;
        double avgScores = 0;
        for (int i = 1; i<rownum; i++) {
            Map<String,String> map = new LinkedHashMap<String,String>();
            row = sheet.getRow(i);
            if(row != null){
                StuScore stuScore = new StuScore();
                //班级考试ID
                stuScore.setCe_Id(sc.getCe_Id());
                //学生学号(并非id)
                stuScore.setStu_no(getCellFormatValue(row.getCell(0)).toString());
                //笔试分
                stuScore.setStuc_Wtscores(Double.parseDouble(getCellFormatValue(row.getCell(2)).toString()));
                //累计笔试分
                wtScores+=stuScore.getStuc_Wtscores();
                //机试
                stuScore.setStuc_Ctscores(Double.parseDouble(getCellFormatValue(row.getCell(3)).toString()));
                //累计机试分
                ctScores+=stuScore.getStuc_Ctscores();
                //平均分
                stuScore.setStuc_Avgscores((stuScore.getStuc_Wtscores()+stuScore.getStuc_Ctscores())/2);
                //创建时间
                stuScore.setStuc_Createdate(date);
                stuScore.setStuc_State(0);
                stuScores.add(stuScore);
            }else{
                break;
            }
            classScore.setCs_Wtavg(wtScores/stuScores.size());
            classScore.setCs_Ctavg(ctScores/stuScores.size());
            classScore.setCs_Avg((classScore.getCs_Wtavg()+classScore.getCs_Ctavg())/2);
        }
        return stuScores;
    }

    private static Workbook getSheets(String filename, InputStream is) {
        Workbook wb = null;
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
        return wb;
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

