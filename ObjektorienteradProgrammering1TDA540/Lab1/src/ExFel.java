import javax.swing.*;

public class ExFel {
    public static void main(String[] arg) {
        double tal1, tal2, tal3;
        String indata = JOptionPane.showInputDialog("Ange första talet:");
        tal1 = Integer.parseInt(indata);
        indata = JOptionPane.showInputDialog("Ange andra talet");
        tal2 = Integer.parseInt(indata);
        tal3 = tal1 / tal2;
        JOptionPane.showMessageDialog(null, "Resultatet blev " + tal3);
    }
}
