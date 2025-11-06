package org.trainTask;

import java.util.Random;

public class Main {

    public static void main(String[] args) {
        int rand;
        Random r = new Random();
        rand = r.nextInt(1,100);
        Train train = new Train(rand);
        train.showTrain();
        System.out.println(train.wagonsCount());
    }
}