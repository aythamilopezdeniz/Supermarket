        <!-- Paginación -->
        <div id="pagination">
            <form action="FrontServlet" method="POST">
                <button type="submit" name="anterior" value="<%=session.getAttribute("pagina")%>" class="btn btn-primary">Anterior</button>
                <input type="submit" name="1" value="1" class="btn btn-primary"/>
                <input type="hidden" name="min1" value="1" />
                <input type="hidden" name="max1" value="12" />
                <input type="submit" name="2" value="2" class="btn btn-primary"/>
                <input type="hidden" name="min2" value="13" />
                <input type="hidden" name="max2" value="24" />
                <input type="submit" name="3" value="3" class="btn btn-primary"/>
                <input type="hidden" name="min3" value="25" />
                <input type="hidden" name="max3" value="36" />
                <input type="submit" name="4" value="4" class="btn btn-primary"/>
                <input type="hidden" name="min4" value="37" />
                <input type="hidden" name="max4" value="48" />
                <input type="submit" name="5" value="5" class="btn btn-primary"/>
                <input type="hidden" name="min5" value="49" />
                <input type="hidden" name="max5" value="60" />
                <input type="submit" name="6" value="6" class="btn btn-primary"/>
                <input type="hidden" name="min6" value="61" />
                <input type="hidden" name="max6" value="72" />
                <input type="submit" name="7" value="7" class="btn btn-primary"/>
                <input type="hidden" name="min7" value="73" />
                <input type="hidden" name="max7" value="84" />
                <button type="submit" name="siguiente" value="<%=session.getAttribute("pagina") %>" class="btn btn-primary">Siguiente</button>
                <input type="hidden" name="command" value="Pagination" />
                <input type="hidden" name="window" value="/index.jsp" />
            </form>
        </div>
