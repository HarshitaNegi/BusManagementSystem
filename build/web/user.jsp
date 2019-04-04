
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <%@ page import="java.util.*,model.*,org.hibernate.*,org.hibernate.cfg.*" %>
    <%! int id;String username;String password;int studentid;String email;String address;String mobile;int pincode;Session session1 = null;%>
    <body>
        <div class="container">
            <div class="sidebar">
                <div>
                    <img src="images/logo.png" alt="Logo" width="200px" height="200px">
                </div>
                <ul>
                    <li>
                        <a href="admin.html">
                            <span><i class="fa fa-home"></i></span>
                            <span>HOME</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span><i class="fa fa-user"></i></span>
                            <span>Profile</span>
                        </a>
                    </li>
                    <li>
                        <a href="search.html">
                            <span><i class="fa fa-search"></i></span>
                            <span>Search</span>
                        </a>
                    </li>
                    <li>
                        <a href="../schedule.jsp">
                            <span><i class="fa fa-clock-o"></i></span>
                            <span>Schedule</span>
                        </a>
                    </li>
                    <li>
                        <a href="view.html">
                            <span><i class="fa fa-eye"></i></span>
                            <span>ViewAll</span>
                        </a>
                    </li>
                    <li class="last">
                        <a href="../Login/login.html">
                            <span><i class="fa fa-sign-out"></i></span>
                            <span>LogOut</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="jumbotron">
                <h1>All User Details</h1>
                <table class="table table-hover">
                    <form action="../Userdelete.jsp" method="post">
                        <thead>
                        <th>Id</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Id</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>MobileNumber</th>
                        <th>PinCode</th>
                        <th>Action</th>
                    </thead>
                    <%
                    Configuration cf = new Configuration();
                    cf.configure("cfgPackage/UserAdd.cfg.xml");
                    SessionFactory sf = cf.buildSessionFactory();
                    session1 = sf.openSession();

                    String sqr = "from UserAdd";
                    Query qr = session1.createQuery(sqr);
                    Iterator it = qr.iterate();
                    while(it.hasNext()){
                        UserAdd u = (UserAdd)it.next();
                        id = u.getId();
                        username = u.getUsername();
                        password = u.getPassword();
                        studentid = u.getStudentid();
                        email = u.getEmail();
                        address = u.getAddress();
                        mobile = u.getMobile();
                        pincode = u.getPincode();
                    %>
                    <tbody>
                        <td><%=id%></td>
                        <td><%=username%></td>
                        <td><%=password%></td>
                        <td><%=studentid%></td>
                        <td><%=email%></td>
                        <td><%=address%></td>
                        <td><%=mobile%></td>
                        <td><%=pincode%></td>
                        <td><a href="../Userupdate.jsp?id=<%=id%>&username=<%=username%>&password=<%=password%>&studentid=<%=studentid%>&email=<%=email%>&address=<%=address%>&mobile=<%=mobile%>&pincode=<%=pincode%>"  class="btn btn-warning btn-md">Update</a> 
                       <input type="checkbox" class="form-control" value="<%=id%>" name="c1"></td>
                    </tbody>
                    <%
                    }   
                    session1.close();
                    %>
                    <tbody>
                    <td colspan="10" align="center"> <input type="submit" class="btn btn-danger btn-lg btn-block" value="Delete Selected Driver"> </td>
                    </tbody>
                    <tbody>
                    <td colspan="10" align="center"><a href="../UserAdd.jsp" class="btn btn-success btn-block btn-lg">Add Users</a></td>
                    </tbody>
                    </form>
                </table>
                    
            </div>
        </div>
    </body>
</html>
