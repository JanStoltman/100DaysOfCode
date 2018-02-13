package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String MESSAGE = in.nextLine();
        String x = "";
        for (byte b : MESSAGE.getBytes()) {
            x = x.concat("0000000".substring(Integer.toBinaryString(b).length()) + Integer.toBinaryString(b));
        }
        String res = "";
        String temp = "";
        char e = 'x';
        for (char c : x.toCharArray()) {
            if (c == e) {
                temp += '0';
            } else {
                res += temp.isEmpty() ? temp : temp + ' ';
                temp = "";
                if (c == '1') {
                    temp += "0 0";
                } else if (c == '0') {
                    temp += "00 0";
                }

                e = c;
            }
        }

        res += temp;
        //00 0 0 0 00 00 0 0 00 0 0 0

        System.out.println(res);
    }
}
