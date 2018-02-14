package Commands;

public class CommandHelper {
    private final Comando comando;

    public CommandHelper(Comando comando) {
        this.comando = comando;
    }

    public Comando getComando() {
        return comando;
    }
}