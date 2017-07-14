<%-- 
    Document   : Login
    Created on : May 30, 2017, 3:29:47 PM
    Author     : ISI-1.1
--%>

<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>

        <c:set var="context" value="${pageContext.request.contextPath}" />
        <link rel="stylesheet" type="text/css" href="${context}/css/style.css" />
  
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
        <link href="https://fonts.googleapis.com/css?family=Cormorant+SC" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
                <!-- JavaScript -->
<script src="//cdn.jsdelivr.net/alertifyjs/1.10.0/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/bootstrap.min.css"/>

        <script>
            
           
         
            $(document).ready(function () {
                
                
                $('select').material_select();
                var timer ;
               timer = setInterval(function(){checkDB(timer)},1000);
                
            });
            
          function clearRes2(){
              $.ajax({
                
              url: "cssres2cleanup",
              type: "GET",
              dataType:'json',
              processData: false,  // tell jQuery not to process the data
              contentType: false   // tell jQuery not to set contentType
            }).done(function( data ) {
                
                //progress.removeClass("active");
                console.log("keygen Ouput");
               
            
            });
             
         }     
          function clearReq1(){
             $.ajax({
                
              url: "cloudrequest1cleanup",
              type: "GET",
              dataType:'json',
              processData: false,  // tell jQuery not to process the data
              contentType: false   // tell jQuery not to set contentType
            }).done(function( data ) {
                
                //progress.removeClass("active");
                console.log("keygen Ouput");
               
            
            });
          }
       
         function checkDB(timer) {
             // alert("hello");
          console.log("submit event");
              
           $.ajax({
                
              url: "checkRequest1",
              type: "GET",
              dataType:'json',
   
              processData: false,  // tell jQuery not to process the data
              contentType: false   // tell jQuery not to set contentType
            }).done(function( data ) {
                
                //progress.removeClass("active");
                //alert(!$.trim(data));
                if(!$.isEmptyObject(data)){
                    alertify.success("Request Received");
                    console.log("keygen Ouput");
                    $("#user").val(data.user);
                    $("#sql").val(data.sql);
                    $('#cloud_one_request > tbody:last').append("<tr><td>" + data.user + "</td><td>" + data.sql + "</td><td><input type='submit' class='waves-effect waves-light btn-large' value='Process'/></td></tr>")
                   // alert(data.user + " -> " + data.sql);
                    //clearReq1();
                    //
                    clearInterval(timer);
                }
            });
            
            //return false;
         }
        function checkresponse(timer) {
             // alert("hello");
          console.log("submit event");
      
           $.ajax({
                
              url: "checkresponse",
              type: "GET",
              dataType:'json',
              processData: false,  // tell jQuery not to process the data
              contentType: false   // tell jQuery not to set contentType
            }).done(function( data ) {
                
                //progress.removeClass("active");
                //alert(data.response);
                console.log("checkresponse = " + data.response);
                if(data.response == "OK"){
                       alertify.success("Response Received From Cloud Two");  
                    $('#cloud_one_response > tbody:last').append("<tr><td>" + data.response + "</td><td><input type='submit' class='waves-effect waves-light btn-large' value='SEND'/></td></tr>")
                   // alert(data.user + " -> " + data.sql);
                   $("#secondtable").fadeIn(3000).css("display","block");
                   $("#firsttable").fadeOut(2000).css("display","none");
                   clearReq1();
                   clearRes2();
                   clearInterval(timer);
                }
                //alert(!$.trim(data));
               
            });
            
          
         }
         
          function request() {
             // alert("hello");
            
             var timer ;
               timer = setInterval(function(){checkresponse(timer)},1000);
             var res = null;
             var fd =   new FormData();
            var user = $("#user").val();
            var sql = $("#sql").val();
           fd.append("user",user);
           fd.append("sql",sql)
          console.log("submit event");
           // alert("process request");
          $.ajax({
                
              url: "processRequest",
              type:"POST",
              data:fd,
              processData: false,  // tell jQuery not to process the data
              contentType: false   // tell jQuery not to set contentType
            }).done(function( data ) {
                
                //progress.removeClass("active");
                //alert(!$.trim(data));
                      alertify.success("Request Send Two cloud Two");  
                  
                    $("#response").val(data);
                    console.log("response = " +res);
                    receive(data);
                   // $('#cloud_one_request > tbody:last').append("<tr><td>" + data.user + "</td><td>" + data.sql + "</td><td><input type='submit' class='waves-effect waves-light btn-large' value='Process'/></td></tr>")
                   // alert(data.user + " -> " + data.sql);
                    // clearDB();
                    // timer =  setInterval(checkDB,10000);
                
            });
           
        
           return false;
         }
         
         response = null;
          function receive(data){
             
            
             response = data;
              console.log("response 2= " + response);
         }
          function send() {
             // alert("hello");
           
             var fd =   new FormData();
            var user = $("#user").val();
           // var sl = $("#sql").val();
  
            fd.append("user",user);
           fd.append("response", $("#response").val());

          console.log("submit event");
           // alert("process request");
         $.ajax({
                
              url: "send",
              type:"POST",
              data:fd,
              processData: false,  // tell jQuery not to process the data
              contentType: false   // tell jQuery not to set contentType
            }).done(function( data ) {
                  alertify.success("Response send to User");  
                //progress.removeClass("active");
                //alert(!$.trim(data));
                
             
                    console.log("keygen Ouput");
                    
                   // $('#cloud_one_request > tbody:last').append("<tr><td>" + data.user + "</td><td>" + data.sql + "</td><td><input type='submit' class='waves-effect waves-light btn-large' value='Process'/></td></tr>")
                   // alert(data.user + " -> " + data.sql);
                    // clearDB();
                    // timer =  setInterval(checkDB,10000);
                
            });
            
           return false;
         }
     
        
        </script>

        <title>RDPC</title>
        <style>
            button{
                color:white;
                font-size: 16px;;

            }
            h4{
                color : white;
                font-family: 'Josefin Sans', sans-serif;
            }
            .brand-logo{
                font-family: 'Josefin Sans', sans-serif;
            }
            .nav-wrapper{
                font-family: 'Josefin Sans', sans-serif;

            }
            #tabs{
                width: 100%;
                font-family: 'Josefin Sans', sans-serif;
            }
            .file-field,.input-field{
                height: 80%;
            }
            #toast-container {
                top: 20%;
                right: auto !important;
                bottom: auto !important;
                left:7%;
                width: 92%;

            }
            table,th{
                color:white;
                background-color:#286090;
            }

            .container{
                height: 40%;
            }
            .nostyle{ background-color: transparent; border: none }

            #hiddenfile{
                display:none;
            }
            #update{
                width: 80%;
                margin-top: 5%;
            }
            #select{
                width: 80%;
            }
            #verify{
                margin-top: 5%;
                width: 80%;
            }
            form{
                height: 260px;
                width:95%;
                margin-top: 6%;
                margin-left: 2%;
                padding-top: 0%;
                background-color: transparent;
            }
            th{
                background-color: #bd79d0;
            }
            td{
                
                background-color: #c1b9c7;
            }
            .btn,.btn-large,.btn-large:hover{
                background-color: #7f65a7;
            }
            
             .alertify-notifier .ajs-message.ajs-success {
                       background-color: rgb(126, 87, 194);
            }
            #secondtable{
                display:none;
            }
        </style>
        <script>
      
            $(document).ready(function () {
                $('#tabs-swipe-demo').tabs({'swipeable': true});



            });
            function showToast(msg) {
                Materialize.toast(msg, 3000, 'blue');

            }





        </script>
    </head>

    <body>
       
        <c:if test="${newuser}" >

            <script type="text/javascript"> showToast()</script>
        </c:if>


        <input type="hidden" id="hiddenField"/>
        <nav>
            <div class="nav-wrapper">
                <a href="index.jsp" class="brand-logo">&nbsp&nbspRDPC</a>
                <a href="" class="brand-logo center">CLOUD ONE</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
               <li><a href="css1Logout">Logout</a></li>

                </ul>
            </div>
        </nav>



        <ul id="tabs-swipe-demo" class="tabs">
            <li class="tab col s12"><a href="#test1">Cloud One Authentication</a></li>


        </ul>
     
        <div id="test1" class="col s12 ">
            
             <div  id="firsttable" class="row" class="col s12">
            <form:form id="requestForm" onsubmit="return request();"  >
        
                <input type="hidden" id="user" name="user" value=""/>
                 <input type="hidden" id="sql" name="sql" value=""/>
                <table id="cloud_one_request" class="table-striped centered">


                    <thead>
                        <tr>
                            <th>User</th>
                            <th>SQL Query</th>
                            <th>Action</th>
                        </tr>
                    </thead>


                    <tbody>
                      
                        <tr>
                           
                                      
                            
                        
                             
                         

                        </tr>
                 

                    </tbody>
                </table>

            </form:form>
             </div>
        </div>
        <div  id="secondtable" class="row" class="col s12">

            <form:form onsubmit="return send();" >
                          <input type="hidden" id="response" name="user" value=""/>
                <table id="cloud_one_response"class="table-striped centered">


                    <thead>
                        <tr>

                            <th>Response</th>
                            <th>Action</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                 
                    <tr>

                      
                        

                    </tr>

                    
                    </tbody>
                </table>
            </form:form>
        </div>


    </div>



</body>
</html>
