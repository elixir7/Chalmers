package delB;

import javax.swing.*;

//Beräkna PI

public class Upg12 {
	public static void main(String[] arg){
		
		JOptionPane.showMessageDialog(null, "PI is: " + calcPI());
		JOptionPane.showMessageDialog(null, "PI is: " + calcPIv2());

	}
	
	//Metod som beräknar pi genom den givna metoden
	public static double calcPI(){
		double answer = 1;
		double numb = 3;
		//Loopas för de första 500 termerna
		for(int i = 1; i < 500; i++){
			//Om talet är jämnt
			if((i % 2) == 0){
				answer += 1/numb;
			}else{
				answer -= 1/numb;
			}
			numb += 2;
		}
		
		return answer*4;
	}
	
	//Metod som beräknar pi sålänge som 1/nämnaren är större än 0.000001
	public static double calcPIv2(){
		double answer = 1;
		double numb = 3;
		int counter = 1;
		
		while((1/numb) >= 0.000001){
			//Om talet är jämnt
			if((counter % 2) == 0){
				answer += 1/numb;
				
			}else{
				answer -= 1/numb;
			}
			counter++;
			numb += 2;
			
		}
		return answer*4;
	}
}

