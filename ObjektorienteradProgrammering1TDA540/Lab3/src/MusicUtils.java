/**
 * Created by isak on 06/10/16.
 */
import java.util.*;
import java.lang.Math;

public class MusicUtils {

    //before: nothing
    //after: returns a array with values of a sine wave
    public static double[] sine(double freq, double duration) {
        int n = (int)(duration*SoundDevice.SAMPLING_RATE);
        double[] a = new double[n];
        double dx = 2*Math.PI*freq / SoundDevice.SAMPLING_RATE;
        for (int i = 0; i < n; i = i + 1) {
            a[i] = Math.sin(i * dx);
        }
        return a;
    }//sine

    //before: nothing
    //after: returns an array with values of a sound wave mimicing plucking a string
    public static double[] pluck(double freq, double duration){

        //Create the array
        int n = (int)(duration*SoundDevice.SAMPLING_RATE);
        double[] a = new double[n];

        //Mutekonstant
        double K = 0.499;


        double p = SoundDevice.SAMPLING_RATE / freq;

        for(int i = 0; i < n; i++){
            //Fill the p first values with random numbers between [-1, 1]
            if(i <= p){
                double rand = new Random().nextDouble() * 2 - 1;
                a[i] = rand;
            }else {
                a[i] = (a[i - (int)p] + a[i - ((int)p - 1)]) * K;
            }
        }
        return a;
    }//pluck

    //before: assuming pitch is a integer representing a note on the muscial scale ( 0 => A, 3 => C, -4 => F )
    //after: returns a array with values from a sound wave mimicing plucking a string
    public static double[] note(int pitch, double duration){

        double freq = 440 * Math.pow(2, ((double)pitch/12));

        return pluck(freq, duration);
    }//note


    //before: takes 2 arrays, both being equal length
    //after: returns a new array with index values being the mean value of each index value of both arrays
    public static double[] average(double[] t1, double[] t2){
        double[] a = new double[t1.length];

        for(int i = 0; i < t1.length; i++){
            double average = (t1[i] + t2[i]) / 2;
            a[i] = average;
        }
        return a;
    }//average

    //before: assuming pitch is a integer representing a note on the muscial scale ( 0 => A, 3 => C, -4 => F )
    public static double[] harmonic(int pitch, double duration){
        double[] a = average( note(pitch + 12, duration), note(pitch - 12, duration) );
        double[] harmonic =  average( note(pitch, duration), a);

        return harmonic;
    }//harmonic


}
