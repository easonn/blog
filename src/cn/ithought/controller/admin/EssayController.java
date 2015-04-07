package cn.ithought.controller.admin;

import cn.ithought.common.Const;
import cn.ithought.interceptor.AdminInterceptor;
import cn.ithought.interceptor.UrlParaInterceptor;
import cn.ithought.model.Essay;
import cn.ithought.model.PageView;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
@Before(AdminInterceptor.class)
public class EssayController extends Controller {

    @Before(EvictInterceptor.class)
    @CacheName("essayPage")
    public void save() {
        Essay essay = getModel(Essay.class);
        if (essay.saveEssay()) {
            renderJsp("/admin/main.jsp");
        } else {
            renderError(404);
        }
    }

    @Before(EvictInterceptor.class)
    @CacheName("essayPage")
    public void del() {
        if (Essay.DAO.deleteById(getParaToInt(0, 1024))) {
            renderHtml("删除成功");
        } else {
            renderError(404);
        }
    }

    @Before(UrlParaInterceptor.class)
    public void essayList() {
        Page<Essay> page = Essay.DAO.pageLoad(getParaToInt(0, 1),
                Const.PAGE_SIZE_FOR_ADMIN);
        setAttr("pageNum", page.getPageNumber());
        setAttr("counts", page.getTotalRow());
        setAttr("pageCount", page.getTotalPage());
        setAttr("essayList", page.getList());
        renderJsp("/admin/blogManager/blogList.jsp");
    }

    public void allPV() {
        String pageView = PageView.DAO.allMonthPV();
        setAttr("monthPageView", pageView);
        renderJsp("/admin/pvManager/showMonthPV.jsp");
    }

    public void essayPercent() {
        String essayPercent = PageView.DAO.essayPercent();
        setAttr("essayPercent", essayPercent);
        renderJsp("/admin/pvManager/showPercent.jsp");
    }

}