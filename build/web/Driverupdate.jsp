<html>
<head>
   <title> Update Driver Details</title>
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
       <h1> Driver</h1>
     </div>
       
     <div class="main">
            <button class="btn" onclick="window.location.href='admin.html'">Home</button>    
             <button class="btn" onclick="window.location.href='ContactUs.jsp'">Contact Us</button> 
            <button class="btn" onclick="window.location.href='login.html'">Log Out</button>   
             
             <div class="container">
              
             </div></div>
            <div style="clear:both;"></div>
        </div>
    <div class="container">
        
        <div class="right">
        <br><br><br>
          <%
                String str = request.getParameter("id");
                String driverid = request.getParameter("driverid");
                String drivername = request.getParameter("drivername");
                String busno = request.getParameter("busno");
                String str1 = request.getParameter("routeno");
                String route = request.getParameter("route");
                String sub = request.getParameter("s1");
                if(sub!=null){
                    int id = Integer.parseInt(str);
                    int routeno = Integer.parseInt(str1);
                    try{
                        Configuration cf = new Configuration();
                        cf.configure("cfgPackage/Driver.cfg.xml");
                        SessionFactory sf = cf.buildSessionFactory();
                        session1 = sf.openSession();
                        Transaction tx = session1.beginTransaction();
                        Driver d = (Driver)session1.get(Driver.class,id);
                        d.setDriverid(driverid);
                        d.setDrivername(drivername);
                        d.setBusno(busno);
                        d.setRouteno(routeno);
                        d.setRoute(route);
                        session1.update(d);
                        response.sendRedirect("driver.jsp");
                        tx.commit();
                    } catch(Exception e){
                        System.out.println(e);
                    } finally{
                        session1.close();
                    }
                }
                %>
           
            <form class="form" name="f1">
             <center>
                <div class="form-group">
                    <input type="hidden" name="id" value="<%=str%>"> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<label for="driverid"><b>Driver's Id</b></label>
                    <input type="text" style="height:25px; width:200px"  name="driverid" value="<%=driverid%>" class="form-control" placeholder="Enter DriverId">
                </div><br>
                
                <div class="form-group"><label for="drivername"><b>Driver's Name</b></label>                    
                    <input type="text" style="height:25px; width:200px" name="drivername" value="<%=drivername%>" class="form-control" placeholder="Enter DriverName">
                </div><br>
                
                <div class="form-group"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<label for="busno"><b>Bus no</b></label>
                    <input type="text" style="height:25px; width:200px" name="busno" value="<%=busno%>" class="form-control" placeholder="Enter BusNo">
                </div><br>
                
                <div class="form-group"> &nbsp; &nbsp;&nbsp; &nbsp;<label for="routeno"><b>Route's no</b></label> 
                    <input type="text" style="height:25px; width:200px" name="routeno" value="<%=str1%>" class="form-control" placeholder="Enter RouteNo">
                </div><br>
                
                <div class="form-group">&nbsp;&nbsp;<label for="route"><b>Route name</b></label>
                    <input type="text" style="height:25px; width:200px" name="route" value="<%=route%>" class="form-control" placeholder="Enter Route">
                </div><br>
                
                <input name="s1" type="submit" class="btnn btnn-hover" value="Update Values"><br>
                <a href="driver.jsp" class="btnn btnn-hover">Display Driver</a>
            </form>
                </center>
            
    <script type="text/javascript">
   
</script>
    
</body>
</html>