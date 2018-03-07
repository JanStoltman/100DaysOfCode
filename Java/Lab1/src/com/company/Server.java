package com.company;

import org.apache.xmlrpc.WebServer;
import org.apache.xmlrpc.XmlRpcServer;
import org.omg.CORBA.Object;

/**
 * Created by Jan Stoltman on 3/6/18.
 * stoltmanjan@gmail.com
 */
public class Server {
    public static void main(String[] args) {
        try{
            int port = 10013;
            WebServer server = new WebServer(port);
            server.addHandler("mojSerwer", new Server());
            server.start();
            System.out.println("Start serwera na porcie " + port);

        }catch(Exception e){
            System.err.println("Error " + e);
        }
    }

    public Integer xPower(int x, int pwr) {
        return (int) Math.pow(x, pwr);
    }

    public Integer concatLen(String a1, String a2) {
        return (a1 + a2).length();
    }

    public Integer stringBytesAdd(String a1, double a2){
        return (a1.getBytes().length + (a2 + "").getBytes().length);
    }

    public double asy(int x, double z){
        System.out.println("Asy start");
        try{
            Thread.sleep(x);
        } catch (InterruptedException e) {
            e.printStackTrace();
            Thread.currentThread().interrupt();
        }

        System.out.println("Asy koniec");
        return (x * z);
    }

    public Boolean asy2(String x, int z){
        System.out.println("Asy2 start");
        for(int i = 0; i < z; i++){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
                Thread.currentThread().interrupt();
            }

            System.out.println(x);
        }
        System.out.println("Asy koniec");
        return Boolean.TRUE;
    }

    public String show(){
        String doc = "xPower i1 i2\nconcatLen s1 s2\nstringBytesAdd s1 d1\n~asy i1 d1\n~asy2 s1 i1";
        System.out.println(doc);
        return doc;
    }
}
