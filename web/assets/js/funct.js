function capaClient(name) {
    switch (name) {
        case "scform":
            console.log("boton buscar");
            document.getElementById("search-table").style.display = "flex";
            break;
        case "ncform":
            console.log("boton nuevo");
            document.getElementById("new-element").style.display = "flex";
            break;
        case "ecform":
            console.log("boton editar");
            break;
        case "dcform":
            console.log("boton eliminar");
            break;
        default:

    }
}
function capaEmployee(name) {
    switch (name) {
        case "seform":
            console.log("boton buscar");
            document.getElementById("search-table").style.display = "flex";
            break;
        case "neform":
            console.log("boton nuevo");
            document.getElementById("new-element").style.display = "flex";
            document.getElementById("new-user").style.display = "flex";
            break;
        case "eeform":
            console.log("boton editar");
            break;
        case "deform":
            console.log("boton eliminar");
            break;
        default:

    }
}
function capaOrder(name) {
    switch (name) {
        case "soform":
            console.log("boton buscar");
            document.getElementById("search-table").style.display = "flex";
            break;
        case "noform":
            console.log("boton nuevo");
            document.getElementById("new-element").style.display = "flex";
            break;
        case "eoform":
            console.log("boton editar");
            break;
        case "doform":
            console.log("boton eliminar");
            break;
        default:

    }
}

