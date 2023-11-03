def index
    @medications = Medication.all
  end

  def new
    @medication = Medication.new
  end

def create
  @medication = Medication.new(medication_params)
  if @medication.save
    redirect_to medications_path, notice: 'Medicamento criado com sucesso.'
  else
    render 'new'
  end
end

  
  
  