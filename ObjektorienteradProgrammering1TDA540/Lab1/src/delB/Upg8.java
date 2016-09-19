package delB;
import javax.swing.*;



public class Upg8 {
	public static void main(String[] arg){
		String indata = JOptionPane.showInputDialog("Vad kostar 1 Euro just nu? (svara i sek");
		double euroValue, ratio, pengar, resultat;
		euroValue = Double.parseDouble(indata);
		
		//Skapar en växelkurs
		ratio = 1 / euroValue;
		
		indata = JOptionPane.showInputDialog("Skriv in ett belopp:");
		pengar = Double.parseDouble(indata);
		
		//Räknar ut det nya värdet i Euro
		resultat = pengar * ratio;
		
		JOptionPane.showMessageDialog(null, pengar + "kr är " + String.format("%.2f", resultat) + "eur."); //String.format omvandlar vår double resultat till en sträng och avgränsar decimalerna till 2st.
		
		
		
	}
}
