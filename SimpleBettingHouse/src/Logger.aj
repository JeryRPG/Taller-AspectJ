
<<<<<<< HEAD
=======

>>>>>>> 4a2b10963746a0751de87817f5a3f404a2ced6e1
public aspect Logger {

    pointcut success() : call(* signUp*(..) );
    after() : success() {
<<<<<<< HEAD
    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    }
=======
    //Aspecto ejemplo: solo muestra este mensaje despues de haber creado un usuario 
    	//System.out.println("**** User created ****");
    }
    
}
>>>>>>> 4a2b10963746a0751de87817f5a3f404a2ced6e1
