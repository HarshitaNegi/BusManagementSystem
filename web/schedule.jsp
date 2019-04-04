<html>
<head>
   <title> Add Schedule </title>
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
       <h1>Add Schedule</h1>
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
        
                <form action="ScheduleServlet" class="form">       
      <center>
      <div class="form-group">
                   &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <label for="busno"><b>Bus no</b></label>
      <input style="height:25px; width:200px" type="text" name = "busno" class="form-control" placeholder="Enter Your BusNo"><br><br>
                </div>
                    
                <div class="form-group">
                    <label for="pickuppoint"><b>Pickup Point</b></label>
      <input style="height:25px; width:200px" type="text" name = "pickuppoint" class="form-control" placeholder="Enter PickupPoint"><br><br>
                </div>
                    
                <div class="form-group">
                    <label for="arrivaltime"><b>Arrival Time</b></label>
      <input style="height:25px; width:200px" type="text" name = "arrivaltime" class="form-control" placeholder="Enter arrivaltime"><br><br>
                </div>
                    
                <div class="form-group">
                     &nbsp; &nbsp;&nbsp;<label for="droppoint"><b>Drop Point</b></label>
      <input style="height:25px; width:200px" type="text" name = "droppoint" class="form-control" placeholder="Enter Drop point"><br><br>
                </div>
                    
                <div class="form-group">
                  &nbsp; &nbsp;&nbsp;  <label for="droptime"><b>Drop Time</b></label>
      <input style="height:25px; width:200px" type="text" name = "droptime" class="form-control" placeholder="Enter Drop time"><br><br>
                </div>
                <br>
                <input type="submit" class="btnn" value="Add Schedule">
                <br>
                <a href="schedule_1.jsp" class="btnn">Display Schedule</a>
      </center>
                </form>
        </div>
        </div>
        </div>
    </form>
    <script type="text/javascript">
   
</script>
    
</body>
</html>