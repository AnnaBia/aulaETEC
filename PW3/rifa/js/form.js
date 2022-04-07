// carregar dados criar tabela com 100 nrs.

const qtdeCol = 10
const qtdeLin = 10
const qtdeCel = qtdeCol * qtdeLin

var x = []
for (i = 1; i <= qtdeCel; i++) {
    x[i] = i
}

let tabela = document.querySelector('#tabela-rifa') // variavel tabela = pega o primeiro valor da referência
let btnAtualizar = document.querySelector('#btn-Atualizar')
// percorre a tabela e
for (i = 1; i < x.length; ) {
    let numeroTr = document.createElement('tr') // cria numero
    numeroTr.classList.add('itemsorteio') // adiciona numero na lista

    //criar uma linha com 10 colunas
    for (c = 0; c < qtdeCol; c++) {
        let numeroTd = document.createElement('td') // cria a linha
        numeroTd.textContent = x[i] // cria celula de acordo com o a qttd de numeros
        numeroTr.appendChild(numeroTd) // anexa o numero no vetor

        i++
    }

    tabela.appendChild(numeroTr) // apresenta tabela
}

tabela.addEventListener('click', function (event) {
    event.target.classList.toggle('reservado')
})
btnAtualizar.addEventListener('click', function () {
    recuperarNrs()
})

function recuperarNrs() {
    // const url = 'https://base.firebaseio.com/tabela.json'
    const url = 'https://etec-94c0d-default-rtdb.firebaseio.com/tabela.json'
    const options = {
        method: 'GET',
        mode: 'cors',
        headers: {
            'content-type': 'application/json;charset=utf-8'
        }
    }

    fetch(url, options)
        .then(response => response.json())
        .then(data => {
            // data = dados
            if (data.erro) {
                //input.setCustomValidity('Não foi possível buscar o CEP.')
                return
            }
            //input.setCustomValidity('')
            preencherCamposComNrs(data)
            console.log(data)
            return
        })
}

function preencheCamposComNrs(data) {
    let nrs = document.querySelectorAll('.info-nr')

    for (let i = 0; i < nrs.length; i++) {
        let numero = nrs[i]
        for (let key in data) {
            if (numero.textContent == data[key].numero) {
                let classe = data[key].sit
                numero.classList.add(classe)
            }
        }
    }
}

function salvarNrs() {
    let nrs = document.querySelectorAll('.info-nr')
}

function salvar1Numero() {}

function atualizar1Numero() {}

function deletar1Numero() {}
