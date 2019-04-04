<html>
<head>
   <title> Driver Details</title>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style>
        body{
               margin: 0;
               background-image: url("bus.jpg");
               background-repeat:no-repeat;
               background-size: cover;
               background-position: center;
               opacity: 0.8;
               
            }
        .header{
                font-size: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #66ffff;
                text-shadow: 2px 2px 4px #800000;
               
            }
             .btn{
           opacity: 0.6;
           margin-top: 50px;
           width:428px;    
           background-color:whitesmoke; 
           color:#ff3300;
           font-size: 20px;
           border:none;
           padding:10px 5px;
           cursor:pointer;
           float:left;
           } 

           .btn:hover{
               background-color:#ff9900;
           }  
            .nav{
               
                 border-radius:40px;
                 padding:12px 24px;
                 margin-top: 0px;
                 display: flex; 
                 margin-left: 1045px;
                 background-color: #990000;
                 display: block;
                
            }
            .nav a{
                text-align: right;
                text-decoration: none;
                 font-size: 15px;
                color: white;
            }
            .nav a:hover{
                color: yellow;
                background-color: white;
            }
            .container{
                
                display: flex;
                color: white;
            }
           
            .right{  
            background-image: url("rt.jpg");
            font-size: 15px;
            height:450px;
            width:600px;
            opacity: 1.0;
            margin-left: 350px;
            margin-right: 100px;
            margin-bottom: 50px;
            box-shadow:10px 10px 10px 10px grey;
            background-repeat:no-repeat;
            background-size: cover;
            background-position: center;
            border-radius:40px;
            padding:12px 64px;
            display: block;
            }

            .btnn{
            background-color:dodgerblue;
            text-decoration: none;
            color:white;
            width:200px;
            border-radius:40px;
            padding:12px 20px;
            cursor:pointer;
            display:block;
           } 
           .btnn:hover{
            transition-duration:1s;
            transform:translate(0px,-5px);
            box-shadow:0px 10px 30px black;              
           }
           .table{
               margin-left: 0;
               color: white;
               font-size: 20px; 
           }
   </style>
</head>
<%@ page import="java.util.*,model.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! int id;String driverid;String drivername;String busno;int routeno;String route;Session session1 = null;%>
<body>
    
     <div class="header">
         <h1>Driver Details</h1>
     </div>
       
     <div class="main">
           <%String user=(String)session.getAttribute("user");
            if(user.equals("Harshita")){%>
            <button class="btn" onclick="window.location.href='admin.html'">Home</button>
            <%}
        else{
                Configuration cf1 = new Configuration();
                            cf1.configure("cfgPackage/hibernate1.cfg.xml");
                            SessionFactory sf1 = cf1.buildSessionFactory();
                            session1 = sf1.openSession();
                            User s=null;
                            String sqr1 = "from User";
                            Query qr1 = session1.createQuery(sqr1);
                            Iterator it1 = qr1.iterate();
                            while(it1.hasNext()){
                                s = (User)it1.next();
                                String use = s.getUsername();
                                if(user.equals(use))
                                {
                                    break;
                                }     
                                }
                                if(s.getUsertype().equals("Student/Faculty"))
                                {%>
                                <button class="btn" onclick="window.location.href='student.html'">Home</button>
                                <%}
                            else{%>
                            <button class="btn" onclick="window.location.href='staff.html'">Home</button>
                
                                <%}
}%>   
             <button class="btn" onclick="window.location.href='ContactUs.jsp'">Contact Us</button> 
            <button class="btn" onclick="window.location.href='login.html'">Log Out</button>   
             
             <div class="container">
              
             </div></div>
            <div style="clear:both;"></div>
        </div>
    <div class="container">
        
        <div class="right">
        <br><br><br>
         <table class="table">
                <form action="Driverdelete.jsp" method="post">
                <thead>
                    <th>Id</th>
                    <th>Driver Id</th>
                    <th>Driver Name</th>
                    <th>Bus Id</th>
                    <th>Route No</th>
                    <th>Route</th>
                    <th>Action</th>
                </thead>
                <%
                Configuration cf = new Configuration();
                cf.configure("cfgPackage/Driver.cfg.xml");
                SessionFactory sf = cf.buildSessionFactory();
                session1 = sf.openSession();

                String sqr = "from Driver";
                Query qr = session1.createQuery(sqr);
                Iterator it = qr.iterate();
                while(it.hasNext()){
                    Driver d = (Driver)it.next();
                    id = d.getId();
                    driverid = d.getDriverid();
                    drivername = d.getDrivername();
                    busno = d.getBusno();
                    routeno = d.getRouteno();
                    route = d.getRoute();
                %>
                <tbody>
                    <td><%=id%></td>
                    <td><%=driverid%></td>
                    <td><%=drivername%></td>
                    <td><%=busno%></td>
                    <td><%=routeno%></td>
                    <td><%=route%></td>
                    <td><a href="Driverupdate.jsp?id=<%=id%>&driverid=<%=driverid%>&drivername=<%=drivername%>&busno=<%=busno%>&routeno=<%=routeno%>&route=<%=route%>"  class="table">Update</a> 
                       <input type="checkbox" class="form-control" value="<%=id%>" name="c1"></td>
                </tbody>
                <%
                }
                session1.close();
                %>
                
                <tbody>
                <td colspan="10" align="center"><br><br><br><br> <input type="submit" class="btnn btnn-hover" value="Delete Selected Driver"> </td>
                </tbody>
                <tbody>
                    <td colspan="10" align="center"><br><a href="Driver_1.jsp" class="btnn btnn-hover">Add Driver</a></td>
                </tbody>
                </form>
            </table>
                            
                        </table>
                        
        </div>
        </div>
        </div>
    </form>
    <script type="text/javascript">
   
</script>
    
</body>
</html>