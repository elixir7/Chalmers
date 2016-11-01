import javax.swing.*;
import java.io.*;
import java.util.*;
import java.lang.*;

public class Main {

    //Pre Uppgift 1
    //before: nothing
    //after: plays two notes mimicking a sine wave
    /*
    public static void main(String[] args) {
        SoundDevice device = new SoundDevice();
        Song song = new Song(5);
        song.add(MusicUtils.sine(440,2));
        song.add(MusicUtils.sine(880,2));
        song.play(device);
        song.save(device.getFormat(),new File("sinetest.wav"));
    }//main
    */

    //Uppgift 1
    //before: nothing
    //after: plays two notes mimicking plucking a string
    /*
    public static void main(String[] args) {
        SoundDevice device = new SoundDevice();
        Song song = new Song(5);
        song.add(MusicUtils.pluck(440,2));
        song.add(MusicUtils.pluck(880,2));
        song.play(device);
        song.save(device.getFormat(),new File("plucktest.wav"));
    }//main
    */

    //Uppgift 2
    //before: nothing
    //after: plays "Gubben noak" with notes mimicking plucking a string and saves the song as a wav file
    /*
    public static void main(String[] args) {
        SoundDevice device = new SoundDevice();
        Song song = new Song(10);
        song.add(MusicUtils.note(-9, 0.4));
        song.add(MusicUtils.note(-9, 0.4));
        song.add(MusicUtils.note(-9, 0.4));
        song.add(MusicUtils.note(-5, 0.4));
        song.add(MusicUtils.note(-7, 0.4));
        song.add(MusicUtils.note(-7, 0.4));
        song.add(MusicUtils.note(-7, 0.4));
        song.add(MusicUtils.note(-4, 0.4));
        song.add(MusicUtils.note(-5, 0.4));
        song.add(MusicUtils.note(-5, 0.4));
        song.add(MusicUtils.note(-7, 0.4));
        song.add(MusicUtils.note(-7, 0.4));
        song.add(MusicUtils.note(-9, 1));+
        song.play(device);
        song.save(device.getFormat(),new File("tonetest.wav"));
    }//main
    */

    //Uppgift 3
    //before: nothing
    //after: plays "Smoke on the water" with notes of harmonicas and saves the song as a wav file
    /*
    public static void main(String[] args) {
        SoundDevice device = new SoundDevice();
        Song song = new Song(10);
        song.add(MusicUtils.harmonic(-2, 0.5));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(3, 0.7));

        song.add(MusicUtils.harmonic(-2, 0.5));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(4, 0.3));
        song.add(MusicUtils.harmonic(3, 0.7));

        song.add(MusicUtils.harmonic(-2, 0.5));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(3, 0.7));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(-2, 0.7));
        song.play(device);
        song.save(device.getFormat(),new File("smoke-on-the-water.wav"));
    }//main
    */

    //Uppgift 4
    //before: takes a textfile (.txt) to read notes and duration from as the first argument
    //        takes an integer as the second parameter to set the tempo as the second argument (default: 240notes/min)
    //after: creates a (.wav) file with the information of the submitted file
    public static void main(String[] args) throws FileNotFoundException {

        SoundDevice device = new SoundDevice();
        Song song = new Song(15);

        //the file name is supplied by "Program Arguments"
        if(args.length >= 1 ){
            File testSong = new File(args[0]);

            Scanner sc = new Scanner(testSong);

            //k is second per whole note(tempo)
            double k;
            //if tempo is supplied via program arguments, set the tempo, if not use 240notes/min
            if (args.length == 2) {
                k = 240 / Double.parseDouble(args[1]);
            } else {
                k = 1;
                System.out.println("Tempo was not supplied via program arguments, setting tempo to 240notes/min");
            }

            boolean finishedReadingFile = false;

            while (!finishedReadingFile) {
                if (sc.hasNextLine() && sc.hasNext()) {
                    int pitch = sc.nextInt();
                    double duration = sc.nextDouble() * k;
                    song.add(MusicUtils.note(pitch, duration));
                } else {
                    finishedReadingFile = true;
                }
            }

            sc.close();

            song.play(device);
            song.save(device.getFormat(), new File("elise.wav"));

        }else{
            JOptionPane.showMessageDialog(null, "Text file was not supplied via program arguments! \nTry Again");
        }
    }//main


}//Main
