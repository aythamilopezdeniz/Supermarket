package Commands;

import java.io.IOException;
import javax.servlet.ServletException;

public class Categoria extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        forward(request.getParameter("window"));
    }
    
}
