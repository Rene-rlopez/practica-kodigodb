<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

<header id="header">
    <?php 
        // require "./clases/Autenticacion.php";
        // $autenticar = new Autenticacion();
    ?>
    <div class="d-flex flex-column">

        <div class="profile">
        <img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle">
        <!-- hacemos el llamado de la sesion -->
        <h1 class="text-light"><a href="#"><?php //echo $_SESSION['nombre_usuario']; ?></a></h1>
        </div>

        <nav id="navbar" class="nav-menu navbar">
        <ul>
            <li>
                <a href="./home.php" class="nav-link scrollto active" aria-current="page" data-bs-toggler="tab"><i class="bx bx-home"></i> <span>Home</span></a>
            </li>
            <li>
                <a href="./estudiantes_activos.php" class="nav-link scrollto" data-bs-toggler="tab"><i class="bx bxs-user-detail"></i> <span>Gestion Estudiantes</span></a>
            </li>
            <li>
                <a href="./reubicacion_estudiante.php" class="nav-link scrollto" data-bs-toggler="tab"><i class="bx bx-book-content"></i> <span>Reubicación de estudiante</span></a>
            </li>
            <li>
                <a href="./estudiantes_desertados.php" class="nav-link scrollto" data-bs-toggler="tab"><i class="bx bx-user-x"></i> <span>Estudiantes Desertados</span></a>
            </li>
            <li>
                <form action="" method="post">
                    <input type="submit" class="btn btn-danger px-2" name="cerrar_sesion" value="Cerrar Sesion">
                </form>

                <?php //$autenticar->cerrarSesion(); ?>
            </li>
        </ul>
        </nav>
    </div>
</header>