/* 
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */


// Get the modal
var modal = document.getElementById('PopWindowIniciar');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

/**
 * click en barra de navegacion
 */
function ClickIniciarSesion(title) {    
    document.getElementById('PopWindowIniciar').style.display='block';
    TitleChange(title);
}

function ClickRegistrarse(title) {    
    document.getElementById('PopWindowRegistrarse').style.display='block';
    TitleChange(title);
}
/**
 * Cerrar WindowsModal
 */
function ClickCerrarModal(IdModal) {
    document.getElementById(IdModal).style.display = 'none';
    TitleChange("EAGLE VISION");
}
/**
 * Comment
 */
function TitleChange(title) {
    document.title = title;
}