package com.ruike.eas.service;

import com.ruike.eas.pojo.StuScore;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
@Controller
public interface StuScoreService {
    /**
     * 根据条件查询学生成绩
     * @param stuScore 学生成绩对象
     * @return 集合
     */
    public List<StuScore> selectStuScore(StuScore stuScore);
}
