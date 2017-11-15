package test;

import dao.StudentMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class test {
    public static void main(String[] args) {
        ApplicationContext ct = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
        StudentMapper studentMapper = (StudentMapper) ct.getBean("studentMapper");
        List<Student> students = studentMapper.selectstudent();
        for (Student student : students) {
            System.out.println(student.getStudentname());
        }
    }
}