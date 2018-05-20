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
                                              
                                                System.out.println(request.getParameter("id"));
                                                String myDataField = null;
                                                //String myQuery = "SELECT "+'"'+"Date"+'"'+","+'"'+"Website"+'"'+","+'"'+"Visits"+'"'+",row_number() over(order by "+'"'+"Visits"+'"'+" DESC) from data limit 5";
                                                 String myQuery = "Select *,row_number() over(order by "+'"'+"Visits"+'"'+" Desc) from data where "+'"'+"Date"+'"'+" between '"+request.getParameter("id1")+"' and '"+request.getParameter("id2")+"' limit 5";
                                                System.out.println(myQuery);
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
                                                PdfWriter.getInstance(document,new FileOutputStream("C:/Ranking by date range.pdf"));
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
                                        System.out.println(response);
                                        response.sendRedirect("/WebRanking/resultweek.htm");
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    %>
                                    <font size="+2" color="red"><center><b>
                                    <%
                                           
                                        }
                                    %></b></center>
                                     </font>