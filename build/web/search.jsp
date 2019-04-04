<html>
<head>
   <title> Search Schedule </title>
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
       <h1>Search Schedule</h1>
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
            <button class="btn" onclick="window.location.href='Logout.jsp'">Log Out</button>   
             
             <div class="container">
              
             </div></div>
            <div style="clear:both;"></div>
        </div>
    <div class="container">
        
        <div class="right">
        <br><br><br>
        
                <form action="" method="get">
                            <label for="search">
                            <span><i class="fa fa-search"></i></span>
                            </label> 
                            <input style="height:30px; width:230px" class="input" type="text" name="searching" placeholder="Search Here.....">
                        </form>
                        <font color = red>
                            <br> <br>
                            <table class="table table-hover">
                                    <thead>
                                        <th>Bus No.</th>
                                        <th>Pick-Up Place</th>
                                        <th>Arrival Time</th>
                                        <th>Drop Place</th>
                                        <th>Drop Time</th>
                                    </thead>
                                    <%
                                        Configuration cf = new Configuration();
                                        cf.configure("cfgPackage/Schedule.cfg.xml");
                                        SessionFactory sf = cf.buildSessionFactory();
                                        session1 = sf.openSession();
                                        String search = request.getParameter("searching");
                                        String data;
                                        if(search != null){
                                            data = "from schedule where busno like '%"+search+"%' or pickuppoint like '%"+search+"%' or droppoint like '%"+search+"%'";
                                        } else {
                                            data = "from schedule";
                                        }
                                        Query qr = session1.createQuery(data);
                                        Iterator it = qr.iterate();
                                        while(it.hasNext()){
                                        schedule s = (schedule)it.next();
                                        busno = s.getBusno();
                                        pickuppoint = s.getPickuppoint();
                                        arrivaltime = s.getArrivaltime();
                                        droppoint = s.getDroppoint();
                                        droptime = s.getDroptime();
                                    %>
                                    <tbody>
                                        <td><%=busno%></td>
                                        <td><%=pickuppoint%></td>
                                        <td><%=arrivaltime%></td>
                                        <td><%=droppoint%></td>
                                        <td><%=droptime%></td>
                                    </tbody>
                                    <%
                                        }
                                       session1.close();
                                    %>
                        </table>
        </div>
        </div>
        </div>
    </form>
    <script type="text/javascript">
   
</script>
    
</body>
</html>