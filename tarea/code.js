function verificar(){
document.getElementById('buton').addEventListener('click',function(){
    let nombre = document.getElementById('nombres').value;
    let apellidos = document.getElementById('apellidos').value;
    let correo = document.getElementById('correo').value;
    let contraseña = document.getElementById('clave').value;
})

    if (nombre === '' ||apellidos===''||correo===''||contraseña==='')
        Swal.fire({
            title: "ERROR",
            text: "porfavor revisa que todos los espacios esten correctamente",
            icon: "question"
          });
    if (nombre==='')
        Swal.fire({
            title: "ERROR",
            text: "porfavor revisa que el nombre este correctamente escrito",
            icon: "question"
      });
    if (apellidos==='')
        Swal.fire({
            title: "ERROR",
            text: "porfavor revisa que el apellido este correctamente escrito",
            icon: "question"
          });
          
    }