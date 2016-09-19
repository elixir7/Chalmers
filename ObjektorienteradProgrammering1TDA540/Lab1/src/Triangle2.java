import javax.swing.*;

public class Triangle2 {
	public static void main(String[] arg) {
		double kateter1, kateter2, hypotenusa;
		String indata = JOptionPane.showInputDialog("Kateter1:");
		kateter1 = Integer.parseInt(indata);
		indata = JOptionPane.showInputDialog("Kateter2:");
		kateter2 = Integer.parseInt(indata);

        hypotenusa = Math.sqrt(Math.pow(kateter1, 2) + Math.pow(kateter2, 2));
        JOptionPane.showMessageDialog(null, "En rätvinklig triangel med sidorna " + kateter1 + " och " + kateter2 + " har hypotenusan " + hypotenusa);
    }
}
