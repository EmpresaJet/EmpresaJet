
/*Script do gráfico de pizza que indica o estado atual das gôndolas do mercado (em tempo real)*/
const data_donut_fluxo_categorias = {
    labels: [
          'Frios e congelados',
          'Cereais e grãos',
          'Hortifruti',
          'Higiene',
          'Bebidas e doces'
      ],
    datasets: [{
      label: 'Giro dos produtos por categoria',
      data: [88, 68, 98, 20, 45],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)',
        'blue',
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

const labels_linha_fluxo_produtos = [
    '00:00',
    '02:00',
    '04:00',
    '06:00',
    '08:00',
    '10:00',
    '12:00',
    '14:00',
    '16:00',
    '18:00',
    '20:00',
    '22:00'
];

const data_linha_fluxo_produtos = {
    labels: labels_linha_fluxo_produtos,
    datasets: [{
        label: 'Quantidade de vezes houve falta de produtos nas gôndolas',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: [125, 108, 64, 73, 81, 80, 95, 84, 66, 88, 114,136],
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
        data: [125, 108, 64, 73, 81, 80, 95, 84, 66, 88, 114,136],
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
        data: [125, 108, 64, 73, 81, 80, 95, 84, 66, 88, 114,136],
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

