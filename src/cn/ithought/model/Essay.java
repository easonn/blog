package cn.ithought.model;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import com.jfinal.kit.StringKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
public class Essay extends Model<Essay> {

    private static final long serialVersionUID = 1L;
    // 数据库表名
    private static final String TABLE = "t_essay";

    private static final String ESSAY_CACHE = "essay";

    // cache
    private static final String ESSAY_PAGE_CACHE = "essayPage";
    private static final String ESSAY_TYPE_PAGE_CACHE = "essayTypePage";
    // private static final String ESSAY_PAGE_FOR_ADMIN_CACHE =
    // "essayPageForAdmin";
    private static final String ESSAY_PV_CACHE = "essayPV";

    // sql
    private static final String ESSAY_BASIC_SELECT_PAGE_SQL = "select DATE_FORMAT(datetime,'%Y-%m-%d') as date, essayId ,contentInfo,title,author,typeName ";
    private static final String ESSAY_BASIC_FROM_PAGE_SQL = "from " + TABLE;
    public static final Essay DAO = new Essay();

    /*******/
    public Page<Essay> pageLoad(int pageNumber, int pageSize) {
        String para = ESSAY_BASIC_FROM_PAGE_SQL + " order by datetime desc";
        return DAO.paginateByCache(ESSAY_PAGE_CACHE, ESSAY_PAGE_CACHE + "-"
                + pageSize + "-" + pageNumber, pageNumber, pageSize,
                ESSAY_BASIC_SELECT_PAGE_SQL, para);
    }

    /****/
    public List<Essay> loadEssayPV() {
        String sql = "select DATE_FORMAT(datetime,'%Y年 %m月 %d日') as date, essayId,title,pageView from t_essay order by pageView desc limit 6";
        return DAO.findByCache(ESSAY_PV_CACHE, ESSAY_PV_CACHE, sql);
    }

    public Page<Essay> loadByType(String type, int pageNumber, int pageSize) {
        String para = ESSAY_BASIC_FROM_PAGE_SQL
                + " where type = ? order by datetime desc";
        return DAO.paginateByCache(ESSAY_TYPE_PAGE_CACHE, ESSAY_TYPE_PAGE_CACHE
                + "-" + type + "-" + pageNumber, pageNumber, pageSize,
                ESSAY_BASIC_SELECT_PAGE_SQL, para, type);
    }

    public Essay load(int id) {
        final int ID = id;
        return (Essay) CacheKit.get(ESSAY_CACHE, ID, new IDataLoader() {
            @Override
            public Essay load() {
                return findById(ID);
            }
        });
    }

    public boolean addEssayPV(final String ip, final int id) {
        return Db.tx(new IAtom() {
            public boolean run() throws SQLException {
                int count1 = Db.update("update " + TABLE
                        + " set pageView = pageView + ? where essayId = ?", 1,
                        id);
                Record pvRecord = new Record()
                        .set("ip", ip)
                        .set("essayId", id)
                        .set("pvId", UUID.randomUUID().toString())
                        .set("datetime",
                                new Timestamp(System.currentTimeMillis()));
                boolean count2 = Db.save("t_pv", pvRecord);
                return count1 == 1 && count2;
            }
        });
    }

    /** admin ****************/
    public boolean saveEssay() {
        // 录入的时间,并不是编写博文的时间
        this.set("datetime", new Timestamp(System.currentTimeMillis())).set(
                "pageView", 0);
        if (StringKit.isBlank(this.getStr("type"))) {
            this.set("type", "-1").set("typeName", "心路历程");
        }
        switch (this.getStr("type")) {
            case "-1":
                this.set("typeName", "心路历程");
                break;
            case "0":
                this.set("typeName", "学无止境");
                break;
            case "1":
                this.set("typeName", "精品收藏");
                break;
            default:
                this.set("type", "-1").set("typeName", "心路历程");
        }
        return save();
    }
}
