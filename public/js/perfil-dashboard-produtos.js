
/*Script do gráfico de pizza que indica o estado atual das gôndolas do mercado (em tempo real)*/
const data_donut_fluxo_categorias = {
    labels: [
        'Frios e congelados',
        'Mercearia',
        'Hortifruti',
        'Cuidados pessoais',
        'Bebidas'
    ],
    datasets: [{
        label: 'Giro dos produtos por categoria',
        data: [188, 230, 210, 162, 265],
        backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)',
            'rgb(41, 41, 207)',
            'purple'
        ],
        hoverOffset: 4
    }]
};

const config_donut_fluxo_categorias = {
    type: 'doughnut',
    data: data_donut_fluxo_categorias,
};

const grafico_donut_fluxo_categorias = new Chart(
    document.getElementById('donut_fluxo_categorias'),
    config_donut_fluxo_categorias
);

/*Script do gráfico de linha que indica o fluxo do giro dos produtos no mercado, por hora*/


var labels_horas = [];

var qtd_prateleiras = [];

var idEmpresa = sessionStorage.ID_EMPRESA;

obterDadosGrafico();

function obterDadosGrafico() {
    //aguardar();
    fetch(`/medidas/listarPorEmpresa/${idEmpresa}`).then(function (resposta) {
        if (resposta.ok) {

            resposta.json().then(function (resposta) {
                console.log("Dados recebidos: ", JSON.stringify(resposta));
                for (let i = 0; i < resposta.length; i++) {
                    labels_horas.push(resposta[i].hora);
                    qtd_prateleiras.push(resposta[i].status_falta)
                }
                criarGrafico();
            });

        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });
}

function criarGrafico() {
    
    const data_linha_fluxo_produtos = {
        labels: labels_horas,
        datasets: [{
            label: 'Quantidade de vezes houve falta de produtos nas gôndolas',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: qtd_prateleiras,
        }
        ]
    };
    
    const config_linha_fluxo_produtos = {
        type: 'line',
        data: data_linha_fluxo_produtos,
        options: {}
    };
    
    const grafico_linha_fluxo_produtos = new Chart(
        document.getElementById('linha_fluxo_produtos'),
        config_linha_fluxo_produtos
    );
}

/*Script do gráfico de barras que indica o fluxo do giro dos produtos no mercado, por semana*/

const labels_barra_fluxo_produtos_semana = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sabado',
    'Domingo'
];

const data_barra_fluxo_produtos_semana = {
    labels: labels_barra_fluxo_produtos_semana,
    datasets: [{
        label: 'Quantidade de vezes houve falta de produtos nas gôndolas',
        backgroundColor: 'rgb(54, 162, 235)',
        borderColor: 'rgb(54, 162, 235)',
        data: [18, 23, 2, 4, 6, 13, 13],
    }
    ]
};

const config_barra_fluxo_produtos_semana = {
    type: 'bar',
    data: data_barra_fluxo_produtos_semana,
    options: {}
};

const grafico_barra_fluxo_produtos_semana = new Chart(
    document.getElementById('barra_fluxo_produtos_semana'),
    config_barra_fluxo_produtos_semana
);

/*Script do gráfico de barras que indica o fluxo do giro dos produtos no mercado, por mês*/

const labels_barra_fluxo_produtos_mes = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
];

const data_barra_fluxo_produtos_mes = {
    labels: labels_barra_fluxo_produtos_mes,
    datasets: [{
        label: 'Quantidade de vezes houve falta de produtos nas gôndolas',
        backgroundColor: 'rgb(54, 162, 235)',
        borderColor: 'rgb(54, 162, 235)',
        data: [57, 78, 140, 84, 66, 103, 138, 70, 57, 91, 105, 211],
    }
    ]
};

const config_barra_fluxo_produtos_mes = {
    type: 'bar',
    data: data_barra_fluxo_produtos_mes,
    options: {}
};

const grafico_barra_fluxo_produtos_mes = new Chart(
    document.getElementById('barra_fluxo_produtos_mes'),
    config_barra_fluxo_produtos_mes
);


// Esta função *plotarGrafico* usa os dados capturados na função anterior para criar o gráfico
// Configura o gráfico (cores, tipo, etc), materializa-o na página e, 
// A função *plotarGrafico* também invoca a função *atualizarGrafico*
function plotarGrafico(resposta, idEmpresa) {
    console.log('iniciando plotagem do gráfico...');

    // Criando estrutura para plotar gráfico - labels
    let labels = [];

    // Criando estrutura para plotar gráfico - dados
    let dados = {
        labels: labels,
        datasets: [{
            label: 'Umidade',
            data: [],
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
        },
        {
            label: 'Temperatura',
            data: [],
            fill: false,
            borderColor: 'rgb(199, 52, 52)',
            tension: 0.1
        }]
    };

    console.log('----------------------------------------------')
    console.log('Estes dados foram recebidos pela funcao "obterDadosGrafico" e passados para "plotarGrafico":')
    console.log(resposta)

    // Inserindo valores recebidos em estrutura para plotar o gráfico
    for (i = 0; i < resposta.length; i++) {
        var registro = resposta[i];
        labels.push(registro.momento_grafico);
        dados.datasets[0].data.push(registro.umidade);
        dados.datasets[1].data.push(registro.temperatura);
    }

    console.log('----------------------------------------------')
    console.log('O gráfico será plotado com os respectivos valores:')
    console.log('Labels:')
    console.log(labels)
    console.log('Dados:')
    console.log(dados.datasets)
    console.log('----------------------------------------------')

    // Criando estrutura para plotar gráfico - config
    const config = {
        type: 'line',
        data: dados,
    };

    // Adicionando gráfico criado em div na tela
    let myChart = new Chart(
        document.getElementById('myChart'),
        config
    );

    setTimeout(() => atualizarGrafico(idAquario, dados, myChart), 2000);
}


// Esta função *atualizarGrafico* atualiza o gráfico que foi renderizado na página,
// buscando a última medida inserida em tabela contendo as capturas, 

//     Se quiser alterar a busca, ajuste as regras de negócio em src/controllers
//     Para ajustar o "select", ajuste o comando sql em src/models
function atualizarGrafico(idAquario, dados, myChart) {

    fetch(`/medidas/tempo-real/${idAquario}`, { cache: 'no-store' }).then(function (response) {
        if (response.ok) {
            response.json().then(function (novoRegistro) {

                console.log(`Dados recebidos: ${JSON.stringify(novoRegistro)}`);
                console.log(`Dados atuais do gráfico:`);
                console.log(dados);

                document.getElementById("avisoCaptura").innerHTML = ""

                if (novoRegistro[0].momento_grafico == dados.labels[dados.labels.length - 1]) {
                    console.log("---------------------------------------------------------------")
                    console.log("Como não há dados novos para captura, o gráfico não atualizará.")
                    document.getElementById("avisoCaptura").innerHTML = "<i class='fa-solid fa-triangle-exclamation'></i> Foi trazido o dado mais atual capturado pelo sensor. <br> Como não há dados novos a exibir, o gráfico não atualizará."
                    console.log("Horário do novo dado capturado:")
                    console.log(novoRegistro[0].momento_grafico)
                    console.log("Horário do último dado capturado:")
                    console.log(dados.labels[dados.labels.length - 1])
                    console.log("---------------------------------------------------------------")
                } else {
                    // tirando e colocando valores no gráfico
                    dados.labels.shift(); // apagar o primeiro
                    dados.labels.push(novoRegistro[0].momento_grafico); // incluir um novo momento

                    dados.datasets[0].data.shift();  // apagar o primeiro de umidade
                    dados.datasets[0].data.push(novoRegistro[0].umidade); // incluir uma nova medida de umidade

                    dados.datasets[1].data.shift();  // apagar o primeiro de temperatura
                    dados.datasets[1].data.push(novoRegistro[0].temperatura); // incluir uma nova medida de temperatura

                    myChart.update();
                }

                // Altere aqui o valor em ms se quiser que o gráfico atualize mais rápido ou mais devagar
                proximaAtualizacao = setTimeout(() => atualizarGrafico(idAquario, dados, myChart), 2000);
            });
        } else {
            console.error('Nenhum dado encontrado ou erro na API');
            // Altere aqui o valor em ms se quiser que o gráfico atualize mais rápido ou mais devagar
            proximaAtualizacao = setTimeout(() => atualizarGrafico(idAquario, dados, myChart), 2000);
        }
    })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados p/ gráfico: ${error.message}`);
        });

}