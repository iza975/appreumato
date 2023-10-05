// Função para adicionar um campo de entrada de texto para mais horários
function addFrequencyInput() {
    const frequencyInputs = document.getElementById("frequency-inputs");
    const newInput = document.createElement("input");
    newInput.type = "time";
    newInput.name = "medication-frequency";
    newInput.className = "frequency-input";
    frequencyInputs.appendChild(newInput);
}

// Adicionar evento de clique ao botão "Adicionar Horário"
document.getElementById("add-frequency").addEventListener("click", addFrequencyInput);



// Função para adicionar um medicamento à lista
function addMedication() {
    // Obter os valores dos campos de cadastro
    const medicationName = document.getElementById("medication-name").value;
    const medicationDose = document.getElementById("medication-dose").value;
    const medicationFrequency = document.getElementById("medication-frequency").value;

    // Criar um elemento de lista (li) para exibir o medicamento
    const listItem = document.createElement("li");
    listItem.innerHTML = `<strong>${medicationName}</strong> - Dose: ${medicationDose}, Frequência: ${medicationFrequency}`;

    // Adicionar botões de ação (editar e excluir)
    const editButton = document.createElement("button");
    editButton.textContent = "Editar";
    editButton.addEventListener("click", editMedication);

    const deleteButton = document.createElement("button");
    deleteButton.textContent = "Excluir";
    deleteButton.addEventListener("click", deleteMedication);

    listItem.appendChild(editButton);
    listItem.appendChild(deleteButton);

    // Adicionar o item à lista
    document.getElementById("medications-list").appendChild(listItem);

    // Limpar os campos de cadastro
    document.getElementById("medication-name").value = "";
    document.getElementById("medication-dose").value = "";
    document.getElementById("medication-frequency").value = "";
}

// Função para editar um medicamento
function editMedication(event) {
    const listItem = event.target.parentElement;
    const medicationInfo = listItem.textContent.split(" - ");
    const medicationName = medicationInfo[0].trim();
    const medicationDose = medicationInfo[1].split(":")[1].trim();
    const medicationFrequency = medicationInfo[2].split(":")[1].trim();

    // Preencher os campos de cadastro com os dados do medicamento
    document.getElementById("medication-name").value = medicationName;
    document.getElementById("medication-dose").value = medicationDose;
    document.getElementById("medication-frequency").value = medicationFrequency;

    // Remover o medicamento da lista
    listItem.remove();
}

// Função para excluir um medicamento
function deleteMedication(event) {
    const listItem = event.target.parentElement;
    listItem.remove();
}

// Associar a função addMedication ao evento de envio do formulário
document.getElementById("medications-form").addEventListener("submit", function (e) {
    e.preventDefault(); // Impedir o envio padrão do formulário
    addMedication(); // Chamar a função de adicionar medicamento
});
