package cn.ithought.controller;

import cn.ithought.common.Const;
import cn.ithought.interceptor.EssayInterceptor;
import cn.ithought.interceptor.UrlParaInterceptor;
import cn.ithought.model.Essay;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
public class BlogController extends Controller {

    @Before(UrlParaInterceptor.class)
    public void index() {
        if (Const.pageMainTotalRow != 0
                && getParaToInt(0, 1) > Const.pageMainTotalRow) {
            renderError(404);
        } else {
            pageDeal(Essay.DAO.pageLoad(getParaToInt(0, 1),
                    Const.BLOG_PAGE_SIZE), "main");
        }
    }

    public void about() {
        renderJsp("/ithought/about.jsp");
    }

    @Before({ UrlParaInterceptor.class, EssayInterceptor.class })
    public void blog() {
        int id = getParaToInt(0, 1);
        Essay essay = Essay.DAO.load(id);
        if (null == essay) {
            essay = Essay.DAO.load(1);
        }
        setAttr("essay", essay);
        setAttr("class",
                "single single-post postid-363 single-format-standard main cat-30-id cat-38-id");
        setAttr("essayPageView", Essay.DAO.loadEssayPV());
        renderJsp("/ithought/index.jsp");
    }

    @Before(UrlParaInterceptor.class)
    public void mood() {
        pageDeal(Essay.DAO.loadByType("-1", getParaToInt(0, 1),
                Const.BLOG_PAGE_SIZE), "mood");
    }

    @Before(UrlParaInterceptor.class)
    public void summa() {
        pageDeal(Essay.DAO.loadByType("0", getParaToInt(0, 1),
                Const.BLOG_PAGE_SIZE), "summa");
    }

    @Before(UrlParaInterceptor.class)
    public void gather() {
        pageDeal(Essay.DAO.loadByType("1", getParaToInt(0, 1),
                Const.BLOG_PAGE_SIZE), "gather");
    }

    private void pageDeal(Page<Essay> page, String key) {
        if (page.getList().size() != 0) {
            setAttr("pageNum", page.getPageNumber());
            setAttr("counts", page.getTotalRow());
            setAttr("pageCount", page.getTotalPage());
            setAttr("essayList", page.getList());
            int totelRow = page.getTotalPage();
            switch (key) {
                case "main":
                    Const.pageMainTotalRow = totelRow;
                    break;
                case "mood":
                    Const.pageMoodTotalRow = totelRow;
                    break;
                case "summa":
                    Const.pageSummaTotalRow = totelRow;
                    break;
                case "gather":
                    Const.pageGatherTotalRow = totelRow;
                    break;
                default:
                    renderError(404);
            }
            setAttr("essayPageView", Essay.DAO.loadEssayPV());
            setAttr("class", "home blog main cat-7-id cat-30-id");

            renderJsp("/ithought/index.jsp");
        } else
            renderError(404);

    }
}
