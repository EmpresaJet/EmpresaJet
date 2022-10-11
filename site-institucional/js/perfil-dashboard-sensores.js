
const data_polar_setor_falta_produto = {
    labels: [
        'Frios e congelados',
        'Cereais e grãos',
        'Hortifruti',
        'Higiene',
        'Bebidas e doces'
    ],
    datasets: [{
        label: 'My First Dataset',
        data: [11, 16, 7, 3, 14],
        backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(75, 192, 192)',
            'rgb(255, 205, 86)',
            'rgb(201, 203, 207)',
            'rgb(54, 162, 235)'
        ]
    }]
};

const config_polar_setor_falta_produto = {
    type: 'polarArea',
    data: data_polar_setor_falta_produto,
    options: {}
};

const grafico_polar_setor_falta_produto = new Chart(
    document.getElementById('polar_setor_falta_produto'),
    config_polar_setor_falta_produto
);