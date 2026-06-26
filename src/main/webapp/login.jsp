<%@ page import="java.sql.*,java.util.*,java.io.*"%>

<%
    String username = request.getParameter("uname");
    String pwd = request.getParameter("pwd");

    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Properties prop = new Properties();
        InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
        prop.load(input);

        String url = prop.getProperty("db.url");
        String user = prop.getProperty("db.username");
        String password = prop.getProperty("db.password");

        Connection con = DriverManager.getConnection(url, user, password);

        String qry = "select * from register where uname=? and pwd=?";

        PreparedStatement pstmt = con.prepareStatement(qry);

        pstmt.setString(1, username);
        pstmt.setString(2, pwd);

        ResultSet rs = pstmt.executeQuery();

        if(rs.next())
        {
            session.setAttribute("username", username);
            response.sendRedirect("index.html?username=" + username);
        }
        else
        {
            out.print("Invalid Credentials");
%>

<jsp:include page="login.html"/>

<%
        }

        con.close();
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>