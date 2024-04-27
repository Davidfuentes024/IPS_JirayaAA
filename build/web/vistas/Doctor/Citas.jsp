<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema IPS PRO AA| Inicio</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>


        <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect. -->
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <script>
            function formatUserName(userName) {
                return userName.charAt(0).toUpperCase() + userName.slice(1).toLowerCase();
            }
        </script>
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">
                <a href="srvUsuario?accion=inicio" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b></b>AA</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Sistema </b>IPS Pro AA</span>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->

                                    <img src="dist/img/59613224-el-doctor-avatar-perfil-aisló-el-icono-gráfico-del-ejemplo-del-vector.jpg" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">${nombre}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/59613224-el-doctor-avatar-perfil-aisló-el-icono-gráfico-del-ejemplo-del-vector.jpg"" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - <script>document.write(formatUserName('${usuario.nombreUsuario}'));</script>
                                            <small>Usted es, <script>document.write(formatUserName('${usuario.cargo.nombreCargo}/a'));</script></small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="srvSession?accion=cerrar" class="btn btn-default btn-flat">Cerrar Sesion</a>
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

                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="dist/img/59613224-el-doctor-avatar-perfil-aisló-el-icono-gráfico-del-ejemplo-del-vector.jpg"" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido, <script>document.write(formatUserName('${usuario.nombreUsuario}'));</script></p>
                            <!-- Status -->
                            <a href="#"><i class="fa fa-circle text-success"></i> En línea</a>
                        </div>
                    </div>

                    <!-- search form (Optional) -->


                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">INICIO</li>
                        <!-- Optionally, you can add icons to the links -->
                        <li class=""><a href="srvUsuario?accion=inicio"><i class="fa fa-link"></i> <span>Panel Administrativo</span></a></li>

                        <li class="active treeview">
                            <a href="#"><i class="fa fa-heart"></i> <span>Citas</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="srvCita?accion=listarCitas"><i class="fa fa-heart-o"></i>Administrar Cita</a></li>

                            </ul>
                        </li>
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Página Citas

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="srvUsuario?accion=inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Administrar Cita</li>
                    </ol>
                </section>
                <!-- Content Header (Page header) -->


                <section class="content">
                    <div class="box">    
                        <div class="box-header with-border">             
                            <h3 class="box-title">Listado de Citas activas</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive" >                                 
                                <table class="table table-bordered table-striped dataTable table-hover" id="tablaCitas" class="display">
                                    <thead>
                                        <tr>

                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Paciente</th>
                                            <th>Doctor</th>
                                            <th>Descripción</th> 
                                            <th>Sede</th> 
                                            <th>Consultorio</th> 
                                            <th>Acciones</th> 
                                        </tr>
                                    </thead>
                                    <c:forEach var="cit" items="${citas}" varStatus="iteracion">      
                                        <c:if test="${cit.estado eq true}">
                                            <tr>

                                                <td>${cit.fecha}</td>
                                                <td>${cit.hora}</td>                                            
                                                <td>${cit.paciente.nombreUsuario}</td>  
                                                <td>${cit.doctor.nombreUsuario}</td>  
                                                <td>${cit.descripcion}</td>
                                                <td><script>document.write(formatUserName('${cit.sede.nombreSede}'));</script></td>
                                                <td><script>document.write(formatUserName('${cit.consultorio.nombreConsultorio}'));</script></td>
                                                <td><a 
                                                        href="<c:url value="srvHistorial">
                                                            <c:param name="accion" value="historialMedicoPaciente" />
                                                            <c:param name="codi" value="${cit.paciente.id_usuario}" />
                                                        </c:url>"><button type="button" class="btn btn-primary" data-toggle="tooltip"  title="Editar" data-original-title="Editar">
                                                            <i class="fa fa-clipboard"></i></button></a>
                                                    <!-- DESACTIVAR / ACTIVAR CITAS -->
                                                    <c:choose>
                                                        <c:when test="${cit.estado == true}">
                                                            <input type="hidden" id="item" value="${cit.codigo}">
                                                            <a id="desactivarUsuario" href="srvCita?cambiarEstadoCita=desactivar&cod=${cit.codigo}" class="btn btn-success"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                                <i class="fa fa-check"></i></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <input type="hidden" id="item" value="${cit.codigo}">
                                                            <a id="activarUsuario" href="srvCita?cambiarEstadoCita=activar&cod=${cit.codigo}" class="btn btn-danger" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                                <i class="fa fa-remove"></i></a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                </td>


                                            </tr> 
                                        </c:if>
                                    </c:forEach>                                               
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <!--Pie de página-->
                        </div>
                        <!-- /.box-footer-->
                    </div>
                    <div class="box">    
                        <div class="box-header with-border">             
                            <h3 class="box-title">Listado de Citas inactivas</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive" >                                 
                                <table class="table table-bordered table-striped dataTable table-hover" id="tablaCitas2" class="display">
                                    <thead>
                                        <tr>

                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Paciente</th>
                                            <th>Doctor</th>
                                            <th>Descripción</th> 
                                            <th>Sede</th> 
                                            <th>Consultorio</th> 
                                            <th>Acciones</th> 
                                        </tr>
                                    </thead>
                                    <c:forEach var="cit" items="${citas}" varStatus="iteracion">   
                                        <c:if test="${cit.estado eq false}">
                                            <tr>

                                                <td>${cit.fecha}</td>
                                                <td>${cit.hora}</td>                                            
                                                <td>${cit.paciente.nombreUsuario}</td>  
                                                <td>${cit.doctor.nombreUsuario}</td>  
                                                <td>${cit.descripcion}</td>
                                                <td><script>document.write(formatUserName('${cit.sede.nombreSede}'));</script></td>
                                                <td><script>document.write(formatUserName('${cit.consultorio.nombreConsultorio}'));</script></td>
                                                <td><a 
                                                        href="<c:url value="srvHistorial">
                                                            <c:param name="accion" value="historialMedicoPaciente" />
                                                            <c:param name="codi" value="${cit.paciente.id_usuario}" />
                                                        </c:url>"><button type="button" class="btn btn-primary" data-toggle="tooltip"  title="Editar" data-original-title="Editar">
                                                            <i class="fa fa-clipboard"></i></button></a>
                                                    <!-- DESACTIVAR / ACTIVAR CITAS -->
                                                    <c:choose>
                                                        <c:when test="${cit.estado == true}">
                                                            <input type="hidden" id="item" value="${cit.codigo}">
                                                            <a id="desactivarUsuario" href="srvCita?cambiarEstadoCita=desactivar&cod=${cit.codigo}" class="btn btn-success"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                                <i class="fa fa-check"></i></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <input type="hidden" id="item" value="${cit.codigo}">
                                                            <a id="activarUsuario" href="srvCita?cambiarEstadoCita=activar&cod=${cit.codigo}" class="btn btn-danger" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                                <i class="fa fa-remove"></i></a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                </td>


                                            </tr> 
                                        </c:if>
                                    </c:forEach>                                               
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <!--Pie de página-->
                        </div>
                        <!-- /.box-footer-->
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                    Universidad Pontificia Bolivariana
                </div>
                <!-- Default to the left -->
                <strong>IPS PRO &copy; 2024 <a href="https://github.com/CratosCamilo" target="_blank">KMI</a>.</strong> Todos los derechos reservados.
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 3 -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="js/funcionesUsuario.js" type="text/javascript"></script>
        <script>
                                                    $(document).ready(function () {
                                                        $('#tablaCitas').DataTable();
                                                    });
        </script>
        <script>
            $(document).ready(function () {
                $('#tablaCitas2').DataTable();
            });
        </script>
        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>