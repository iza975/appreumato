def index
    @medications = Medication.all
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
  
    if @medication.save
      redirect_to root_path, notice: 'Medicamento cadastrado com sucesso.'
    else
      render :new
    end
  end
 
  private
  
  def medicamento_params
    params.require(:medicamento).permit(:name, :dose, :frequency)
  end
  
  def remedio
    @medication = Medication.new(
      user_id: current_user.id,
      medication_name: params[:'medication-name'],
      medication_dose: params[:'medication-dose'],
      medication_frequency: params[:'medication-frequency']
    )
  
    if @medication.save
      # Redirecionar ou mostrar uma mensagem de sucesso
    else
      # Lidar com erros de validação, se houver
    end
  end
  Certifique-se de que o nome da variável @medication esteja consistente em toda a classe MedicationController. Se ainda estiver enfrentando problemas para salvar medicamentos, verifique se não há erros de validação e certifique-se de lidar com eles adequadamente no bloco else do método remedio. Isso deve ajudá-lo a salvar medicamentos com sucesso no banco de dados.
  
  
  
  
  
  
  