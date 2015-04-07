package cn.ithought.interceptor;

import javax.servlet.http.HttpServletRequest;

import cn.ithought.model.Essay;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
public class EssayInterceptor implements Interceptor {

    public void intercept(ActionInvocation ai) {
        Controller controller = ai.getController();
        Essay.DAO.addEssayPV(getRemoteAddress(controller.getRequest()),
                controller.getParaToInt(0, 1));
        CacheKit.remove("essayPV", "essayPV");
        ai.invoke();
    }

    // 获取客户端ip地址
    public String getRemoteAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
