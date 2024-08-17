var TamañoAncho=window.screen.width;
var TamañoLargo=window.screen.height;
function Mostrarformulario(){
    window.open('Formulario.html')
    return false;
}
function VerificarFormulario(){
    var Nombres=document.getElementById("nombres").value;
    var Usuario=document.getElementById("usuario").value;
    var Correo=document.getElementById("correo").value;
    var Clave=document.getElementById("clave").value;
    var confirmar_Clave=document.getElementById("confirmar_Clave").value;
        if (Nombres.length==0){
            Swal.fire({
            title: " UPS!",
            text: "Porfavor Ingrese Sus Nombres",
            icon: "error"
        });
        return;
}
if (Nombres.length==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Sus Apellidos",
        icon: "error"
        });
    return false;
}
if (Correo.length==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Correo",
        icon: "error"
        });
    return false;
}
if (Usuario.length==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Usuario",
        icon: "error"
        });
    return false;
} 
if (Clave.length==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Clave",
        icon: "error"
        });
    return false;
}
if (confirmar_Clave.length==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Confirma Tu Clave",
        icon: "error"
        });
    return false;
}
else
if (Correo.length==0){
    Swal.fire({
        title: " UPS!",
        text: "Porfavor Ingrese Su Correo",
        icon: "error"
        });
}
if (Clave.length<7||Clave.length>10){
    Swal.fire({
        title:"OYE!",
        text:Clave.length<7?"La Clave DEbe Tener Al Menos 7 Caracteres":"La Clave Debe tener Maximo 10 Caracteres",
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
