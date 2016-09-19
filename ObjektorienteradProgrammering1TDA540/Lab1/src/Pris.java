// Programmet l�ser in hur mycket en vara kostar per styck, hur m�nga enheter av varan
// som k�pts samt ber�knar och skriver ut totala priset efter att 10 procents rabatt erh�llits om
// totalpriset �verstiger 1000 kr.

import javax.swing.*;

public class Pris {
    public static void main(String[] args) {
        String indata = JOptionPane.showInputDialog("Ange varans pris i kronor: ");
        double perStyck = Double.parseDouble(indata);

        indata = JOptionPane.showInputDialog("Ange antalet enheter av varan: ");
        int antal = Integer.parseInt(indata);

        double bruttoPris = antal * perStyck;
        double nettoPris;
        double rabatt;

        if (bruttoPris > 1000)
            rabatt = bruttoPris * 0.1;
        else
            rabatt = 0;

        nettoPris = bruttoPris - rabatt;

        JOptionPane.showMessageDialog(null, "Priset blir: " + nettoPris + " kronor.\n");
    }
}
