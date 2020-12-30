class CreateBill
  # indica as variaveis utilizadas, ele é para o acesso
  attr_accessor :enrollment, :value, :installments, :full_value, :due_date

  # prepara os atributos da classe
  def initialize(params = {})
    @enrollment = Enrollment.find(params[:enrollment_id])
    @value = params[:value]
    @installments = params[:installments]
    @full_value = params[:full_value]
    @due_date = params[:due_date]
  end

  def perform
    validate
    create_bill
  end

  private

  def status_default
    'Aberta'
  end

  def validate
    raise 'O valor não corresponde a matricula' if (value * enrollment.installments) != enrollment.full_value
  end

  def create_bill
    Bill.create(value: value, due_date: due_date, status: status_default, enrollment: enrollment)
  end
end
