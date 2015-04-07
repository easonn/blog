package cn.ithought.common;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

import cn.ithought.controller.BlogController;
import cn.ithought.controller.admin.AdminController;
import cn.ithought.controller.admin.EssayController;
import cn.ithought.model.Admin;
import cn.ithought.model.Essay;
import cn.ithought.model.PageView;

public class Config extends JFinalConfig {

    @Override
    public void configConstant(Constants me) {
        me.setDevMode(true);
        me.setViewType(ViewType.JSP);
        me.setError404View("/error/404.html");
        me.setError500View("/error/404.html");
    }

    @Override
    public void configHandler(Handlers me) {
        // me.add(new ContextPathHandler("ctx_path"));

    }

    @Override
    public void configInterceptor(Interceptors arg0) {
        // TODO Auto-generated method stub

    }

    @Override
    public void configPlugin(Plugins me) {
        loadPropertyFile("dbconfig.properties");
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
                getProperty("user"), getProperty("password"));
        me.add(c3p0Plugin);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        arp.addMapping("t_essay", "essayId", Essay.class);
        arp.addMapping("t_pv", "pvId", PageView.class);
        arp.addMapping("t_admin", "adminId", Admin.class);
        arp.setShowSql(true);
        me.add(arp);
        me.add(new EhCachePlugin());
    }

    @Override
    public void configRoute(Routes me) {
        me.add("/", BlogController.class);
        me.add("/admin_essay", EssayController.class);
        me.add("/admin", AdminController.class);
    }

}
