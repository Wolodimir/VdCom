package org.trainTask;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Train {

    private final List<Wagon> wagons = new ArrayList<>();

    public Train(int numberOfWagons) {
        Random r = new Random();
        for (int i = 0; i < numberOfWagons; i++) {
            wagons.add(new Wagon(i + 1, r.nextBoolean()));
        }
    }

    public void showTrain() {
        wagons.forEach(wagon -> System.out.println("Номер вагона: " + wagon.getNumber() +
                " Свет: " + wagon.isLighting()));
    }

    public int wagonsCount() {
        wagons.getFirst().setLighting(true);
        int count = 0;
        for (int i = 1; i <= 1000; i++) {
            count = i;
            if (i == wagons.size()) {
                i = 0;
            }
            if (wagons.get(i).isLighting()) {
                wagons.get(i).setLighting(false);
                i = 0;
            }
            if (!wagons.getFirst().isLighting()) {
                return count;
            }
        }
        return count;
    }

}
