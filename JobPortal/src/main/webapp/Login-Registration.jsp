<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Register-login Form</title>
	<style>
	@import url('https://fonts.googleapis.com/css?family=Nunito');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  outline: none;
  text-decoration: none;
  list-style: none;
  font-family:'Book Antiqua';
}

body{
  background:  #412b76;
}

.wrapper{
  display: flex;
  max-width: 800px;
  width: 100%;
  height: 500px;
  position: absolute;
  top: 50%;
  left:50%;
  transform: translate(-50%,-50%);
}

.wrapper .left
{
    width: 50%;
    height: 100%; 

}
.wrapper .right{
  width: 50%;
  height: 100%;
  padding: 30px;
}
.wrapper .left{
    background: url("Blue\ Abstract\ Wave\ Phone\ Wallpaper.png");
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;

  }

.wrapper .left img{
  display:flex;
  width: 450px;
  height: 500px;
  margin: none;
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  
}

.wrapper .right{
  background: #fff;
  border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;

}

.wrapper .right .tabs ul{
  text-align: center;
}

.wrapper .right .tabs ul li{
  display: inline-block;
  margin: 5px;
  padding: 5px 10px;
  font-size: 14px;
  color: #412b76;
  text-transform: uppercase;
  letter-spacing: 2px;
  cursor: pointer;
}

.wrapper .right .tabs ul li.active{
  border-bottom: 2px solid #412b76;
}

.wrapper .right .register,
.wrapper .right .login{
  margin-top: 20px;
  border-radius: 20px;
}

.wrapper .right .input_field{
  margin-bottom: 15px;
  
}

.wrapper .right .input_field .input{
  width: 100%;
  padding: 15px 15px;
  border: 0;
  font-size: 12px;
  background: #5e92991a;
  border-radius: 10px;
}

.wrapper .right .btn{
  margin-top: 20px;
  background: #412b76;
  padding: 10px;
  text-align: center;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-weight: bold;
  border-radius: 10px;
}

.wrapper .right .btn a{
  color: #fff;
  display: block;
  font-size: 14px;
}
.btn {
    color: white;
    /* Add any other styles you want for the button here */
  }
  .alert-alert-success{
  background-color: #dff0d8;
  border-color: #d6e9c6;
  color: #3c763d;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid transparent;
  border-radius: 4px;
}
  
	</style>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$(".login").hide();
			$(".register_li").addClass("active");

			$(".login_li").click(function(){
			  $(this).addClass("active");
			  $(".register_li").removeClass("active");
			  $(".login").show();
			   $(".register").hide();
			})

			$(".register_li").click(function(){
			  $(this).addClass("active");
			  $(".login_li").removeClass("active");
			  $(".register").show();
			   $(".login").hide();
			})
		});
	</script>
	<script>
	  var successMessage = document.getElementById("success-message");
	  setTimeout(function() {
	    successMessage.style.display = "none";
	  }, 5000);
	</script>
</head>
<body>
<c:if test="${not empty succMsg}">
<div id="success-message" class="alert-alert-success" role="alert">${ succMsg}</div>
<c:remove var="succMsg"/>
</c:if>
  <div class="wrapper">
  <div class="left">
    
     
    <img src="Blue Abstract Wave Phone Wallpaper.png" class="logo1">
    
  </div>
  <div class="right">
    <div class="tabs">
      <ul>
        <li class="register_li">Register</li>
        <li class="login_li">login</li>
      </ul>
    </div>
    <form action="Register" method="post">
    <div class="register">
      <div class="input_field">
        <input type="text" placeholder="Username" class="input" name="reg_U"required>
      </div>
      <div class="input_field">
        <input type="text" placeholder="E-mail" class="input" name="reg_E" required>
      </div>
      <div class="input_field">
        <input type="password" placeholder="Password" name="reg_P" class="input" required>
      </div>
      <div class="input_field">
        <input type="number" placeholder="Age" name="reg_A" class="input" required>
      </div>
    <div class="input_field">
  <input type="radio" id="html" name="user_type" value="Job Seeker" required>
  <label for="html">Job Seeker</label><br>
  <input type="radio" id="css" name="user_type" value="Employer" required>
  <label for="css">Employer</label><br>
    </div>
      <input type="submit" class="btn" value="Register">
    </div>
    </form>
    
    <div class="login" >
    <form action="Login" method="post">
      <div class="input_field">
        <input type="text" name="Username" placeholder="E-mail" class="input" required>
      </div>
      <div class="input_field">
        <input type="password" name="Password" placeholder="Password" class="input" required>
      </div>
      <input type="submit" class="btn" value="Login">
      </form>
      
    </div>
    
  </div>
</div>
</body>
</html>