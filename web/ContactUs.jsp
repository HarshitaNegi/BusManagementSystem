<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="model.User"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<html>
<head>
   <title> Contact Us </title>
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
       	    border-radius:40px;
       	    padding:12px 64px;
       	    cursor:pointer;
            display:block;
           } 
           .btnn:hover{
       	    transition-duration:1s;
       	    transform:translate(0px,-5px);
       	    box-shadow:0px 10px 30px black;              
           }
   </style>
</head>
<%!Session session1 = null; %>
<body>
    <form name="Form" action="ContactServlet" method="post"  style="border:1px solid">
     <div class="header">
       <h1>Contact Us</h1>
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
             
            <div style="clear:both;"></div>
        </div>
    <div class="container">
        
        <div class="right">
        <br><br><br>
        <center> <label for="sname"><b>Name</b></label>
      <input style="height:40px; width:300px" type="text" placeholder="Enter name" name="sname"  required></center> <br>
    
       <center> <label for="id"><b>Id</b></label>
      <input style="height:40px; width:300px" type="text" placeholder="Enter id" name="ids" required></center> <br>   
    
        <center> <label for="inquiry"><b>Inquiry</b></label>
      <input style="height:40px; width:300px" type="text area" placeholder="Enter inquiry or complaint" name="inquiry" required></center> <br>
        
        
    
   <center>
    <label>
      <input style="height:30px; width:100px; margin-bottom:15px" type="checkbox" checked="checked" name="remember"> Done
    </label>
    </center>
    <div class="clearfix">
        <br>
      <button type="submit"  class="btnn" >Submit</button>
      
        </div>
        </div>
        </div>
    </form>
    <script type="text/javascript">
   
</script>
<!--    <script>
         function Validation(){
            var value = document.forms["Form"]["name"].value;
            var value2 = document.forms["Form"]["ids"].value;
            var value3 = document.forms["Form"]["inquiry"].value;
           if(value==""){
            alert("Name cannot be empty");  
            return false;
           }
           if(value2 == ""){
            alert("Id number cannot be empty");
            return false;
           }
           if(value3 == ""){
               alert("Inquiry or complaint cannot be empty");
               return false;
           }
           
         }
           </script>-->
</body>
</html>