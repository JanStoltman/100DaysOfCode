package com.company;

import org.apache.xmlrpc.AsyncCallback;

import java.net.URL;

/**
 * Created by Jan Stoltman on 3/6/18.
 * stoltmanjan@gmail.com
 */
public class AC implements AsyncCallback {
    @Override
    public void handleResult(Object o, URL url, String s) {
        System.out.println("Wynik async " + o.toString());
    }

    @Override
    public void handleError(Exception e, URL url, String s) {
        System.out.println("Error async " + e.toString());
    }
}
