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
        <style>
            .nombre-usuario {
                font-size: 1.5em;
            }
            .historial {
                font-size: 1.2em;
            }
        </style>

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
                                <!--<li><a href="srvUsuario?accion=nuevaCita"><i class="fa fa-heart"></i>Nueva Cita</a></li>-->

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
                    <h1>Página Historial Médico</h1>
                    <ol class="breadcrumb">
                        <li><a href="srvUsuario?accion=inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Administrar Cita</li>
                    </ol>
                </section>

                <section class="content">

                    <div class="row">
                        <div class="col-md-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Nombre Completo</h3>
                                </div>
                                <div class="panel-body">
                                    <p class="nombre-usuario"> ${personaN.nombre_completo}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Detalles Personales</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Lugar de Nacimiento:</strong> ${personaN.lugar_nacimiento}</p>
                                            <p><strong>Género:</strong> ${personaN.genero}</p>
                                            <p><strong>Dirección:</strong> ${personaN.direccion}</p>
                                        </div>
                                        <div class="col-md-6 ">
                                            <p><strong>Fecha de Nacimiento:</strong> ${personaN.edad}</p>
                                            <p><strong>Tipo de Sangre:</strong> ${personaN.tipo_sangre}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Información Adicional</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Email:</strong> ${personaN.email}</p>
                                            <p><strong>Número:</strong> ${personaN.numero_telefono}</p>
                                            <p><strong>No Identificación:</strong> ${personaN.numero_documento}</p>
                                        </div>
                                        <div class="col-md-6 ">
                                            <p><strong>Ocupación:</strong> ${personaN.ocupacion}</p>
                                            <p><strong>Estado Civil:</strong> ${personaN.estado_civil}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">            
                        <div class="col-md-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Historiales Médicos</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table id="historial-table" class="table table-bordered table-striped table-sortable">
                                            <thead>
                                                <tr>

                                                    <th data-defaultsort="asc">Fecha</th>
                                                    <th>Motivo de la Cita</th>
                                                    <th>Observación</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Aquí iteramos sobre la lista de historiales -->
                                                <c:forEach var="historial" items="${historiales}">
                                                    <c:if test="${historial.estado eq true}">
                                                        <tr>

                                                            <td>${historial.fecha}</td>
                                                            <td>${historial.motivo_cita}</td>
                                                            <td>${historial.observacion}</td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <form action="srvHistorial?accion=insertarHistorial" method="post">    
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Motivo de la Cita</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea class="form-control" rows="1" id="motivo" name="motivo" placeholder="Escribe el motivo de la cita aquí..."required></textarea>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Observaciones</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea class="form-control" rows="3" id="observaciones" name="observaciones" placeholder="Escribe las observaciones aquí..."required></textarea>
                                    </div>
                                </div>

                                <input type="hidden" name="codigo" value="${personaN.id_persona}">
                                <input type="hidden" name="codig" value="${personaN.usuario.id_usuario}">
                                <button type="submit" class="btn btn-primary">Agregar Historial Médico</button>
                                <a href="srvCita?accion=listarCitas" class="btn btn-default">
                                    <i></i> Ver listado</a> 
                            </form>
                        </div>
                    </div>
                </section>

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
                                    $('#historial-table').DataTable();
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