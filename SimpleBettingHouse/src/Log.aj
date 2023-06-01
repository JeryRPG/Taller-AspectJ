import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import com.bettinghouse.User;


public aspect Log {
    String filePath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "log.txt";
    Calendar cal = Calendar.getInstance();
    pointcut loginPointCut(User user) : call(void effectiveLogIn (User)) && args(user);
    after(User user) returning : loginPointCut(user) {
    	File file = new File(filePath);
        String logMessage = "Sesión iniciada por usuario: [" + user.getNickname() + "] Fecha: [" + cal.getTime() + "]";

        try {
            FileWriter writer = new FileWriter(file, true);
            writer.write(logMessage + "\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("** Login **");
    }

    pointcut logoutPointerCut(User user) : call(void effectiveLogOut (User)) && args(user);
    after(User user) returning : logoutPointerCut(user) {
        String logMessage = "Sesión cerrada por usuario: [nickname = " + user.getNickname() + "] Fecha: [" + cal.getTime() + "]";
    	File file = new File(filePath);
        try {
            FileWriter writer = new FileWriter(file, true);
            writer.write(logMessage + "\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("** User Log out ** " + user.getNickname());
    }
}
