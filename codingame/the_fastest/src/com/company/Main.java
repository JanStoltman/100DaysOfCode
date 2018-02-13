package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        String[] bestTime = new String[]{
                "99", "99", "99"
        };
        String[] tt = new String[3];

        for (int i = 0; i < N; i++) {
            String t = in.next();
            tt = t.split(":");

            if (Integer.valueOf(bestTime[0]) > Integer.valueOf(tt[0])) {
                bestTime = tt;
            } else if (Integer.valueOf(bestTime[0]) == Integer.valueOf(tt[0])) {
                if (Integer.valueOf(bestTime[1]) > Integer.valueOf(tt[1])) {
                    bestTime = tt;
                } else if (Integer.valueOf(bestTime[1]) == Integer.valueOf(tt[1])) {
                    if (Integer.valueOf(bestTime[2]) > Integer.valueOf(tt[2])) {
                        bestTime = tt;
                    } else if (Integer.valueOf(bestTime[2]) == Integer.valueOf(tt[2])) {
                        continue;
                    }
                }
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        System.out.println(bestTime[0] + ":" + bestTime[1] + ":" + bestTime[2]);
    }
}
