
  <%@page import="java.io.FileReader"%>
  <%@page import="java.io.BufferedReader"%>
  <%@page import="java.io.BufferedReader"%>
  <%@page import="java.io.File"%>
  <%@page import="com.cloud.Model.FileOb"%>

  <%@page import="java.util.ArrayList"%>
  <%@page import="com.cloud.Dao.DAO"%>
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
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    

    <!-- Compiled and minified  MCSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
    <link href="https://fonts.googleapis.com/css?family=Cormorant+SC" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">


    <!-- Alertify CDN START-->
    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/alertifyjs/1.10.0/alertify.min.js"></script>
    <link href="hoppler/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    <!-- CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/semantic.min.css"/>
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/bootstrap.min.css"/>
    <!-- Alertify CDN END-->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fileDownload/1.4.2/jquery.fileDownload.min.js"></script>

    <!-- Custome CSS -->

     <link rel="stylesheet" type="text/css" href="${context}/css/style.css" />
     <link rel="stylesheet" type="text/css" href="${context}/css/dataowner.css"/>


    <title>Multiagent</title>
 <script>
            
             $(document).ready(function(){
                $.fileDownload('index.jsp');
                
                
            });
        </script>
    <script>


      $(document).ready(function () {
        
        $('select').material_select();
      });     
     
      
      $(document).ready(function(){
          
          Retrieve();
          
      });
      function submitForm() {


        console.log("submit event");
        var fd = new FormData(document.getElementById("fileinfo"));
        fd.append("label", "WEBUPLOAD");
        $.ajax({
          url: "uploadFile",
          type: "POST",
          data: fd,
                    processData: false,  // tell jQuery not to process the data
                    contentType: false   // tell jQuery not to set contentType
                  }).done(function( data ) {
                    console.log("PHP Output:");
                    console.log( data );
                      //showToast2(data,'blue');

                    });
                  


                  return false;
                }




        function Retrieve() {
          console.log("submit event");

          $.ajax({

            url: "view",
            type: "GET",
            dataType:'json',
            processData: false,  // tell jQuery not to process the data
            contentType: false   // tell jQuery not to set contentType
          }).done(function( data ) {

           if($.trim(data)){
                 //alert("hello");
                 
                 alertify.success("Retrieving Result");
                 console.log("checkresponse = " + data.response);
                 
                 console.log(data.gender);
                 //var data1 = JSON.parse(data);
                  //console.log(data1.religion);
                 $('#cloud_one_response > tbody:last').append("<tr><td>" + data.name + "</td><td>" + data.age + "</td><td>" + data.qualification + "</td><td> " + data.dob + "</td><td>" + data.gender + "</td><td>" + data.address + "</td><td>" + data.mobile + "</td><td> " + data.religion + "</td><td>" + data.nationality + "</td><td>" + data.email + "</td><td><a href=cssprofile1?id=" + data.fileId + "?.txt>" + data.fileId + "</a> </td></tr>");

                 $("#cloud_one_response").fadeIn(3000).css("display","table");
              
               }


             });

        }

      

     </script>


     <style>


     </style>
     <script>

      $(document).ready(function () {
        $('#tabs-swipe-demo').tabs({'swipeable': true});

      });
    
            $(document).ready(function () {
              $('#upload_div').tooltip({delay: 50, tooltip: 'Step Select File'});
              $('#key_gen').tooltip({delay: 50});
              $('#table_cret').tooltip({delay: 50});
              $('#in_table').tooltip({delay: 50});
              $('#range_table').tooltip({delay: 50});

            });



          </script>
        </head>

        <body >
         <c:if test="${not empty justregister}" >
             <script type="text/javascript">alertify.success("Registration Successfull");</script>
        </c:if>

          <!-- Top Background Image Wrapper -->
          <div class="bgded overlay" style="background-image:url('https://ak3.picdn.net/shutterstock/videos/4462814/thumb/1.jpg');"> 
            <!-- ################################################################################################ -->
            <div class="wrapper row1">
              <header id="header" class="hoc clear"> 

                <div id="logo" class="fl_left">
                  <h1><a href="Register">Registration System</a></h1>
                </div>

                <nav id="mainav" class="fl_right">

                  <ul class="clear">

                    <li ><a href="Register">Register</a></li>

                  </ul>

                </nav>

              </header>
            </div>
          </div>


          <ul id="tabs-swipe-demo" class="tabs">
            <li class="tab col s3"><a class="active" href="#test1">Registration Details</a></li>
      
          </ul>


          <!-- Tab1 Start -->

          <div id="test1" class="col s12 ">

                    <div class="row">


                            <div class="container" >
                                   <table class="table-striped centered" id="cloud_one_response" >


                                   <thead>
                                     <th>Name</th>
                                     <th>Age</th>
                                     <th>Qualification</th>
                                     <th>DOB</th>
                                     <th>Gender</th>
                                     <th>Address</th>
                                     <th>Mobile</th>
                                     <th>Religion</th>
                                     <th>Nationality</th>
                                     <th>Email</th>
                                     <th>File Id</th>
                                   </thead>

                                   <tbody></tbody>

                          </div>

                    </div>
          </div>

    </body>
 
  </html>
