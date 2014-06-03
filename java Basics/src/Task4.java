
import java.awt.List;
import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

public class Task4 {

	public static void main(String[] args) {
    Scanner input = new Scanner(System.in); 
    int count= input.nextInt();
    String IP=null;
    ArrayList<String>arraList= new ArrayList<>();
   Map<String, ArrayList<String>> ipmap = new HashMap<String,ArrayList<String>>();
   Map<String,ArrayList<Integer>> durationmap = new HashMap<String,ArrayList<Integer>>();
   
    for (int i = 0; i < count; i++) {
		String ip=input.next();
		IP= ip;
		String name=input.next();
		
		int duration=input.nextInt();
		arraList.add(ip);
		ipmap.put(name, new ArrayList<String>(Arrays.asList(ip)));
		durationmap.put(name,new ArrayList<>(Arrays.asList(duration)));
	}
   
   for (Map.Entry<String,ArrayList<String>>empty :ipmap.entrySet()) {
	  
		   
		   System.out.printf(empty.getKey() +" "+durationmap.get(empty.getKey()).subList(1, 100) +""+empty.getValue().toString());
	   }
	  
	}
    
	}

