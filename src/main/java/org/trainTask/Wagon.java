package org.trainTask;

public class Wagon {

    private int number;
    private boolean lighting;

    public Wagon(int number, boolean lighting) {
        this.number = number;
        this.lighting = lighting;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public boolean isLighting() {
        return lighting;
    }

    public void setLighting(boolean lighting) {
        this.lighting = lighting;
    }
}
