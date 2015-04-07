package cn.ithought.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

public class PageView extends Model<PageView> {
    private static final long serialVersionUID = 1L;
    // 数据库表名
    private static final String TABLE = "t_pv";

    public static final PageView DAO = new PageView();

    // 获取每月的流量
    public String allMonthPV() {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 12; i++) {
            long number = Db.queryLong("select count(1) from " + TABLE
                    + " as p where MONTH(p.datetime) = ?", i);
            sb.append(number + ",");
        }
        return sb.substring(0, sb.length() - 1).toString();
    }

    public String essayPercent() {
        StringBuilder sb = new StringBuilder();
        List<String> pTitle = Db.query("SELECT  title FROM t_essay ");
        List<Object> pPercent = Db
                .query("SELECT cast(ROUND(ROUND(pageView/aa,4)*100,2) as char) percent FROM t_essay  ,(SELECT SUM(pageView) AS aa FROM t_essay) a");
        if (pTitle.size() < 5) {
            for (int i = 0; i < pTitle.size(); i++) {
                sb.append("[\'" + pTitle.get(i) + "\'," + pPercent.get(i)
                        + "],");
            }
        } else {
            for (int i = 0; i < 5; i++) {
                sb.append("[\'" + pTitle.get(i) + "\'," + pPercent.get(i)
                        + "],");
            }
        }
        return sb.substring(0, sb.length() - 1).toString();
    }
}
