function LoginController(user,pass) {

   		this.user = user;
   		this.pass = pass;
         
        fd = new FormData();
        fd.append("user",user);
        fd.append("pass",pass);
        
        this.validate = function(){
			 
  			 var error = new Error();

  			 if(user== "" && pass == "" ){
                  
                   error.showUError();
                   error.showPError();
                   return false;
          }
          else{
            
            if(user == ""){
                    error.showUError();
                    return false;
              }
              else if( pass == "" ){
                    error.showPError();
                    return false;
              }
                    
              else{

                  return true;
              }

          }


      }
   		this.login = function(){

   			  $('#signupForm').submit();
   		}

   		this.redirect = function(){
        
   			//$(location).attr('href', 'LoginIndex');

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

 
function Login(){

    		var userName = $("#u").val();
    		var userPass = $("#p").val();

    		var log = new LoginController(userName,userPass);

        
        console.log("status = " + log.validate());
    		if(log.validate()){ return true} else{ return false}
}
