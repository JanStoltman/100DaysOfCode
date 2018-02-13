package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt(); // the number of temperatures to analyse
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String temps = in.nextLine(); // the n temperatures expressed as integers ranging from -273 to 5526
        int temp = Integer.MAX_VALUE;

        for(String t : temps.split(" ")){
            if(Math.abs(Integer.valueOf(t)) < Math.abs(temp)) temp = Integer.valueOf(t);
        }


        System.out.println(temp == Integer.MAX_VALUE ? 0 : temp);
    }
}
