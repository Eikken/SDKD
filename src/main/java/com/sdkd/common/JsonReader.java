package com.sdkd.common;

import java.io.Serializable;

/**
 * @author Young
 * @date 2020/5/12 6:32
 * @see com.sdkd.common
 */
public class JsonReader implements Serializable {

    private Integer total;
    private Integer page;
    private Integer records;
    private Object rows;
    private Integer ID;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRecords() {
        return records;
    }

    public void setRecords(Integer records) {
        this.records = records;
    }

    public Object getRows() {
        return rows;
    }

    public void setRows(Object rows) {
        this.rows = rows;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }
}
