var TamañoAncho=window.screen.width;
var TamañoLargo=window.screen.height;
function Mostrarformulario(){
    document.getElementById('formulario').style.display='block';
    return false;
}
function VerificarCuenta(){
    if (localStorage.getItem(''))
}
function formulario(){
    var Nombres=document.getElementById("nombres").value;
    var Apellidos=document.getElementById("apellidos").value;
    var Usuario=document.getElementById("usuario").value;
    var Correo=document.getElementById("correo").value;
    var Clave=document.getElementById("clave").value;
    var confirmar_Clave=document.getElementById("confirmar_Clave").value;
        if (Nombres.lenght==0){
            Swal.fire({
            title: " UPS!",
            text: "Porfavor Ingrese Sus Nombres",
            icon: "error"
        });
        return;
}
if (Apellidos.lenght==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Sus Apellidos",
        icon: "error"
        });
    return false;
}
if (Correo.lenght==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Correo",
        icon: "error"
        });
    return false;
}
if (Usuario.lenght==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Usuario",
        icon: "error"
        });
    return false;
} 
if (Clave.lenght==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Clave",
        icon: "error"
        });
    return false;
}
if (confirmar_Clave.lenght==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Confirma Tu Clave",
        icon: "error"
        });
    return false;
}
else
if (Correo.lenght==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Correo",
        icon: "error"
        });
}
if (Clave.lenght<7||Clave.lenght>10){
    Swal.fire({
        title:"OYE!",
        text:Clave.lenght<7?"La Clave DEbe Tener Al Menos 7 Caracteres":"La Clave Debe tener Maximo 10 Caracteres",
        icon:"error"
    });
    return false
}
if (Clave==!confirmar_Clave){
    Swal.fire({
    title: "OYE!",
    text: "Las Claves Deben Ser Iguales",
    icon: "error"
    });
    return false
}
var Clave=/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).+$/;
            if (!ClaveLETmix.test(Clave)){
                Swal.fire({
                    title: "OYE!",
                    text: "Tu Contraseña Debe Tener Una Metuscula Minuscula Y Numeros",
                    icon: "error"
                    });
                
                }
        }
close.window();
document.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('button');
    buttons.forEach(button => {
        button.addEventListener('click', () => {
            alert('Producto añadido al carrito!');
        });
    });
});
