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
            document.getElementById("form").style.display = "none";
            break;
        case "neform":
            console.log("boton nuevo");
            document.getElementById("form").style.display = "flex";
            document.getElementById("search-table").style.display = "none";
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
            document.getElementById("form").style.display = "none";
            break;
        case "noform":
            console.log("boton nuevo");
            document.getElementById("form").style.display = "flex";
            document.getElementById("search-table").style.display = "none";
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

