package domain;

public enum Status {
    ONLINE("Online"),
    OFFLINE("Offline"),
    BUSY("Busy"),
    CUSTOM("Custom");

    private final String message;
    Status(String msg){
        this.message = msg;
    }

    @Override
    public String toString(){
        return message;
    }
}
