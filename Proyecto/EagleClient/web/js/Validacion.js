/* 
 * New Ligths
 * Services info Web
 * Rubio Haro e Hiram Gomez 
 */

function Validacion() {
    return ValidarUsuario() + ValidarPassword();
}
function ValidarUsuario() {
    return ValidarSetValidateIconBootstrapt(document.getElementById("Usuario"), "iconStatusDeUsuario");
}
function ValidarPassword() {
    return ValidarSetValidateIconBootstrapt(document.getElementById("Pass"), "iconStatusDePassword");
}
function ValidarSetValidateIconBootstrapt(elemento, IdSpanIcon) {
    document.getElementById(IdSpanIcon).style = "display: default;";
    if (ValidarCampo(elemento)) {
        //Etablecer como valido
        if (document.getElementById(IdSpanIcon).classList.contains('glyphicon-remove')) {
            document.getElementById(IdSpanIcon).classList.remove('glyphicon-remove');
        }
        document.getElementById(IdSpanIcon).classList.add('glyphicon-ok');
        return true;
    } else {
        //Etablecer como invalido
        if (document.getElementById(IdSpanIcon).classList.contains('glyphicon-ok')) {
            document.getElementById(IdSpanIcon).classList.remove('glyphicon-ok');
        }
        document.getElementById(IdSpanIcon).classList.add('glyphicon-remove');
        return false;
    }
}
function ValidarCampo(campo) {
    if (campo.value !== "" && campo.value !== null && campo.value.length <= 16) {
        return true;
    } else {
        return false;
    }
}