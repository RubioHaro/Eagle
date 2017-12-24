/* 
 * New Ligths
 * Services info Web
 * Rubio Haro y Emilio Rodriguez
 */


// Get the modal
var modal = document.getElementById('PopWindowIniciar');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
}

/**
 * click en barra de navegacion
 */


/**
 * Para cualquier modal:
 */
function ClickOpensModal(title, id) {
    //alert(id);
    document.getElementById(id).style.display = 'block';
    TitleChange(title);
}

function ClickIniciarSesion(title) {
    document.getElementById('PopWindowIniciar').style.display = 'block';
    TitleChange(title);
}

function ClickContacto(title) {
    document.getElementById('PopWindowContacto').style.display = 'block';
    TitleChange(title);
}

function ClickRegistrarse(title) {
    document.getElementById('PopWindowRegistrarse').style.display = 'block';
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
/**
 * Comment
 */
function Configuracion(title) {
    document.getElementById('PopWindowConfig').style.display = 'block';
    TitleChange(title);
}
function LogOut(title) {
    document.getElementById('PopWindowCerrarSesion').style.display = 'block';
    TitleChange(title);
}
function EncabezadoCatalogo(title) {
    document.getElementById('PopWindowTitleCatalogo').style.display = 'block';
    TitleChange(title);
}

/**
 * Funcion confirmar el borro de los poductos
 */
function ClickBorrarProducto() {
    var x = confirm('Estas seguro que deseas borrar el producto?');
    return x;
}
function ClickError() {
    document.getElementById('PopWindowError').style.display = 'block';
}