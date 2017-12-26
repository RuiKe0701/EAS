package com.ruike.eas.util;

import org.apache.poi.ss.formula.functions.T;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public class Page<T> implements Serializable {
    private static final long serialVersionUID = -3198048449643774660L;
    // 主表的当前页码
    private Integer currentPage=1;
    // 一页显示的条数
    private Integer pageSize;
    // 总条数，查询出来的
    private Integer totalRows;
    // 总页数:计算出来的
    private Integer totalPages;
    // 当前页的数据，当前页的数据是不确定的，因此需要使用到泛型
    private List<T> List = new ArrayList<T>();

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(Integer totalRows) {
        this.totalRows = totalRows;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return List;
    }

    public void setList(List<T> list) {
        this.List = list;
    }
    //通过构造函数将需要的数据传入，当前页，页面的大小，以及总共的条数记录，这个总的条数记录是从数据库里边
    //查询出来的
    public void init(Integer currentPage, Integer pageSize, Integer totalRows) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalRows = totalRows;

        // currentPage和pageSize最小值必须是1，在向上翻页的时候页面值会减小
        //并且当前页显示的数据也有，但是当前页的页面最小也只能是1，不能小于1
        this.currentPage = Math.max(this.currentPage, 1);
        this.pageSize = Math.max(this.pageSize, 1);

        // 总页数:计算出来，这是一个计算方法，有几种同的计算方法，
        //比如：一页显示5条，总共24条，那么（24+5-1）/5=5页，这实际就是在不能为整数
        //的时候就需要多加一页
        this.totalPages = (this.totalRows + this.pageSize - 1) / this.pageSize;

        // 错误处理
        // 当前页面不能大于总页数
        //再向下翻页的时候，当前页面的页数大小，不能大于总的页数
        //例如：只有五页，当你向第六页翻的时候，就还是第五页
        this.currentPage = Math.min(this.currentPage, this.totalPages);
    }
    public void init(Integer pageSize, Integer totalRows) {
        this.pageSize = pageSize;
        this.totalRows = totalRows;

        // currentPage和pageSize最小值必须是1，在向上翻页的时候页面值会减小
        //并且当前页显示的数据也有，但是当前页的页面最小也只能是1，不能小于1
        this.currentPage = Math.max(this.currentPage, 1);
        this.pageSize = Math.max(this.pageSize, 1);

        // 总页数:计算出来，这是一个计算方法，有几种同的计算方法，
        //比如：一页显示5条，总共24条，那么（24+5-1）/5=5页，这实际就是在不能为整数
        //的时候就需要多加一页
        this.totalPages = (this.totalRows + this.pageSize - 1) / this.pageSize;

        // 错误处理
        // 当前页面不能大于总页数
        //再向下翻页的时候，当前页面的页数大小，不能大于总的页数
        //例如：只有五页，当你向第六页翻的时候，就还是第五页
        this.currentPage = Math.min(this.currentPage, this.totalPages);
    }
    public Integer getCur(){
        return this.pageSize != null ? (this.currentPage-1 >= 0 ? this.currentPage-1:0)*this.getPageSize() : 0  ;
   }


    @Override
    public String toString() {
        return "PageResult [currentPage=" + currentPage + ", pageSize="
                + pageSize + ", totalRows=" + totalRows + ", totalPages="
                + totalPages + ", List=" + List.size() + "]";
    }
}
