package delB;
import javax.swing.*;

//Höjd och distansräknare

public class Upg9 {
	public static void main(String[] arg){
		double speed, angle;
		String indata = JOptionPane.showInputDialog("Speed:");
		speed = Double.parseDouble(indata);
		indata = JOptionPane.showInputDialog("Angle: (degrees)");
		//Konverterar grader till radianer för att senare kunna användas med Math.sin()
		angle = (Double.parseDouble(indata) / 360) * 2 * Math.PI;
		
		JOptionPane.showMessageDialog(null, "Height: " + String.format("%.3f", heightCalc(speed, angle)) + "m, Distance: " + String.format("%.3f", distanceCalc(speed, angle)) + "m");
		
		
		
	}
	
	//Metod som räknar ut höjden med den givna formeln
	public static double heightCalc(double v, double a){
		double g = 9.82;
		double answer = (Math.pow(v, 2) * Math.pow(Math.sin(a), 2)) / (2*g);
		return answer;
	}
	//Metod som räknar ut distansen med den givna formeln
	public static double distanceCalc(double v, double a){
		double g = 9.82;
		double answer = (Math.pow(v, 2)*Math.sin(2*a)) / g;
		return answer;
	}
}

