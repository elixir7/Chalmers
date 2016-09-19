import javax.swing.*;

public class Pris2 {
    public static void main(String[] args) {
        String indata = JOptionPane.showInputDialog("Ange varans pris i kronor: ");
        double perStyck = Double.parseDouble(indata);

        indata = JOptionPane.showInputDialog("Ange antalet enheter av varan: ");
        int antal = Integer.parseInt(indata);

        double bruttoPris = antal * perStyck;
        double nettoPris;
        double rabatt;

        if (bruttoPris > 3000 )
            rabatt = bruttoPris * 0.15;
        else if(bruttoPris > 1500)
        	rabatt = bruttoPris * 0.10;
        else if(bruttoPris > 750)
        	rabatt = bruttoPris * 0.05;
        else
        	rabatt = 0;

        nettoPris = bruttoPris - rabatt;

        JOptionPane.showMessageDialog(null, "Brutto: " + bruttoPris + " Rabatt: " + rabatt + " Netto: " + nettoPris + " kronor.\n");
    }
}
