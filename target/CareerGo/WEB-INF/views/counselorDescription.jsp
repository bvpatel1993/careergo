<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Career Go | Counselor-Description</title>
</head>

<script type="text/javascript">
function hidingDetails(value){
	if(value == 1){
		document.getElementById('counseloreditableDescription').style.display = "none";
		document.getElementById('counselorUneditableDescription').style.display = "block";
	}else{
		document.getElementById('counseloreditableDescription').style.display = "block";
		document.getElementById('counselorUneditableDescription').style.display = "none";
		var id = $("#counselorId").val();var exp = $("#dExperience").val();var des = $("#dDescription").val();
		$("#coId").val(id);$("#cExperience").val(exp);$("#cDescription").val(des);
		
	}
}
</script>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
					<!-- Logo -->
				<a href="#" class="logo">
					<span class="logo-lg"><img src="<c:url value='/resources/bootstrap/images/CareerGoLogo.png' />" ></span>
				</a>
				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top" role="navigation">
					<!-- Navbar Right Menu -->
					<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="<c:url value='/resources/bootstrap/images/male.png' />" class="user-image" alt="User Image">
							<span class="hidden-xs">Settings <i class="fa fa-gears"></i></span>
						</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header">
								<img src="<c:url value='/resources/bootstrap/images/male.png' />" class="img-circle" alt="User Image">
								<p>${register.fullname}<small>Member since ${register.sDate}</small></p>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
							<div class="pull-left">
								<button title="Reset Password" onclick="resetPassword()" class="btn btn-warning btn-flat">Reset Password</button>
							</div>
							<div class="pull-right">
								<a href="login" title="Logout" class="btn btn-danger btn-flat">Logout</a>
							</div>
							</li>
						</ul>
						</li>
					</ul>
					</div>
				</nav>
			</header>
			
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<section class="sidebar">
		          <!-- Sidebar user panel -->
		          <div class="user-panel">
		            <div class="pull-left image" style="height: 45px;">
		           	 <%-- <c:if test="${counsellor.id > 0}">
		           	 	<img src="getImage?id=${counsellor.id}" class="img-circle" alt="User Image">
		           	 </c:if> --%>
		           	 <img src="<c:url value='/resources/bootstrap/images/female.png' />" class="img-circle" alt="User Image">
		            </div><!-- <c:url value='/resources/bootstrap/images/male.png' />  -->
		            <div class="pull-left info"><p>${register.fullname}</p><a href="#"><i class="fa fa-circle text-success"></i> ${register.vStatus}</a></div>
		          </div>
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview"><a href="counselorBasic?id=${register.id}&roleId=${register.roleId}"><span>Personal</span></a></li>
					<li class="treeview active"><a href="counselorProfile?id=${register.id}&roleId=${register.roleId}"><span>Description</span></a></li>
					<li class="treeview"><a href="counselorForum?id=${register.id}&roleId=${register.roleId}"><span>Chat Forum</span></a></li>
				</ul>
				</section>
			<!-- /.sidebar -->
			</aside>
			
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header"><h1>Description Details</h1></section>
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Details</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body" id="counseloreditableDescription" style="display: none;">
                 <form:form action="saveDescription" method="post" enctype="multipart/form-data" commandName="counsellorDesc" >
                	<div class="form-group">
                	  <form:input class="form-control" type="hidden" id="registerId" name="registerId" path="registerId" value="${register.id}" />
                	  <form:input class="form-control" type="hidden" id="roleId" name="roleId" path="roleId" value="${register.roleId}" />
                	  <form:input class="form-control" type="hidden" id="coId" name="id" path="id" value="" />
                	  <label>Qualification</label>
                      <form:input type="text" class="form-control" id="cQualification" path="qualification" placeholder="Qualification" value="${counsellor.qualification}"  />
                      <label>Experience</label>
                      <form:textarea type="text" class="form-control" id="cExperience" path="experience" placeholder="Experience" value=""  />
                      <label>Description</label>
                      <form:textarea type="text" class="form-control" id="cDescription" path="description" placeholder="Description" value=""  />
                      <label>Choose Photo</label>
                      <form:input type="file" id="photoFile" name="photoFile" path="photoFile" placeholder="" />
                    </div>
                     <button id="btnSubmiter" style="float: right;margin-left: 2%;display: block;" type="submit" class="btn btn-success" value="Update" >Update</button>
	            	 <button style="float: right;" type="button" class="btn btn-danger" onclick="hidingDetails(1)">Cancel</button>
	             </form:form>
                </div>

                <div class="box-body" id="counselorUneditableDescription" style="display: block;">
                	<form role="form">
	                  <div class="box-body">
	                    <div class="form-group">
	                      <input type="hidden" class="form-control" id="counselorRegisterId" placeholder="id" disabled value="${register.id}">
	                      <input type="hidden" class="form-control" id="counselorRoleId" placeholder="id" disabled value="${register.roleId}">
	                      <input type="hidden" class="form-control" id="counselorId" placeholder="id" disabled value="${counsellor.id}">
	                      <label>Qualification</label>
	                      <input type="text" class="form-control" id="cQualification" placeholder="Qualification" value="${counsellor.qualification}" disabled>
	                      <label>Experience</label>
	                      <textarea type="text" class="form-control" id="dExperience" placeholder="Experience" disabled>${counsellor.experience}</textarea>
	                      <label>Description</label>
	                      <textarea type="text" class="form-control" id="dDescription" placeholder="Description" disabled>${counsellor.description}</textarea>
	                      
	                    </div>
	                  </div><!-- /.box-body -->
	                  <div class="box-footer">
	                    <button style="float: right;" type="button" class="btn btn-info" onclick="hidingDetails(2)">Edit</button>
	                  </div>
	                </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
		      <div >
		      </div>
			</div>
		</div>
	</section>
      <!-- Control Sidebar -->
   </div><!-- ./wrapper -->
   <footer class="main-footer">
   	<strong>Copyright &copy; 2017-2018 <a href="#">Career Go</a>.&nbsp;</strong>
     <div class="pull-right hidden-xs">
     	 All rights reserved.
     </div>
   </footer>

 </div><!-- ./wrapper -->
 
 <!-- Modals  -->
	<div id="ResetPasswordModal" class="modal">
       <div class="modal-dialog">
         <div class="modal-content">
         	<form class="form">
           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button>
             <h4 class="modal-title">Reset Password</h4>
           </div>
           <div class="modal-body">
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
					 <input type="email" path="email" id="email" name="email" placeholder="Confirm Email" class="form-control" /><br> 
					 <input	type="password" placeholder="New Password" id="password" name="password" class="form-control" min="8" path="password" /><br>
					 <input type="password" placeholder="Confirm Password" id="confirmpassword" name="confirmpassword" class="form-control" min="8" path="confirmpassword" /><br>
				</div>
			</div>
			</div>
           <div class="modal-footer">
           	<button type="button" class="btn btn-primary" onclick="updatePassword()">Update</button>
             <button type="button" class="btn btn-danger " data-dismiss="modal">Cancel</button>
           </div>
           </form>
         </div><!-- /.modal-content -->
       </div><!-- /.modal-dialog -->
    </div>

</body>
</html>