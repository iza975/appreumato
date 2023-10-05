// Dados de exemplo (simulando relatórios de sintomas)
const symptomsData = [
    {
        paciente: "Paciente 1",
        data: "2023-01-15",
        tipo: "Dor",
        descricao: "Dor nas costas"
    },
    {
        paciente: "Paciente 2",
        data: "2023-01-16",
        tipo: "Febre",
        descricao: "Febre alta"
    },
    {
        paciente: "Paciente 3",
        data: "2023-01-17",
        tipo: "Cansaço",
        descricao: "Cansaço extremo"
    },
    // Adicione mais dados conforme necessário
];

// Função para preencher a tabela com os dados
function populateTable() {
    const tableBody = document.querySelector("#symptoms-table tbody");

    for (const symptom of symptomsData) {
        const row = tableBody.insertRow();
        const pacienteCell = row.insertCell(0);
        const dataCell = row.insertCell(1);
        const tipoCell = row.insertCell(2);
        const descricaoCell = row.insertCell(3);

        pacienteCell.textContent = symptom.paciente;
        dataCell.textContent = symptom.data;
        tipoCell.textContent = symptom.tipo;
        descricaoCell.textContent = symptom.descricao;
    }
}

// Chame a função para preencher a tabela ao carregar a página
window.onload = populateTable;
