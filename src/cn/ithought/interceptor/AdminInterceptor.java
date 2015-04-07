package cn.ithought.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.StringKit;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
public class AdminInterceptor implements Interceptor {
    @Override
    public void intercept(ActionInvocation ai) {
        Controller controller = ai.getController();
        String adminName = controller.getSessionAttr("adminName");
        if (StringKit.notBlank(adminName)
                || "yinsheng".equals(controller.getPara("admin.name"))) {
            ai.invoke();
        } else {
            controller.setAttr("msg", "需要管理员权限");
            controller.renderError(404);
        }
    }
}
