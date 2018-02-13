package com.company;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.Scanner;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Main {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();

        Deque<Integer> steps = new ArrayDeque<>();
        int step = 0;

        while (N > 0) {
            if (step + 1 <= N) {
                step++;
                N -= step;
                steps.add(step);
            }else {
               N += steps.pollFirst();
            }
        }

        steps.forEach(Main::printPyrLn);
    }

    private static void printPyrLn(int step) {
        for (int i = 0; i < step; i++) {
            System.out.print('*');
        }

        System.out.println();
    }
}