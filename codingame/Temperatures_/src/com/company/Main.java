package com.company;

import java.util.Scanner;

public class Main {
    public static void main(String args[]) {
        Scanner i = new Scanner(System.in);
        int n = i.nextInt();
        if (i.hasNextLine()) {
            i.nextLine();
        }
        String t = i.nextLine();
        int l = 99;
        if (t != null && t.length() > 0) {
            for (String s : t.split(" ")) {
                int z = Integer.valueOf(s);
                if (Math.abs(z) < Math.abs(l)) l = z;
                else if (Math.abs(z) == Math.abs(l)) l = Math.max(l, z);
            }
        }
        System.out.println(l != 99 ? l : "0");
    }
}
