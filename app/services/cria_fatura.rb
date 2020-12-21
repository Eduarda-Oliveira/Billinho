class CriaFatura
  #indica as variaveis utilizadas, ele é para o acesso
  attr_accessor :matricula, :valor, :quantidade, :total, :vencimento

  #prepara os atributos da classe
  def initialize(params={})
    @matricula = Matricula.find(params[:matricula_id])
    @valor = params[:valor_fatura_reais]
    @quantidade = params[:quantidade_faturas]
    @total = params[:valor_total_reais]
    @vencimento = params[:data_vencimento]
  end
  
  def perform
    verifica
    createFatura
  end

  private
  def statusDefault
    'Aberta'
  end

  def verifica
   raise 'O valor não corresponde a matricula' if ((valor * matricula.quantidade_faturas) != matricula.valor_total_reais) 
  end

  def createFatura
    Fatura.create(valor_fatura_reais: valor, data_vencimento: vencimento, status: statusDefault, matricula: matricula)
  end
end
 