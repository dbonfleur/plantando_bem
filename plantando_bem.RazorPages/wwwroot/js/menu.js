document.addEventListener("DOMContentLoaded", function () {
    if (document.readyState === "interactive") {
        var a = [], li = [], td = [], ico = [];
        var elementoAnterior;
        
        for(var i = 1; i <= 5; i++) {
            a[i-1] = document.getElementById("a" + i);
            li[i-1] = document.getElementById("li" + i);
            td[i-1] = document.getElementById("td" + i);
            ico[i-1] = document.getElementById("ico" + i);
        }

        elementoAnterior = localStorage.getItem("anterior");

        if(elementoAnterior) {
            li[elementoAnterior-1].classList.remove("fnd-selecionado");
            if(elementoAnterior % 2 != 0) {
                li[elementoAnterior-1].classList.add("fnd-verd-claro");
            } else {
                li[elementoAnterior-1].classList.add("fnd-verd-claro2");
            }

            td[elementoAnterior-1].classList.remove("texto-branco");

            if(elementoAnterior == 2) {
                ico[elementoAnterior-1].src = "/img/carrot_verde.png";
            } else {
                ico[elementoAnterior-1].classList.remove("branco");
                ico[elementoAnterior-1].classList.add("verde");
            }
        }

        elementoAtual = localStorage.getItem("atual");

        if(elementoAtual == null)
            elementoAtual = 1;

        if(elementoAtual) {
            
            if(elementoAtual % 2 != 0) {
                li[elementoAtual-1].classList.remove("fnd-verd-claro");
            } else {
                li[elementoAtual-1].classList.remove("fnd-verd-claro2");
            }
            li[elementoAtual-1].classList.add("fnd-selecionado");

            td[elementoAtual-1].classList.add("texto-branco");

            if(elementoAtual == 2) {
                ico[elementoAtual-1].src = "/img/carrot_branca.png";
            } else {
                ico[elementoAtual-1].classList.remove("verde");
                ico[elementoAtual-1].classList.add("branco");
            }

        }

        for(var i = 1; i <= 5; i++) {

            (function(index) {

                a[index-1].addEventListener("click", function() {

                    if(elementoAnterior == null) {
                        elementoAnterior = 1;
                        localStorage.setItem("anterior", JSON.stringify(elementoAnterior));
                    } else {
                        localStorage.setItem("anterior", elementoAtual);
                    }

                    localStorage.setItem("atual", JSON.stringify(index));
                });
            })(i);
        }
    }
});