package com.company;
import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcException;

import java.io.IOException;
import java.util.Objects;
import java.util.Scanner;
import java.util.Vector;

/**
 * Created by Jan Stoltman on 3/6/18.
 * stoltmanjan@gmail.com
 */
public class Client {
    public static void main(String[] args){
        try{
            System.out.println("Wpisz adres");
            Scanner r = new Scanner(System.in);
            String adres = r.next();
            if(Objects.equals(adres, "non")){adres = "http://localhost:10013";}
            XmlRpcClient srv = new XmlRpcClient(adres);

            show(srv,r);
            System.out.println("Wpisz polecenie. Adres to " + adres);
            String com = "";
            while(!Objects.equals(com, "exit")) {
                switch (r.next()) {
                    case "show": show(srv,r);
                        break;
                    case "xPower": xPower(srv,r);
                        break;
                    case "concatLen": concatLen(srv,r);
                        break;
                    case "stringBytesAdd":stringBytes(srv,r);
                        break;
                    case "asy":asy(srv,r);
                        break;
                    case "asy2":asy2(srv,r);
                        break;
                    default:System.out.println("Unknown command");
                        break;
                }
            }

        }catch(Exception e){
            System.err.println("Client error " + e);
        }
    }

    private static void asy2(XmlRpcClient srv, Scanner r) {
        AC cb = new AC();

        Vector<Object> params3 = new Vector<>();
        params3.addElement(r.next());
        params3.addElement(r.nextInt());
        srv.executeAsync("mojSerwer.asy2", params3, cb);

        Vector<Object> params4 = new Vector<>();
        params4.addElement(r.next());
        params4.addElement(r.nextInt());
        srv.executeAsync("mojSerwer.asy2", params4, cb);
    }

    private static void asy(XmlRpcClient srv, Scanner r) {
        AC cb = new AC();

        Vector<Object> params3 = new Vector<>();
        params3.addElement(r.nextInt());
        params3.addElement(r.nextDouble());
        srv.executeAsync("mojSerwer.asy", params3, cb);
    }

    private static void stringBytes(XmlRpcClient srv, Scanner r) throws XmlRpcException, IOException {
        Vector<Object> params2 = new Vector<Object>();
        params2.addElement(r.next());
        params2.addElement(r.nextDouble());

        Object bytesAdd = srv.execute("mojSerwer.stringBytesAdd", params2);
        int add = (Integer) bytesAdd;
        System.out.println("bytesAdd " + add);
    }

    private static void concatLen(XmlRpcClient srv, Scanner r) throws XmlRpcException, IOException {
        Vector<String> params1 = new Vector<>();
        params1.addElement(r.next());
        params1.addElement(r.next());

        Object resultConcat = srv.execute("mojSerwer.concatLen", params1);
        int cnt = (Integer) resultConcat;
        System.out.println("concatLen " + cnt);
    }

    private static void xPower(XmlRpcClient srv, Scanner r) throws XmlRpcException, IOException {
        Vector<Integer> params = new Vector<>();
        params.addElement(r.nextInt());
        params.addElement(r.nextInt());

        Object resultPoer = srv.execute("mojSerwer.xPower", params);
        int xPower = (Integer) resultPoer;
        System.out.println("xPower " + xPower);
    }

    private static void show(XmlRpcClient srv, Scanner r) throws XmlRpcException, IOException {
        Object s = srv.execute("mojSerwer.show", new Vector());
        String sh = (String) s;
        System.out.println("show:\n" + sh);
    }
}
