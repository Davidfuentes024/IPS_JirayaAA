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
                                    <img src="dist/img/sticker-png-login-icon-system-administrator-user-user-profile-icon-design-avatar-face-head.png" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">${nombre}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/sticker-png-login-icon-system-administrator-user-user-profile-icon-design-avatar-face-head.png" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - <script>document.write(formatUserName('${usuario.nombreUsuario}'));</script>
                                            <small>Usted es, <script>document.write(formatUserName('${usuario.cargo.nombreCargo}'));</script> </small>
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
                            <img src="dist/img/sticker-png-login-icon-system-administrator-user-user-profile-icon-design-avatar-face-head.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido,  <script>document.write(formatUserName('${usuario.nombreUsuario}'));</script> </p>
                            <!-- Status -->
                            <a href="#"><i class="fa fa-circle text-success"></i> En línea</a>
                        </div>
                    </div>
                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">INICIO</li>
                        <!-- Optionally, you can add icons to the links -->
                        <li class=""><a href="srvUsuario?accion=inicio"><i class="fa fa-link"></i> <span>Panel Administrativo</span></a></li>
                        <li class="active treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Registros</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">                                
                                <li><a href="srvUsuario?accion=listarUsuarios"><i class="fa fa-address-card"></i>Administrar Usuarios</a></li>
                                <li><a href="srvPersona?accion=listarPersonas"><i class="fa fa-users"></i>Administrar Personas</a></li>
                                <li><a href="srvUsuario?accion=nuevo"><i class="fa fa-user-plus"></i>Nuevo Usuario</a></li>
                            </ul>

                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-heart"></i> <span>Citas</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">

                                <!-- Mostrar enlace "Nueva Cita" solo para Pacientes -->

                                <!-- Mostrar enlace "Nueva Cita" solo para Pacientes -->                                

                                <li><a href="srvCita?accion=listarCitas"><i class="fa fa-heart-o"></i>Administrar Cita</a></li>

                            </ul>
                        </li>
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper. Contains page content -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <section class="content-header">
                    <a href="srvUsuario?accion=listarUsuarios" class="btn btn-default">
                        <i class="fa fa-align-justify"></i> Ver listado</a> 
                    <ol class="breadcrumb">
                        <li><a href="srvUsuario?accion=inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Nuevo Usuario</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <i class="fa fa-edit"></i> <h3 class="box-title">Registrar Nuevo Usuario y Persona</h3>  
                        </div>
                        <form class="form-horizontal" action="srvPersona?accion=actualizarPersona" method="post">
                            <input type="hidden" name="codigo" value="${personaN.id_persona}">
                            <div class="box-body">                               
                                <!-- Campos para la Persona -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nombre Completo</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombreCompleto" type="text" class="form-control" placeholder="Ejemplo: Juan Pérez" name="txtNombreCompleto" maxlength="50" value="${personaN.nombre_completo}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Tipo de Sangre</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-tint"></i></span>
                                        <input id="tipoSangre" type="text" class="form-control" placeholder="Ejemplo: O+" name="txtTipoSangre" maxlength="5"value="${personaN.tipo_sangre}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Género</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-venus-mars"></i></span>
                                        <select class="form-control" name="cboGenero" required>
                                            <option value="">Seleccione el género</option>
                                            <c:forEach var="genero" items="${generos}">
                                                <c:choose>
                                                    <c:when test="${genero eq personaN.genero}">
                                                        <option value="${genero}" selected>${genero}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${genero}">${genero}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Fecha de Nacimiento</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="fechaNacimiento" type="date" class="form-control" name="txtFechaNacimiento" value="${personaN.edad}" required>
                                    </div>
                                </div>
                                <!-- Otros campos para la Persona -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Lugar de Nacimiento</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input id="lugarNacimiento" type="text" class="form-control" placeholder="Ejemplo: Bucaramanga" name="txtLugarNacimiento" maxlength="50"value="${personaN.lugar_nacimiento}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Correo Electrónico</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <input id="correoElectronico" type="email" class="form-control" placeholder="Ejemplo: usuario@gmail.com" name="txtCorreoElectronico" maxlength="50"value="${personaN.email}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Número de Teléfono</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                        <input id="numeroTelefono" type="tel" class="form-control" placeholder="Ejemplo: 1234567890" name="txtNumeroTelefono" maxlength="15"value="${personaN.numero_telefono}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Dirección</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input id="direccion" type="text" class="form-control" placeholder="Ejemplo: Calle 123 #456" name="txtDireccion" maxlength="100"value="${personaN.direccion}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Ocupación</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
                                        <input id="ocupacion" type="text" class="form-control" placeholder="Ejemplo: Estudiante" name="txtOcupacion" maxlength="50"value="${personaN.ocupacion}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Estado Civil</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <select class="form-control" name="cboEstadoCivil" required>
                                            <option value="">Seleccione el estado civil</option>
                                            <c:forEach var="estadoCivil" items="${estadosCiviles}">
                                                <option value="${estadoCivil}" ${estadoCivil eq personaN.estado_civil ? 'selected' : ''}>${estadoCivil}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Número de Documento</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-id-card"></i></span>
                                        <input id="numeroDocumento" type="text" class="form-control" placeholder="Ejemplo: 1234567890" name="txtNumeroDocumento" maxlength="20"value="${personaN.numero_documento}" required>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer">
                                <a href="srvPersona?accion=listarPersonas" class="btn btn-danger"><i class="fa fa-close red"></i>Cancelar</a>                                
                                <button type="submit" id="" name="btnRegistrar" value="Actualizar" class="btn btn-success" onclick="return validarFormulario();"><i class="fa fa-floppy-o" ></i> Actualizar</button>
                            </div>
                        </form>
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
                                        $('#tablaUsuarios').DataTable();
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
