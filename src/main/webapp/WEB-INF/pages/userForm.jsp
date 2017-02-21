<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>Информация о пользователе</title>
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body class=".container-fluid">
    <div class="container myrow-container">
        <div class="panel panel-success">
            <div class="panel-body">
                <form:form id="userRegisterForm" cssClass="form-horizontal" modelAttribute="user" method="post" action="saveUser">
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="name" >Name</form:label> </div>
                        <div class="col-xs-6">
                            <form:hidden path="id" value="${userObject.id}"/>
                            <form:input cssClass="form-control" path="name" value="${userObject.name}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="age" cssClass="control-label col-xs-3">Age</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="age" value="${userObject.age}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="admin">Is admin?(false/true)</form:label></div>
                        <div class="col-xs-6">
                             <form:input cssClass="form-control" path="admin" value="${userObject.admin}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-4">
                            </div>
                            <div class="col-xs-4">
                                <input type="submit" id="saveUser" class="btn btn-primary" value="Save" onclick="return submitEmployeeForm();"/>
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
    
                </form:form>
            </div>
        </div>
    </div>
	<script type="text/javascript">
        function isNumeric(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
		function submitEmployeeForm() {
		    var name = $('#name').val().trim();
		    var age = $('#age').val();
		    var admin = $('#admin').val();
		    if(name.length ==0) {
		        alert('Please enter a name');
		        $('#name').focus();
		        return false;
		    }

            if (!isNumeric(age) || age <=0 || age >100) {
		        alert('Please enter a valid age from 1 to 100');
		        $('#age').focus();
		        return false;
		    }
	
		    if(['0','1','false','true'].indexOf(admin.toLowerCase()) === -1)  {
		        alert('Please enter false/true');
		        $('#admin').focus();
		        return false;
		    }
		    return true;
		};	
	</script>
</body>
</html>