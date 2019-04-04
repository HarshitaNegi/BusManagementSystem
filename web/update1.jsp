<%-- 
    Document   : update
    Created on : Mar 5, 2019, 3:49:15 PM
    Author     : gshub
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="Admin/css/schedule.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Schedules</title>

</head>
<%@ page import="java.util.*,model.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! Session session1 = null; %>
<style>
    .form{
        width:600px;
        margin: 150px auto;
        padding: 10px;
    }
</style>

<body>

        <div class="container">
                <div class="sidebar">
                    <div>
                        <img src="images/logo.png" alt="Logo" width="200px" height="200px">
                    </div>
                    <ul>
                        <li>
                            <a href="faculty.html">
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
                            <a href="search.jsp">
                                <span><i class="fa fa-search"></i></span>
                                <span>Search</span>
                            </a>
                        </li>
                        <li>
                            <a href="../schedule2.jsp">
                                <span><i class="fa fa-clock-o"></i></span>
                                <span>Schedule</span>
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
                <h1>Add Schedule</h1>
                <%
                String str = request.getParameter("id");
                String busno = request.getParameter("busno");
                String pickuppoint = request.getParameter("pickuppoint");
                String arrivaltime = request.getParameter("arrivaltime");
                String droppoint = request.getParameter("droppoint");
                String droptime = request.getParameter("droptime");
                String sub = request.getParameter("s1");
                if(sub!=null){
                    int id = Integer.parseInt(str);
                    try{
                        Configuration cf = new Configuration();
                        cf.configure("Schedule.cfg.xml");
                        SessionFactory sf = cf.buildSessionFactory();
                        session1 = sf.openSession();
                        Transaction tx = session1.beginTransaction();
                        schedule s = (schedule)session1.get(schedule.class,id);
                        s.setBusno(busno);
                        s.setPickuppoint(pickuppoint);
                        s.setArrivaltime(arrivaltime);
                        s.setDroppoint(droppoint);
                        s.setDroptime(droptime);
                        session1.update(s);
                        response.sendRedirect("Faculty/schedule.jsp");
                        tx.commit();
                    } catch(Exception e){
                        System.out.println(e);
                    } finally{
                        session1.close();
                    }
                }
                %>
                <form class="form" name="f1">  
                <div class="form-group">
                    <input type="hidden" name="id" value="<%=str%>">
                    <input type="text" name="busno" value="<%=busno%>" class="form-control" plcaeholder="Enter BusNo">
                </div>
                <div class="form-group">
                    <input type="text" name="pickuppoint" value="<%=pickuppoint%>" class="form-control" placeholder="Enter Pickuppoint" >
                </div>
                <div class="form-group">
                    <input type="text" name="arrivaltime" value="<%=arrivaltime%>" class="form-control" plcaeholder="Enter ArrivalTime">
                </div>
                <div class="form-group">
                    <input type="text" name="droppoint" value="<%=droppoint%>" class="form-control" placeholder="Enter DropPoint">
                </div>
                <div class="form-group">
                    <input type="text" name="droptime" value="<%=droptime%>" class="form-control" placeholder="Enter DropTime">
                </div>
                <input name="s1" type="submit" class="btn btn-block btn-primary btn-lg" value="Update Schedule">
                <a href="Admin/schedule.jsp" class="btn btn-block btn-success btn-lg">Display Schedule</a>
                </form>
            </div>
        </div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!--<script src="lib/schedule.js"></script>-->
	<script>
	</script>

</body>

</html>


