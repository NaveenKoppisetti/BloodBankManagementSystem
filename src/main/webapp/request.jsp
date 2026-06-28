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

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --crimson:    #C0152A;
    --crimson-dk: #8B0E1E;
    --crimson-lt: #FFE4E4;
    --bg:         #FFF8F8;
    --surface:    #FFFFFF;
    --text:       #1A0A0B;
    --muted:      #6B7280;
    --border:     #F0D0D0;
  }

  body {
    font-family: 'Inter', Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
    padding: 48px 20px 64px;
  }

  /* ── Page heading injected by JSP ── */
  h1 {
    font-family: 'Playfair Display', Georgia, serif;
    font-size: 2rem;
    font-weight: 700;
    color: var(--text);
    text-align: center;
    margin-bottom: 8px;
  }

  /* Sub-label under the heading */
  h1::after {
    content: 'Matching donors for your requested blood type';
    display: block;
    font-family: 'Inter', sans-serif;
    font-size: .9rem;
    font-weight: 400;
    color: var(--muted);
    margin-top: 6px;
  }

  /* ── Table wrapper ── */
  table {
    width: 100%;
    max-width: 860px;
    margin: 36px auto 0;
    border-collapse: collapse;
    background: var(--surface);
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 24px rgba(192,21,42,.12);
    border: none !important;
  }

  /* ── Header row ── */
  tr:first-child {
    background: var(--crimson);
  }

  th {
    padding: 14px 20px;
    text-align: left;
    font-size: .75rem;
    font-weight: 600;
    letter-spacing: .09em;
    text-transform: uppercase;
    color: #fff;
    border: none !important;
    white-space: nowrap;
  }

  /* ── Data rows ── */
  td {
    padding: 14px 20px;
    font-size: .93rem;
    color: var(--text);
    border: none !important;
    border-bottom: 1px solid var(--border) !important;
  }

  tr:last-child td {
    border-bottom: none !important;
  }

  tr:not(:first-child):hover {
    background: var(--crimson-lt);
  }

  tr:not(:first-child):nth-child(even) {
    background: #fff8f8;
  }

  tr:not(:first-child):nth-child(even):hover {
    background: var(--crimson-lt);
  }

  /* Blood type badge — 3rd column (td:nth-child(3)) */
  td:nth-child(3) {
    font-weight: 700;
    color: var(--crimson);
  }

  /* ── Back button ── */
  body::after {
    content: '← Back to Request';
    display: block;
    width: fit-content;
    margin: 32px auto 0;
    padding: 11px 24px;
    background: transparent;
    border: 2px solid var(--crimson);
    border-radius: 8px;
    color: var(--crimson);
    font-family: 'Inter', sans-serif;
    font-size: .92rem;
    font-weight: 600;
    cursor: pointer;
    text-align: center;
    /* acts as a visual cue; actual nav handled below */
  }

  /* ── Empty state ── */
  table:not(:has(tr + tr)) td {
    text-align: center;
    padding: 48px 20px;
    color: var(--muted);
    font-style: italic;
  }

  @media (max-width: 640px) {
    table { display: block; overflow-x: auto; }
    th, td { padding: 12px 14px; white-space: nowrap; }
    h1 { font-size: 1.5rem; }
  }
</style>

<div style="text-align:center; margin-top:36px;">
  <a href="bloodRequest.html"
     style="display:inline-block; padding:11px 26px; background:transparent;
            border:2px solid #C0152A; border-radius:8px; color:#C0152A;
            font-family:'Inter',sans-serif; font-size:.92rem; font-weight:600;
            text-decoration:none; transition:background .18s;"
     onmouseover="this.style.background='#C0152A';this.style.color='#fff'"
     onmouseout="this.style.background='transparent';this.style.color='#C0152A'">
    ← Make Another Request
  </a>
  &nbsp;&nbsp;
  <a href="index.html"
     style="display:inline-block; padding:11px 26px; background:#C0152A;
            border-radius:8px; color:#fff;
            font-family:'Inter',sans-serif; font-size:.92rem; font-weight:600;
            text-decoration:none;"
     onmouseover="this.style.background='#8B0E1E'"
     onmouseout="this.style.background='#C0152A'">
    Home →
  </a>
</div>
