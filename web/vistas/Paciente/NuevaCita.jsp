<%@page import="java.time.LocalDate"%>
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
                <a href="srvUsuario?accion=inicioPaciente" class="logo">
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
                                    <img src="dist/img/1430453.png" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"><script>document.write(formatUserName('${usuario.nombreUsuario}'));</script></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/1430453.png" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - <script>document.write(formatUserName('${usuario.nombreUsuario}'));</script>
                                            <small>Usted es, <script>document.write(formatUserName('${usuario.cargo.nombreCargo}'));</script></small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="srvUsuario?accion=cerrar" class="btn btn-default btn-flat">Cerrar Session</a>
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
                            <img src="dist/img/1430453.png" class="img-circle" alt="User Image">
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
                        <li class=""><a href="srvUsuario?accion=inicioPaciente"><i class="fa fa-link"></i> <span>Panel Administrativo</span></a></li>
                        <li class="active treeview">
                            <a href="#"><i class="fa fa-heart"></i> <span>Citas</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">

                                <!-- Mostrar enlace "Nueva Cita" solo para Pacientes -->

                                <!-- Mostrar enlace "Nueva Cita" solo para Pacientes -->
                                <li><a href="srvUsuario?accion=nuevaCita"><i class="fa fa-heart"></i>Nueva Cita</a></li>

                                <li><a href="<c:url value="srvUsuario">
                                           <c:param name="accion" value="listarCitas" />

                                           <c:param name="codi" value="${usuario.id_usuario}" />
                                           <c:param name="carg" value="${usuario.cargo.codigo}" />
                                       </c:url>"><i class="fa fa-heart-o"></i>Administrar Cita</a></li>

                            </ul>
                        </li>
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Página Citas

                    </h1>
                    
                    <ol class="breadcrumb">
                        <li><a href="srvUsuario?accion=inicioPaciente"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Nueva Cita</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <i class="fa fa-edit"></i> <h3 class="box-title">Agendar Nueva Cita</h3>  
                        </div>
                        <script>
                            // Función para habilitar o deshabilitar los campos según la selección
                            function habilitarCampos(selectOrigen, campoSiguiente) {
                                
                                if (selectOrigen.value !== "0") {
                                    campoSiguiente.parentNode.parentNode.style.display = 'block';
                                } else {
                                    campoSiguiente.parentNode.parentNode.style.display = 'none';
                                    // Si el campo se vacía, deshabilita los campos siguientes

                                }
                            }


                        </script>
                        <script>
                            // Función para validar que todos los campos obligatorios estén llenos
                            function validarFormulario() {
                                // Obtener referencia a los campos obligatorios
                                var camposObligatorios = document.querySelectorAll('select[required], input[type="date"][required]');
                                
                                // Verificar cada campo obligatorio
                                for (var i = 0; i < camposObligatorios.length; i++) {
                                    
                                    if (camposObligatorios[i].value === "0" || camposObligatorios[i].value === "") {
                                        // Si algún campo obligatorio está vacío, mostrar un mensaje y detener el envío del formulario
                                        alert("Por favor, complete todos los campos obligatorios.");
                                        return false; // Detener el envío del formulario
                                    }
                                }
                                // Si todos los campos obligatorios están llenos, permitir el envío del formulario
                               
                                alert("La cita se agendado satisfactoriamente, favor confirmar datos en 'Administrar Citas'" )
                                return true;
                            }
                        </script>

                        <form class="form-horizontal" action="srvUsuario?accion=registrarCita" method="post">
                            <div class="box-body">
                                <div class="form-group" style="">
                                    <label class="col-sm-2 control-label">Sede</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-map"></i></span> 
                                        <select id="elfamoso" class="form-control" name="sede" onchange="habilitarCampos(this, document.getElementsByName('consultorio')[0])" required>
                                            <option value="0">Seleccione una sede</option>
                                            <c:forEach items="${sedes}" var="sed">
                                                <option value="${sed.codigo}"  

                                                        >${sed.nombreSede}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group"style="display: none">
                                    <label class="col-sm-2 control-label">Consultorio</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-hospital-o"></i></span>
                                        <select  class="form-control" name="consultorio" onchange="habilitarCampos(this, document.getElementsByName('fecha')[0])" required>
                                            <option value="0">Seleccione un consultorio</option>
                                            <c:forEach items="${consultorios}" var="con">
                                                <option value="${con.codigo}"  

                                                        >${con.nombreConsultorio}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group"style="display: none">
                                    <label class="col-sm-2 control-label">Fecha</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="dateInput" class="form-control" type="date" name="fecha" onchange=" habilitarCampos(this, document.getElementsByName('hora')[0])" min="<%= LocalDate.now() %>" >
                                    </div>
                                </div>                               

                                <div class="form-group"style="display: none">
                                    <label class="col-sm-2 control-label">Hora</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span> 
                                        <select id="horaSelect" class="form-control" name="hora" required>
                                            <option value="0">Seleccione una hora</option>
                                            <!-- Las opciones de hora se cargarán dinámicamente aquí -->
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <a href="srvUsuario?accion=listarUsuarios" class="btn btn-danger"><i class="fa fa-close red"></i>Cancelar</a>
                                <button type="submit" id="" name="btnRegistrar" value="Registrar" class="btn btn-success" onclick="return validarFormulario();"><i class="fa fa-floppy-o"></i> Agendar</button>
                            </div>
                            <!-- /.box-footer -->
                        </form>
                        <script>
                            // Obtener referencia a los elementos del formulario
                            var sedeSelect = document.getElementsByName("sede")[0];
                            var consultorioSelect = document.getElementsByName("consultorio")[0];
                            var fechaInput = document.getElementById("dateInput");
                            var horaSelect = document.getElementById("horaSelect");

                            // Función para cargar las horas disponibles
                            function cargarHoras() {
                                // Obtener los valores seleccionados por el usuario
                                var fechaSeleccionada = fechaInput.value;
                                var sedeSeleccionada = sedeSelect.value;
                                var consultorioSeleccionado = consultorioSelect.value;

                                // Realizar una solicitud AJAX al servidor para cargar las horas disponibles
                                var xhr = new XMLHttpRequest();
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === XMLHttpRequest.DONE) {
                                        if (xhr.status === 200) {
                                            horaSelect.innerHTML = xhr.responseText;
                                        } else {
                                            // Manejar el caso de error
                                            console.error('Error al cargar las horas disponibles:', xhr.status);
                                        }
                                    }
                                };
                                xhr.open('GET', 'srvUsuario?accion=cargarHoras&fecha=' + fechaSeleccionada + '&sede=' + sedeSeleccionada + '&consultorio=' + consultorioSeleccionado);
                                xhr.send();
                            }

                            // Agregar eventos onchange a los elementos de selección
                            fechaInput.addEventListener("change", cargarHoras);
                            sedeSelect.addEventListener("change", cargarHoras);
                            consultorioSelect.addEventListener("change", cargarHoras);
                        </script>




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