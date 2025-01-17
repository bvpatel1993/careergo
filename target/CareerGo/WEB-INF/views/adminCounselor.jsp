<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Career Go | Admin-Counselor Details</title>
</head>

<script type="text/javascript">

function updateDetails(id){
	var urls = "updateStatusDetails?registerId="+id;
	$.ajax({
        type: "POST", 
        url: urls, 
        success: function(data) 
        {
        	if(data.flag == true){
        		toastr.success(data.message);window.location.reload(true);
        	}else{
        		toastr.warning(data.message);//alert(data.message);
        	}
        }          
   });
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
								<button href="#" onclick="resetPassword()" title="Reset Password" class="btn btn-warning btn-flat">Reset Password</button>
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
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="<c:url value='/resources/bootstrap/images/male.png' />" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>${register.fullname}</p>
              <a href="#"><i class="fa fa-circle text-success"></i>Admin</a>
            </div>
          </div>
          <!-- search form -->
          <!-- <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form> -->
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
              <a href="adminProfile?id=${register.id}&roleId=${register.roleId}">
                <span>Profile</span>
                 <i class="fa pull-right"></i>
                 </a>
            </li>
            
            <li class="treeview">
              <a href="adminApplicant?id=${register.id}&roleId=${register.roleId}">
                <span>Applicant</span>
                <span class="label label-primary pull-right"></span>
              </a>
            </li>
            
            
            
            <li class="treeview">
              <a href="adminCompany?id=${register.id}&roleId=${register.roleId}">
                <span>Company</span>
              
              </a>
            </li>
            <li class="active treeview">
              <a href="adminCounselor?id=${register.id}&roleId=${register.roleId}">
                <span>Counselor</span>
              </a>
            </li>
            <li class="treeview"><a href="#"><span>Test</span> <i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a href="adminTest?id=${register.id}&roleId=${register.roleId}"><i class="fa fa-circle-o"></i> Tests</a></li>
					<li><a href="adminTestGrade?id=${register.id}&roleId=${register.roleId}"><i class="fa fa-circle-o"></i> Grade</a></li>
				</ul>
			</li>
            </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

     <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header"><h1>Counselor Details</h1></section>
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">Details</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                  <table id="counselor" class="table table dataTable"><!--  table table-bordered table-hover dataTable -->
                    <thead class="no-sort">
                      <tr>
                      	<th style="display:none;">RegistrationId</th>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Registered Date</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody id="counselorDetails">
                      <c:forEach items="${counselorList}" var="counselorList">
                      	<tr>
                      		<td style="display:none;">${counselorList.id}</td>
							<td>${counselorList.firstname}</td>
							<td>${counselorList.lastname}</td>
							<td>${counselorList.email}</td>
							<td>${counselorList.gender}</td>
							<td>${counselorList.address}</td>
							<td>${counselorList.phone}</td>
							<td>${counselorList.sDate}</td>
							<c:if test="${counselorList.bStatus == false}">
								<td style="cursor: pointer;" title="click to verify" onclick="updateDetails(${counselorList.id});"><span class="label label-warning">${counselorList.vStatus}</span></td>
							</c:if>
							<c:if test="${counselorList.bStatus == true}">
								<td onclick="editCounselor(${counselorList.id});"><span class="label label-success">${counselorList.vStatus}</span></td>
							</c:if>
                      	</tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
		      <div >
		      <!-- <footer style="margin-left: 0px;" class="main-footer">
		        <div class="hidden-xs">
		        	<strong>Copyright &copy; 2017-2018 <a href="#">Career Go</a>.&nbsp;</strong> All rights reserved.
		        </div>
		      </footer> -->
		      
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
   </div>
   
<script type="text/javascript">

$(function () {
    $('#counselor').dataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });

</script>   

<!-- Modals  -->
	<div id="ResetPasswordModal" class="modal">
       <div class="modal-dialog">
         <div class="modal-content">
         	<form class="form">
           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
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