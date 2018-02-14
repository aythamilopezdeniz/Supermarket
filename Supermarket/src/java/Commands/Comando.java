package Commands;

public class Comando {
    private static String comando;

    public Comando(String parameter) {
        comando = parameter;
    }

    public static Comando find(String parameter) {
        setComando(parameter);
        return new Comando(parameter);
    }

    private static void setComando(String parameter) {
        comando = parameter;
    }
}