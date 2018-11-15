package kasi.learning;

public class Date {
    private int year;
    private int month;
    private int day;

    private final int startYear = 2000;
    private final int startMonth = 1;
    private final int startDay = 1;
    private final int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    private final String[] weekDays = {"Lördag", "Söndag", "Måndag", "Tisdag", "Onsdag", "Torsdag", "Fredag"};

    public Date(int year, int month, int day){
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public String weekDay(){
        int daysElapsed = 0;

        //Hitta rätt år.
        for(int i = startYear; i < year; i++){
            daysElapsed += 365;
            if((i % 4 == 0 && (i % 100 != 0)) || i % 400 == 0){
                 daysElapsed++;
            }
        }
        //        //Hitta rätt Månad
        for(int i = startMonth; i < month; i++){
            if(i == 2 && (year % 4 == 0)){
                //skottår
                daysElapsed += 29;
            }else{
                daysElapsed += months[i-1];
            }
        }

        //Hitta rätt dag
        for(int i = startDay; i < day; i++){
            daysElapsed++;
        }

        int weekday = daysElapsed % 7;

        System.out.println(daysElapsed);
        return weekDays[weekday];
    }
}
