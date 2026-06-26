<%@ page import="java.sql.*,java.util.*,java.io.*"%>

<%
    String name = request.getParameter("name");
    String uname = request.getParameter("uname");
    String pwd = request.getParameter("pwd");
    String gender = request.getParameter("gender");
    String blood = request.getParameter("blood");
    String addr = request.getParameter("addr");
    long phno = Long.parseLong(request.getParameter("phno"));

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

        String qry = "insert into register values(?,?,?,?,?,?,?)";

        PreparedStatement pstmt = con.prepareStatement(qry);

        pstmt.setString(1, name);
        pstmt.setString(2, uname);
        pstmt.setString(3, pwd);
        pstmt.setString(4, gender);
        pstmt.setString(5, blood);
        pstmt.setString(6, addr);
        pstmt.setLong(7, phno);

        pstmt.executeUpdate();

        response.sendRedirect("login.html");

        con.close();
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>