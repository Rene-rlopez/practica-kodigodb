<?php

require "./clases/Conexion.php";

class Autenticacion extends Conexion{
    protected $correo;
    protected $password;

    #metodo que valida el inicio de usuario de los coach
    public function autenticarUsuario(){
        if(isset($_POST['email'], $_POST['password'])){
            $this->correo = $_POST['email'];
            $this->password = $_POST['password'];

            $pdo = $this->conectar();
            $query = $pdo->prepare("SELECT id, nombre, correo, password FROM coach WHERE correo = ? AND password = ?");
            $query->execute(["$this->correo","$this->password"]);
            $usuario = $query->fetch(PDO::FETCH_ASSOC); //[]
            //print_r($usuario);

            //verificamos si manda un arreglo con los datos del usuario
            if(is_array($usuario)){
                //crear la sesion
                $_SESSION['nombre_usuario'] = $usuario['nombre']; 
                //redireccionando a otra pagina
                header("location: ./home.php");
                
            }else{
                echo "<div class='alert alert-danger' role='alert'>
                    Credenciales Incorrectas
                </div>";
            }
        }
    }

    //metodo para destruir la sesion
    public function cerrarSesion(){
        //validar si la persona le dio click al boton
        if(isset($_POST['cerrar_sesion'])){
            //destruir sesion
            session_destroy();
            header("location: ./index.php");
        }
    }
}

?>