<html>
<head>
   <title> Schedule </title>
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
<%! int id;String busno;String pickuppoint;String arrivaltime;String droppoint;String droptime;Session session1 = null; %>
<body>
    
     <div class="header">
       <h1>Arriving Time</h1>
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
       <table align="center" class="table" id="table">
                            <form action="delete.jsp" method="post">
                                <thead>
                                <th>Id</th>
                                <th>Bus No.</th>
                                <th>PickUp Point</th>
                                <th>Arrival Time</th>
                                <th>Drop Point</th>
                                <th>Drop Time</th>
                                <th>Action</th>
                            </thead>
                            <%
                            Configuration cf = new Configuration();
                            cf.configure("cfgPackage/Schedule.cfg.xml");
                            SessionFactory sf = cf.buildSessionFactory();
                            session1 = sf.openSession();

                            String sqr = "from schedule";
                            Query qr = session1.createQuery(sqr);
                            Iterator it = qr.iterate();
                            while(it.hasNext()){
                                schedule s = (schedule)it.next();
                                id = s.getId();
                                busno = s.getBusno();
                                pickuppoint = s.getPickuppoint();
                                arrivaltime = s.getArrivaltime();
                                droppoint = s.getDroppoint();
                                droptime = s.getDroptime();
                            %>
                            <tbody>
                                <td><%=id%></td>
                                <td><%=busno%></td>
                                <td><%=pickuppoint%></td>
                                <td><%=arrivaltime%></td>
                                <td><%=droppoint%></td>
                                <td><%=droptime%></td>
                                <td> <a href="update.jsp?id=<%=id%>&busno=<%=busno%>&pickuppoint=<%=pickuppoint%>&arrivaltime=<%=arrivaltime%>&droppoint=<%=droppoint%>&droptime=<%=droptime%>"  class="table">Update</a> 
                                    <input type="checkbox" class="form-control" value="<%=id%>" name="c1"></td>
                            </tbody>
                            <%
                            }
                            session1.close();
                            %>
                            
                            <tbody>
                                
                            <td colspan="10" align="center"> <input type="submit" class="btnn btnn-hover" value="Delete Selected Schedule"> </td>
                            </tbody>
                            <tbody>
                            <td colspan="10" align="center" width = "1px"><a href="schedule.jsp" class="btnn btnn-hover">Add Schedule</a></td>
                            </tbody>
                            </form>
                            
                        </table>
                        
        </div>
        </div>
        </div>
    </form>
    <script type="text/javascript">
   
</script>
    
</body>
</html>