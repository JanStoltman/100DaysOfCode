package com.company;

import java.util.Scanner;

public class Main {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int lightX = in.nextInt(); // the X position of the light of power
        int lightY = in.nextInt(); // the Y position of the light of power
        int thorX = in.nextInt(); // Thor's starting X position
        int thorY = in.nextInt(); // Thor's starting Y position

        // game loop
        while (true) {
            int remainingTurns = in.nextInt(); // The remaining amount of turns Thor can move. Do not remove this line.
            String direction = "";

            if(lightY > thorY){
                direction += "S";
                thorY++;
            }else if(lightY < thorY){
                direction += "N";
                thorY--;
            }

            if(lightX > thorX){
                direction+="E";
                thorX++;
            }else if(lightX < thorX){
                direction+="W";
                thorY--;
            }

            // A single line providing the move to be made: N NE E SE S SW W or NW
            System.out.println(direction);
            direction = "";
        }
    }
}
