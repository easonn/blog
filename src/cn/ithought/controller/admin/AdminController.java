package cn.ithought.controller.admin;

import cn.ithought.interceptor.AdminInterceptor;
import cn.ithought.model.Admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
@Before(AdminInterceptor.class)
public class AdminController extends Controller {

    public void index() {
        Admin admin = getModel(Admin.class);
        if (Admin.DAO.login(admin.getStr("name"), admin.getStr("pass"))) {
            setSessionAttr("adminName", admin.getStr("name"));
            renderJsp("/admin/main.jsp");
        } else {
            renderError(404);
            // lybliu@cuit.edu.cn
        }
    }
}
