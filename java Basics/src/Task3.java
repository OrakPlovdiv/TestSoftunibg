import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;


public class Task3 {

	public static void main(String[] args) {
	Scanner input = new Scanner(System.in);
	String  strinput="5 -33  +12 -  55-  1 - 2 +6";
	String[] arraychar=new String[strinput.length()];
    String [] arraystr= new String[strinput.length()];
    
   ArrayList<Character> charList= new ArrayList<>();
    Double [] doubleArr=new Double[strinput.length()];
	
   for (int i = 0; i < arraystr.length; i++) {
	     	charList.add(strinput.charAt(i));
	}
	
   for (int i = 0; i < arraystr.length; i++) {
	    if( charList.get(i).toString().equals("+")){
	          arraychar[i]=charList.get(i).toString();
	          charList.set(i, '_');
	          
	    }if( charList.get(i).toString().equals("-")){
	          arraychar[i]=charList.get(i).toString();
	          charList.set(i, '_'); 
	    }if( charList.get(i).toString().equals(" ")){
	          charList.remove(i);
	    }
	    
	    
	   
    	
}

    
    

	}

}
