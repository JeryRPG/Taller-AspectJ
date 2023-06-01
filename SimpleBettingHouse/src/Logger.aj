/**
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

import com.bettinghouse.Person;
import com.bettinghouse.User;
public aspect Logger {
String filePath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "log.txt"; 
Calendar cal = Calendar.getInstance();


    pointcut success() : call(* signUp*(..) );
    after() : success() {

    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    

    //Aspecto ejemplo: solo muestra este mensaje despues de haber creado un usuario 
    	//System.out.println("**** User created ****");
    
    

	// Aspecto: Punto de corte para el método signUp
	pointcut signUpPointcut(User user, Person person) : call(void successfulSignUp (User, Person)) && args(user, person);
	
	
	
	
	after(User user, Person person) returning : signUpPointcut(user, person) {
	File file = new File(filePath);
	
	String logMessage = "Usuario registrado: [nickname = " + user.getNickname() + ", password = " + user.getPassword() + "] Fecha: ["+ cal.getTime()+"]";
	
	try {
	FileWriter writer = new FileWriter(file, true);
	writer.write(logMessage + "\n");
	writer.close();
	} catch (IOException e) {
	e.printStackTrace();
	}
	
System.out.println("**** User created ****"+ user.getNickname());
}
}
**/
