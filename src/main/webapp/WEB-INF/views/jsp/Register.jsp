<%-- 
    Document   : Login
    Created on : May 30, 2017, 3:29:47 PM
    Author     : ISI-1.1
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<!--
Template Name: Hoppler
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html lang="">
    <!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
    <head>
        <title>Registration</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
        <script src="js/Register.js"></script>
        <link href="hoppler/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <script src="hoppler/layout/scripts/jquery.min.js"></script>
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css"/>

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
        <style>
            form{ width:48%;}
            #usr{

                margin-left:30%;
            }
            
           

        </style>
        <script>
            
//           $(document).ready(function(){
//               
//               $("#submitBtn").click(fucntin(){{
//                   
//                   var name = $("#name").val();
//                   var = $("#age").val();
//                   var = $("#qual").val();  var = $("#name").val();
//                   var = $("#dob").val();
//                   var = $("#gender").val();  
//                   var = $("#addr").val(); 
//                   var = $("#name").val();
//                           
//                       
//               }
//               
          // }); 
            
            
        </script>
            
            
            
            
       
    </head>
    <body id="top">
        
        
         <c:if test="${not empty justregister}" >
             <script type="text/javascript">alertify.success("Registration Successfull");</script>
        </c:if>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- Top Background Image Wrapper -->
        <div class="bgded overlay" style="background-image:url('https://ak3.picdn.net/shutterstock/videos/4462814/thumb/1.jpg');"> 
            <!-- ################################################################################################ -->
            <div class="wrapper row1">
                <header id="header" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="index.jsp">Registration System</a></h1>
                    </div>
                    <nav id="mainav" class="fl_right">
                        <ul class="clear">
                            <li ><a href="Details">View</a></li>




                        </ul>
                    </nav>
                    <!-- ################################################################################################ -->
                </header>
            </div>
        </div>
        <form:form  action="userRegister" method="post" modelAttribute="usr" class="z-depth-5" onsubmit="return Register();" enctype="multipart/form-data">

            <div class="imgcontainer">
                <img src="https://my.apa.org/apa/img/membership-directory-login.png" alt="Avatar" class="avatar">
            </div>
            <div class="container">
                <div class="row">


                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="name" id="name" value="" placeholder="Name"/>  
                            
                            <span id="uerror"></span>


                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="age" id="age"   value="" placeholder="Age"/>  
                           
                            <span id="aerror"></span>


                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="qualification" id="qual"  placeholder="Qualification"/>  
                            
                            <span id="qerror"></span>


                        </div>


                        <div class="input-field col s12">
                            <i class="material-icons prefix">email</i>
                            <form:input path="dob" id="dob" placeholder="Date of Birth"/>  
                           
                            <span id="derror"></span>


                        </div>
                        <div class="input-field col s12" >
                            <i class="material-icons prefix">phone</i>
                            <form:input path="gender" id="gender" placeholder="Gender"/>  
                           
                            <span id="gerror"></span>


                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="address" id="addr" placeholder="Address"/>  
                            
                            <span id="aerror"></span>


                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="mobile" id="mob" placeholder="Mobile"/>  
                            
                            <span id="merror"></span>


                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="religion" id="rel" placeholder="Religion"/>  
                            
                            <span id="rerror"></span>


                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="nationality" id="nation" placeholder="nationality"/>  
                          
                            <span id="nerror"></span>


                        </div>
                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <form:input path="email" id="email" placeholder="Email"  />
                           
                            <span id="eerror"></span>


                        </div>   
                        <div class="row">

                            <div  id="key_gen"  class="col s12" data-tooltip="Step 1: Key Generation">
                                <form:form method="post"  id="keyform" action="/uploadFile"  enctype="multipart/form-data" style="height:  100%;width: 100%;margin-top:2%;margin-left:0%;">  
                                    <div class="file-field input-field">

                                        <div class="file-path-wrapper">
                                            <i class="fa fa-file " aria-hidden="true"></i>
                                            <input class="file-path validate" id="file" type="text" style="margin-left: 4%;width: 85%" placeholder="Choose a file ....." disabled>

                                        </div>


                                        <input class="file" name="file" type="file" multiple>
                                        <input type="hidden" name="dirpath" value="tmp"/>
                                        <br/>

                                    </div>

                                </form:form>
                            </div>

                        </div>
                        <button  id="submitBtn" type="submit">REGISTER</button>
                    </div>


                </div>
            </div>
        </form:form>

        <div class="wrapper row5">
            <div id="copyright" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <p class="fl_left">Copyright &copy; 2017 - All Rights Reserved</p>

                <!-- ################################################################################################ -->
            </div>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->

        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
    </body>
</html>