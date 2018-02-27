package Servlet;

import Commands.UnknownCommand;
import Commands.FrontCommand;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FrontServlet", urlPatterns = {"/FrontServlet"})
public class FrontServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FrontCommand command = getCommand(request);
        command.init(getServletContext(), request, response);
        command.process();
    }

    private FrontCommand getCommand(HttpServletRequest request) {
        FrontCommand command = null;
        try {
            command = (FrontCommand) getCommandClass(request).newInstance();
        } catch (InstantiationException | IllegalAccessException ex) {
        }
        return command;
    }

    private Class getCommandClass(HttpServletRequest request) {
        Class result;
        String command = "Commands." + request.getParameter("command");
        try {
            result = Class.forName(command);
        } catch (ClassNotFoundException ex) {
            result = UnknownCommand.class;
        }
        return result;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
