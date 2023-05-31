

public aspect Logger {

    pointcut success() : call(* signUp*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje despues de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}