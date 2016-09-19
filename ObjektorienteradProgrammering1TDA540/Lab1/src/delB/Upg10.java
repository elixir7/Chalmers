package delB;
import javax.swing.*;
import java.util.*;

//Räkna ut om båten är en 12:a

public class Upg10 {
	public static void main(String[] arg){
		
		String input = JOptionPane.showInputDialog("Ange värden:");
		
		//Gör en scanner som tar flera värden i en textruta genom
		Scanner scan = new Scanner(input);
		double d = scan.nextDouble();
		double A = scan.nextDouble();
		double L = scan.nextDouble();
		double f = scan.nextDouble();
		
		JOptionPane.showMessageDialog(null, "Båten är: " +  calc(d, A, L, f)); 
	}
	
	//Metod som returnar en sträng med text om den blev godkänd eller inte
	public static String calc(double d, double A, double L, double f){
		double answer = (2 * d + Math.sqrt(A) + L - f) / 2.37;
		if(answer >= 11.95 && answer <= 12.05){
			return "Godkänd med " + String.format("%.2f", answer);
		}
		return "Underkänd med " + String.format("%.2f", answer);
	}
}
