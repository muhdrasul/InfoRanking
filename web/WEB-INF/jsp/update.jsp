<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<%
    
String id=request.getParameter("id");
int num=Integer.parseInt(id);
String date=request.getParameter("date");
String web=request.getParameter("web");
int total=Integer.parseInt(request.getParameter("total"));
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
System.out.println(web);
System.out.println(total);
String myQuery ="update data set "+'"'+"Date"+'"'+"='"+date+"', "+'"'+"Website"+'"'+"='"+web+"', "+'"'+"Visits"+'"'+"='"+total+"' where id='"+num+"'";
System.out.println(myQuery);
myConnection = DriverManager.getConnection(url, username, password);
Statement st=null;
st=myConnection.createStatement();
st.executeUpdate(myQuery);
out.println("<p> Succesfully updated </p>");
response.sendRedirect("/WebRanking/index.htm");
System.out.println(response);
}
catch(Exception e){
System.out.println(e);
    }
%>
