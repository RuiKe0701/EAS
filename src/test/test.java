import com.ruike.eas.dao.ClassExamMapper;
import com.ruike.eas.dao.SchoolExamMapper;
import com.ruike.eas.pojo.ClassExam;
import com.ruike.eas.pojo.SchoolExam;
import com.ruike.eas.util.DateUtil;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 554391674 on 2017/12/7.
 */
public class test {
    ApplicationContext ac =null;

    @Test
    public void ter(){
        SchoolExamMapper schoolExamMapper =(SchoolExamMapper) ac.getBean("schoolExamMapper");
       // ClassExamMapper classExamMapper= (ClassExamMapper) ac.getBean("classExamMapper");
        List<SchoolExam> schoolExams = schoolExamMapper.selectSchoolExam(new SchoolExam());
//        for (SchoolExam exams: schoolExams) {
//            System.out.println(exams.getSe_Name());
//        }
        SchoolExam exam=new SchoolExam();
        exam.setSe_Name("王");
        System.out.println(exam.getSe_Name());
                //增加
//        SchoolExam schoolExam=new SchoolExam();
//        schoolExam.setSe_Name("田七");
//        schoolExam.setSe_Startday( DateUtil.dateFormat("2017-07-06","yyyy-MM-dd"));
//        schoolExam.setSe_Stopday( DateUtil.dateFormat("2017-07-07","yyyy-MM-dd"));
//        schoolExam.setSe_Createby(0);
//        schoolExam.setSe_Createdate( DateUtil.dateFormat("2017-07-07","yyyy-MM-dd"));
//       schoolExam.setSe_Examtype(1);
//        schoolExam.setSe_State(0);
//        int s=schoolExamMapper.insertSchoolExam(schoolExam);

                        //修改
//        SchoolExam schoolExam1=new SchoolExam();
//        schoolExam1.setSe_Id(5);
//        schoolExam1.setSe_Name("张茜");
//        schoolExam1.setSe_Startday( DateUtil.dateFormat("2017-07-07","yyyy-MM-dd"));
//        schoolExam1.setSe_Stopday( DateUtil.dateFormat("2017-07-07","yyyy-MM-dd"));
//        schoolExam1.setSe_Createdate( DateUtil.dateFormat("2017-07-07","yyyy-MM-dd"));
//        schoolExam1.setSe_Createby(1);
//        schoolExam1.setSe_Examtype(1);
//        schoolExam1.setSe_State(0);
//        int i=schoolExamMapper.updateSchoolExam(schoolExam1);
        //班级考试表
//        List<ClassExam> classExams=classExamMapper.selectClassExam(new ClassExam());
//        ClassExam exam=new ClassExam();
//        exam.setCe_Name("20170702Y2");
//        System.out.println(exam.getCe_Name());
            //增加
//        ClassExam classExam=new ClassExam();
//        classExam.setCe_Name("20170625Y2");
//        classExam.setClass_Id(2);
//        classExam.setCe_Examday(DateUtil.dateFormat("2017-07-06","yyyy-MM-dd"));
//        classExam.setCe_Remarks("考试测试");
//        classExam.setSe_Id(1);
//        classExam.setCe_State(0);
//        classExam.setCe_Createdate(DateUtil.dateFormat("2017-07-06","yyyy-MM-dd"));
//        int cl=classExamMapper.insertClassExam(classExam);
            //修改
//            ClassExam classExam=new ClassExam();
//            classExam.setCe_Id(3);
//            classExam.setCe_Name("20170701S2");
//            classExam.setClass_Id(1);
//            classExam.setCe_Examday(DateUtil.dateFormat("2017-07-06","yyyy-MM-dd"));
//            classExam.setCe_Remarks("springMVC");
//            classExam.setSe_Id(2);
//            classExam.setCe_State(2);
//            classExam.setCe_Createdate(DateUtil.dateFormat("2017-07-06","yyyy-MM-dd"));
//            int x=classExamMapper.updateClassExam(classExam);
      }

    @Before
    public void be(){

        String [] strings = {"spring-applicionContext.xml","springMvc-servlet.xml"};
        ac = new ClassPathXmlApplicationContext
                (strings);
    }
}
