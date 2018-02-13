package com.company;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Player {
    private static StringBuilder builder = new StringBuilder();

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int factoryCount = in.nextInt(); // the number of factories
        int linkCount = in.nextInt(); // the number of links between factories
        ArrayList<Link> links = new ArrayList<Link>();
        for (int i = 0; i < linkCount; i++) {
            int factory1 = in.nextInt();
            int factory2 = in.nextInt();
            int distance = in.nextInt();
            links.add(new Link(factory1, factory2, distance));
        }

        // game loop
        while (true) {
            int entityCount = in.nextInt(); // the number of entities (e.g. factories and troops)
            Map<Integer, MFactory> factories = new HashMap<>();

            for (int i = 0; i < entityCount; i++) {
                int entityId = in.nextInt();
                String entityType = in.next();
                int playerNum = in.nextInt();
                int arg2 = in.nextInt();
                int arg3 = in.nextInt();
                int arg4 = in.nextInt();
                int arg5 = in.nextInt();

                if (entityType.equals("FACTORY")) {
                    MFactory factory = new MFactory(entityId, playerNum, arg2, arg3);

                    for (Link l : links) {
                        if (l.from == factory.id) {
                            factory.mLinks.add(l);
                        }
                    }

                    factories.put(entityId, factory);
                }
            }

            for (MFactory factory : factories.values()) {
                factory.mLinks.sort((o1, o2) -> Integer.compare(factories.get(o2.to).production, factories.get(o1.to).production));
            }

            for (MFactory mFac : factories.values()) {
                if (mFac.isMine()) {
                    if ((mFac.production > 0 || builder.toString().isEmpty()) && mFac.cyborgs > 10) {
                        for (Link l : mFac.mLinks) {
                            MFactory tFac = factories.get(l.to);
                            if (tFac.isEnemy()) {
                                if (tFac.cyborgs < mFac.cyborgs) {
                                    appendCommand(createMoveCommand(l.from, l.to, mFac.cyborgs / 2));
                                }
                                break;
                            } else if (tFac.isNeutral()) {
                                appendCommand(createMoveCommand(l.from, l.to, mFac.cyborgs / 2));
                                break;
                            } else if (tFac.isMine()) {
                                if (tFac.cyborgs * 5 < mFac.cyborgs) {
                                    appendCommand(createMoveCommand(l.from, l.to, mFac.cyborgs / 2));
                                }
                                break;
                            }
                        }
                    } else if (mFac.production == 0) {
                        for (Link l : mFac.mLinks) {
                            MFactory tFac = factories.get(l.to);
                            if (tFac.isNeutral() && mFac.cyborgs > 10) {
                                appendCommand(createMoveCommand(l.from, l.to, mFac.cyborgs / 2));
                                break;
                            } else if (tFac.isEnemy() && (tFac.cyborgs + tFac.production * l.distance) < mFac.cyborgs) {
                                appendCommand(createMoveCommand(l.from, l.to, mFac.cyborgs));
                                break;
                            }
                        }
                    }
                }
            }


            launchCommands();
        }
    }

    private static String createMoveCommand(int from, int to, int cyborgsCount) {
        return "MOVE " + from + " " + to + " " + cyborgsCount;
    }

    private static void appendCommand(String command) {
        builder.append(command);
        builder.append(';');
    }

    private static void launchCommands() {
        String command = builder.toString();
        if (command.isEmpty()) {
            System.out.println("WAIT");
        } else {
            System.out.println(command.substring(0, command.length() - 1));
        }

        builder = new StringBuilder();
    }

    static class Link {
        int from, to, distance;

        public Link(int from, int to, int distance) {
            this.from = from;
            this.to = to;
            this.distance = distance;
        }
    }

    static class MFactory {
        public int playerNum;
        public int cyborgs;
        public int production;
        public int id;
        public ArrayList<Link> mLinks = new ArrayList<>();

        public MFactory(int id, int playerNum, int cyborgs, int production) {
            this.id = id;
            this.playerNum = playerNum;
            this.cyborgs = cyborgs;
            this.production = production;
        }

        public boolean isMine() {
            return playerNum == 1;
        }

        public boolean isEnemy() {
            return playerNum == -1;
        }

        public boolean isNeutral() {
            return playerNum == 0;
        }
    }
}