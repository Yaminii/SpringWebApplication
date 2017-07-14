function RegisterController(user,pass,email,mobile) {

   		this.user = user;
   		this.pass = pass;
      this.email = email;
      this.mobile = mobile;

         
      fd = new FormData();
      fd.append("user",user);
      fd.append("pass",pass);
        
      this.validate = function(){
			 

          var user_reg = new RegExp('^[a-z0-9_-]{3,15}$');
          var pass_reg = new RegExp('^[0-9a-zA-Z]{8,}$');
          var email_reg = new RegExp('^[a-zA-Z0-9.!#$%&?*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
          var mobile_reg = new RegExp("^[0-9]{10}$");
      		var error = new Error();

      		if(user== "" && pass == "" &&  email == "" && mobile == "" ){
                      
                       error.showUError();
                       error.showPError();
                       error.showEError();
                       error.showPMrror();
                       return false;
            }
            else{

                var status = null;
                
                if(user == "" || !user_reg.test(user)){
                        error.showUError();
                        return false;
                  }
                  else if( pass == "" || !pass_reg.test(pass)){
                        error.showPError();
                        return false;
                  }
                        
                  else if(email == "" || !email_reg.test(email)){
                      
                      error.showEError();
                      return false;
                  }
                  else if(mobile == "" || !mobile_reg.test(mobile)){

                      error.showMError();
                      return false;
                  }
                  else{

                    return true;
                  }

            }


      }
   		
};

function Error(){
	 	
	 this.showUError = function(){

 			      var uerror = $('#uerror');
            uerror.text("Username is Invalid !");
            uerror.css('color','red');

            uerror.css("display","block");
     }
	 
	 this.showPError = function(){

	 	       var perror = $('#perror');
           perror.text("Passworld is Invalid !");
           perror.css('color','red');
           perror.css("display","block");
    }

     this.showEError = function(){

           var eerror = $('#eerror');
           eerror.text("Email is Invalid !");
           eerror.css('color','red');
           eerror.css("display","block");
    }
     this.showMError = function(){

           var merror = $('#merror');
           merror.text("Mobie is Invalid !");
           merror.css('color','red');
           merror.css("display","block");
    }
}


function back_task(URL,Methodtype,fd,datatype,callback){

	$.ajax({

          url: URL,
          type: Methodtype,
          dataType:datatype,
          data:fd,
          processData: false,  // tell jQuery not to process the data
          contentType: false   // tell jQuery not to set contentType

     }).done(function(data){
     		alert("data" + data);
    });
}

 
function Register(){

    		var userName    =  $("#u").val();
    		var userPass    =  $("#p").val();
        var email       =  $("#e").val();
        var mobile      =  $("#m").val();

      //   alert(userName + userPass + email + mobile)
    	var log = new RegisterController(userName,userPass,email,pass);

        //alert(log.validate());
      //  // console.log("status = " + log.validate());

      //   //alert("status = " + log.validate());
    		//if(log.validate()){ return true} ;
        return false;
}
