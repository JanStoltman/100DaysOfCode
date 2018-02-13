package com.company;

import java.util.Scanner;
import java.util.TreeMap;

public class Main {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt(); // Number of elements which make up the association table.
        int Q = in.nextInt(); // Number Q of file names to be analyzed.
        TreeMap<String, String> exts = new TreeMap<>();
        for (int i = 0; i < N; i++) {
            String EXT = in.next(); // file extension
            String MT = in.next(); // MIME type.
            exts.put(EXT, MT);
        }
        in.nextLine();

        for (int i = 0; i < Q; i++) {
            String FNAME = in.nextLine(); // One file name per line.
            /*Pattern pattern = Pattern.compile("[a-z]*\\.+");
            Matcher matcher = pattern.matcher(FNAME.substring(FNAME.lastIndexOf('.')));
            matcher.find();
            String z = matcher.group(1);*/
            String z = FNAME.substring(FNAME.lastIndexOf('.') +1 );
            System.out.println(exts.get(z) != null ? exts.get(z) : "UNKNOWN");
        }
    }
}
