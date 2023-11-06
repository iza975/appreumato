class PainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # Recupere registros de dor do banco de dados (se necessário)
    @pain_records = PainRecord.all

    render 'index' # Renderiza a view 'index.html.erb'
  end
end
