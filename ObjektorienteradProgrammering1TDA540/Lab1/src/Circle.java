//This program reads the radius of a circle and prints its are

import javax.swing.*;

public class Circle {
    public static void main(String[] args) {
        String input = JOptionPane.showInputDialog("Enter the radius of the circle: ");
        double radius = Double.parseDouble(input);
        double area = Math.PI * Math.pow(radius, 2);
        JOptionPane.showMessageDialog(null, "The area of the circle is " + area);
    }
}
