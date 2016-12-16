import javax.swing.*;

public interface GUI {
    void checkGameStatus();
    Game buildTowerDefence();
    JPanel getLandscapePanel();
    JLabel getIconLabel(String fileName);
    void setMonsterPanel(JPanel norPanel);
    void setDefaultPanel(JPanel panel);
}
