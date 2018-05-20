<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%
    
String id=request.getParameter("id");
try{
String driver = "org.postgresql.Driver";
String url = "jdbc:postgresql://localhost:5432/postgres";
String username = "postgres";
String password = "ras230994";
String myDataField = null;
Connection myConnection = null;
PreparedStatement myPreparedStatement = null;
ResultSet myResultSet = null;
Class.forName(driver).newInstance();
String query = "delete from data where id='"+id+"'";
myConnection = DriverManager.getConnection(url, username, password);
Statement st=null;
st=myConnection.createStatement();
st.executeUpdate(query);
response.sendRedirect("/WebRanking/index.htm");
System.out.println(response);
}
catch(Exception e){
System.out.println(e);
    }
%>