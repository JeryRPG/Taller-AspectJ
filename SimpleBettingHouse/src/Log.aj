import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import com.bettinghouse.User;

@Aspect
public aspect Log {
    String filePath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "log.txt";
    Calendar cal = Calendar.getInstance();

    @Pointcut("call(void effectiveLogIn(User)) && args(user)")
    public void signUpPointcut(User user) {}

    @After("signUpPointcut(user)")
    public void logSuccessfulLogin(User user) {
        String logMessage = "Sesión iniciada por usuario: [" + user.getNickname() + "] Fecha: [" + cal.getTime() + "]";

        try {
            FileWriter writer = new FileWriter(filePath, true);
            writer.write(logMessage + "\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("**** Login ****");
    }

    @Pointcut("execution(* com.bettinghouse.User.logout()) && target(user)")
    public void logoutPointcut(User user) {}

    @After("logoutPointcut(user)")
    public void logSuccessfulLogout(JoinPoint joinPoint, User user) {
        String logMessage = "Sesión cerrada por usuario: [nickname = " + user.getNickname() + "] Fecha: [" + cal.getTime() + "]";

        try {
            FileWriter writer = new FileWriter(filePath, true);
            writer.write(logMessage + "\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("**** User Log out **** " + user.getNickname());
    }
}
