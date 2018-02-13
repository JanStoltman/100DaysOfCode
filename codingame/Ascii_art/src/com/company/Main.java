package com.company;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int W = in.nextInt();
        int H = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String T = in.nextLine();//65
        ArrayList<String> letters = new ArrayList<>();
        for (int i = 0; i < H; i++) {
            String ROW = in.nextLine();
            letters.add(ROW);
        }

        ArrayList<Integer> lettersNums = new ArrayList<>();
        for (char t : T.toUpperCase().toCharArray()) {
            if(t - 65 >= 0 && t - 65 <= 25) {
                lettersNums.add(t - 65);
            }else{
                lettersNums.add(26);
            }
        }

        String res = "";
        for (int h = 0; h < H; h++) {
            for (int i : lettersNums) {
                res += letters.get(h).substring(i * W, i * W + W);
            }
            res += '\n';
        }

        System.out.println(res);
    }
}
