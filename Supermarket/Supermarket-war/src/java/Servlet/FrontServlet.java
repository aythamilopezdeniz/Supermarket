package Servlet;

import Commands.UnknownCommand;
import Commands.FrontCommand;
import Entities.Users;
import SingletonBeans.SingletonEstadisticasBean;
import SingletonBeans.SingletonLogBean;
import StatelessBeans.StatelessSearch;
import StatelessBeans.StatelessSeeProduct;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FrontServlet", urlPatterns = {"/FrontServlet"})
public class FrontServlet extends HttpServlet {
    @EJB
    StatelessSearch searchBean;
    @EJB
    StatelessSeeProduct seeProduct;
    @EJB
    SingletonLogBean logBean;
    @EJB
    SingletonEstadisticasBean estadisticasBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FrontCommand command = getCommand(request);
        singletonBeans(request);
        command.init(getServletContext(), request, response);
        command.process();
    }
    
    private void singletonBeans(HttpServletRequest request) {
        Users client = (Users) request.getSession().getAttribute("client");
        if(client == null) {
            estadisticasBean.setAccessComponents("FrontServlet");
            logBean.setLog("FrontServlet::singletonBeans::null");
        }
        else {
            estadisticasBean.setComponentsUser("FrontServlet", client.getNombre());
            logBean.setLog("FrontServlet::singletonBeans::" + client.getNombre());
        }
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