import java.io.*;
import java.util.*;

public class Main {

    //Pre Uppgift 1
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
    public static void main(String[] args) throws FileNotFoundException {

        SoundDevice device = new SoundDevice();
        Song song = new Song(20);

        File textSong = new File("elise.txt");
        String path = textSong.getAbsolutePath();

        System.out.println(path);
        Scanner sc = new Scanner(path);

        while(sc.hasNext()) {
            String i = sc.next();
            System.out.println(i);
        }
        sc.close();

        song.play(device);
        song.save(device.getFormat(),new File("testing"));

        /*
        song.add(MusicUtils.harmonic(-2, 0.5));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(3, 0.7));

        song.add(MusicUtils.harmonic(-2, 0.5));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(4, 0.3));
        song.add(MusicUtils.harmonic(3, 0.6));

        song.add(MusicUtils.harmonic(-2, 0.5));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(3, 0.7));
        song.add(MusicUtils.harmonic(1, 0.5));
        song.add(MusicUtils.harmonic(-2, 0.7));
        */
    }//main



}//Main
