package cn.ithought.interceptor;

import java.util.regex.Pattern;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

/**
 * @author yin.sheng
 * @email yinsheng92@hotmail.com
 * @date 2014年8月26日
 */
public class UrlParaInterceptor implements Interceptor {

    @Override
    public void intercept(ActionInvocation ai) {
        Controller c = ai.getController();
        boolean check = Pattern.matches("^[1-9]\\d*$", c.getPara(0, "1"));
        if (check) {
            ai.invoke();
        } else {
            c.renderError(404);
        }

    }
}
