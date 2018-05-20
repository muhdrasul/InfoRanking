<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>  
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%
          try {
                        String driver = "org.postgresql.Driver";
                        String url = "jdbc:postgresql://localhost:5432/postgres";
                        String username = "postgres";
                        String password = "ras230994";

                        String myDataField = null;
                        //String myQuery = "SELECT "+'"'+"Date"+'"'+","+'"'+"Website"+'"'+","+'"'+"Visits"+'"'+",row_number() over(order by "+'"'+"Visits"+'"'+" DESC) from data limit 5";
                        String myQuery = "SELECT * ,row_number() over(order by "+'"'+"Visits"+'"'+" DESC) from data";
                       // System.out.println(myQuery);
                        Connection myConnection = null;
                       PreparedStatement myPreparedStatement = null;
                        //PreparedStatement myPreparedStatement1 = null;
                        ResultSet myResultSet = null;
                        //ResultSet myResultSet1 = null;
                        Class.forName(driver).newInstance();
                        myConnection = DriverManager.getConnection(url, username, password);
                        myPreparedStatement = myConnection.prepareStatement(myQuery);
                        myResultSet = myPreparedStatement.executeQuery();
                        //myPreparedStatement1 = myConnection.prepareStatement(Query);
                        //myResultSet1 = myPreparedStatement1.executeQuery();
                        Document document=new Document();
                        PdfWriter.getInstance(document,new FileOutputStream("C:/All Data.pdf"));
                        document.open();
                        PdfPTable table=new PdfPTable(4);
                        table.addCell("Date");
                         table.addCell("Website");
                          table.addCell("Total Visit");
                         table.addCell("Number Ranking");

                %>
                <%
                    while (myResultSet.next()) {



               table.addCell(myResultSet.getString(1));
               table.addCell(myResultSet.getString(2));
                table.addCell(myResultSet.getString(3));
                 table.addCell(myResultSet.getString(5));
                    }
                   %>
                <%
                // close all the connections.
                // myResultSet1.close();
                //myPreparedStatement1.close();
                  document.add(table);
                document.close();
                 myResultSet.close();
                myPreparedStatement.close();
                myConnection.close();
                response.sendRedirect("/WebRanking/index.htm");
            } catch (Exception ex) {
                ex.printStackTrace();
            %>
            <font size="+2" color="red"><center><b>
            <%
                   out.println("Unable to connect to database.");
                }
            %></b></center>
             </font>