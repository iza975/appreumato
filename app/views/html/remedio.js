// Obtém as informações da medicação da página anterior (você precisará passar essas informações)
const medicationName = "Nome do Medicamento"; // Substitua com o nome real da medicação
const medicationDose = "X mg"; // Substitua com a dose real da medicação
const medicationFrequency = "08:00, 12:00, 18:00"; // Substitua com os horários reais de toma

// Preenche as informações da medicação na página
document.getElementById("medication-name").textContent = medicationName;
document.getElementById("medication-dose").textContent = medicationDose;
document.getElementById("medication-frequency").textContent = medicationFrequency;
