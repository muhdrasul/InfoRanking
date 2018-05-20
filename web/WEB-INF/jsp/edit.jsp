<%-- 
    Document   : edit
    Created on : May 19, 2018, 7:54:03 AM
    Author     : Rasul
--%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Info Ranking</title>
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="index.htm">Info Ranking</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                        <a class="nav-link" href="index.htm">
                            <i class="fa fa-fw fa-dashboard"></i>
                            <span class="nav-link-text">Update & Delete Data</span>
                        </a>
                    </li>
                           <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="tables.htm">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Top 5 Visited Website</span>
                        </a>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
                          <a class="nav-link" href="tableweek.htm">
                            <i class="fa fa-fw fa-area-chart"></i>
                            <span class="nav-link-text">Top 5 Website Visited by Date</span>
                          </a>
                        </li>
                        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
                          <a class="nav-link" href="resultweek.htm">
                            <i class="fa fa-fw fa-area-chart"></i>
                            <span class="nav-link-text">Top 5 Website Visited by Date Range</span>
                          </a>
                        </li>
                </ul>
                <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
            </div>
                    </nav>
                    <div class="content-wrapper">
                        <div class="container-fluid">
                            
                            <%
                                    String id=request.getParameter("id");
                                    int sumcount=0;
                                    try {
                                    String driver = "org.postgresql.Driver";
                                    String url = "jdbc:postgresql://localhost:5432/postgres";
                                    String username = "postgres";
                                    String password = "ras230994";
                                    String myDataField = null;
                                    Connection myConnection = null;
                                    PreparedStatement myPreparedStatement = null;
                                    ResultSet myResultSet = null;
                                    Class.forName(driver).newInstance();
                                    myConnection = DriverManager.getConnection(url, username, password);
                                    String query = "select * from data where id='"+id+"'";
                                    
             
                                    myPreparedStatement = myConnection.prepareStatement(query);
                                    myResultSet = myPreparedStatement.executeQuery();
                                   
                                    %>
                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="fa fa-table"></i>Edit Data</div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <form method="post" action="update.htm">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                   <th>Date</th><th>Website</th><th>Total Visits</th>
                                                </tr>
                                            </thead>
                                           
                                                <%
                                                    while(myResultSet.next()){
                                                %>
                                                <tr>
                                                    <td><input type="date" name="date" value="<%=myResultSet.getString(1)%>"></td>
                                                    <td><input type="text" name="web" value="<%=myResultSet.getString(2)%>"></td>
                                                    <td><input type=int" name="total" value="<%=myResultSet.getString(3)%>"></td>
                                                    <td><input type="hidden" name="id" value="<%=myResultSet.getString(4)%>"></td>
                                                </tr>   
                                                     
                                            
                                            
                                            <% } %>
                                            <%
                                                    // close all the connections.
                                                   // myResultSet.close();
                                                    //myPreparedStatement.close();
                                                   // myConnection.close();
                                                }
                                                catch (Exception ex) {
                                                    ex.printStackTrace();
                                            %>
                                            </font>
                                            <font size="+3" color="red"></b>
                                            <%
                                            out.println("Unable to connect to database.");
                                                }
                                            %>
                                        </table>
                                        <input onsubmit="return confirmSMS()" class="btn-info" type="submit" name="Submit" value="Update"/>
                                        
                                        </form>
                                    </div>
                                </div>
                                <div class="card-footer small text-muted"></div>
                            </div>
                        </div>
                        <!-- /.container-fluid-->
                        <!-- /.content-wrapper-->
                        <footer class="sticky-footer">
                            <div class="container">
                                <div class="text-center">
                                    <small>Copyright © Info Ranking</small>
                                </div>
                            </div>
                        </footer>
                        <!-- Scroll to Top Button-->
                        <a class="scroll-to-top rounded" href="#page-top">
                            <i class="fa fa-angle-up"></i>
                        </a>
                       
                        <!-- Bootstrap core JavaScript-->
                        <script src="vendor/jquery/jquery.min.js"></script>
                        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <!-- Core plugin JavaScript-->
                        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                        <!-- Page level plugin JavaScript-->
                        <script src="vendor/chart.js/Chart.min.js"></script>
                        <script src="vendor/datatables/jquery.dataTables.js"></script>
                        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
                        <!-- Custom scripts for all pages-->
                        <script src="js/sb-admin.min.js"></script>
                        <!-- Custom scripts for this page-->
                        <script src="js/sb-admin-datatables1.min.js"></script>
                        <script src="js/sb-admin-charts.min.js"></script>
                    </div>
                    </body>

                    </html>
