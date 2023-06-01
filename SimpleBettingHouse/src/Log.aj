import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

<<<<<<< HEAD
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import com.bettinghouse.User;

@Aspect
public class Log {
    String filePath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "log.txt";
    Calendar cal = Calendar.getInstance();

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
=======

import com.bettinghouse.User;


public aspect Log {
	String filePath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "log.txt";
	Calendar cal = Calendar.getInstance();

	// Aspecto: Punto de corte para el método signUp
	pointcut signUpPointcut(User user) : call(void effectiveLogIn (User)) && args(user);

	after(User user) returning : signUpPointcut(user) {
		File file = new File(filePath);

		String logMessage = "Sesion iniciada por usuario: ["+ user.getNickname()+ "] Fecha: ["+ cal.getTime()+"]";

		try {
			FileWriter writer = new FileWriter(file, true);
			writer.write(logMessage + "\n");
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("**** Login ****");
	}
}
>>>>>>> 4a2b10963746a0751de87817f5a3f404a2ced6e1
