
/*Script do gráfico de pizza que indica o estado atual das gôndolas do mercado (em tempo real)*/

const data_pizza_estado_mercado = {
    labels: [
        'Gôndolas estocadas',
        'Gôndolas com produtos em falta'
    ],
    datasets: [{
        label: 'Estoque das gôndolas',
        data: [54, 46],
        backgroundColor: [
            'rgb(40, 104, 253)',
            'rgb(235, 214, 26)',
        ],
        hoverOffset: 4
    }]
};

const config_estado_mercado_pie = {
    type: 'pie',
    data: data_pizza_estado_mercado,
};

const grafico_estado_mercado = new Chart(
    document.getElementById('pizza_estado_mercado'),
    config_estado_mercado_pie
);

/*Script do gráfico de linha que indica o fluxo do giro dos produtos no mercado, por mês*/

const labels_linha_fluxo_setores = [
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

const data_linha_fluxo_setores = {
    labels: labels_linha_fluxo_setores,
    datasets: [{
        label: 'Frios e congelados',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: [125, 108, 64, 73, 81, 80, 95, 84, 66, 88, 114, 136],
    },

{
    label: 'Cereais e grãos',
    backgroundColor: 'rgb(200, 99, 132)',
    borderColor: 'rgb(200, 99, 132)',
    data: [125, 33, 22, 129, 22, 56, 84, 29, 40, 90, 123, 32],
},

{
    label: 'Hortifruti',
    backgroundColor: 'rgb(99, 255, 132)',
    borderColor: 'rgb(99, 255, 132)',
    data: [190, 29, 39, 59, 55, 77, 65, 43, 78, 33, 55, 77],
},

{
    label: 'Higiene',
    backgroundColor: 'rgb(132, 99, 255)',
    borderColor: 'rgb(132, 99, 255)',
    data: [80, 95, 84, 66, 88, 114, 136, 123, 55, 77, 88, 33],
},

{
    label: 'Bebidas e doces',
    backgroundColor: 'rgb(99, 132, 255)',
    borderColor: 'rgb(99, 132, 255)',
    data: [73, 81, 80, 95, 55, 88, 95, 34, 77, 89, 43, 67, 87],
}
]
};

const config_linha_fluxo_setores = {
    type: 'line',
    data: data_linha_fluxo_setores,
    options: {}
};

const grafico_linha_fluxo_setores = new Chart(
    document.getElementById('linha_fluxo_setores'),
    config_linha_fluxo_setores
);
