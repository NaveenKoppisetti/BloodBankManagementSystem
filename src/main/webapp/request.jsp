<%@ page import="java.sql.*,java.util.*,java.io.*"%>

<%
    String blood = request.getParameter("blood");
    String username = (String)session.getAttribute("username");

    if(username == null)
    {
        session.removeAttribute("username");
        response.sendRedirect("login.html");
    }
    else
    {
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

            String qry = "select * from register where blood=?";

            PreparedStatement pstmt = con.prepareStatement(qry);

            pstmt.setString(1, blood);

            ResultSet rs = pstmt.executeQuery();

            out.print("<h1 align='center'>Blood Donor Details</h1><br>");

            out.print("<table border='3' align='center'>");

            out.print("<tr>");
            out.print("<th>NAME</th>");
            out.print("<th>GENDER</th>");
            out.print("<th>BLOOD TYPE</th>");
            out.print("<th>ADDRESS</th>");
            out.print("<th>PHONE NUMBER</th>");
            out.print("</tr>");

            while(rs.next())
            {
                out.print("<tr>");
                out.print("<td>"+rs.getString(1)+"</td>");
                out.print("<td>"+rs.getString(4)+"</td>");
                out.print("<td>"+rs.getString(5)+"</td>");
                out.print("<td>"+rs.getString(6)+"</td>");
                out.print("<td>"+rs.getLong(7)+"</td>");
                out.print("</tr>");
            }

            out.print("</table>");

            con.close();
        }
        catch(Exception e)
        {
            out.print(e);
        }
    }
%>

<style>
body{
    background-image:url("requ.jpg");
    background-repeat:no-repeat;
    background-attachment:fixed;
    background-size:100% 100%;
}
table{
    background:white;
}
</style>