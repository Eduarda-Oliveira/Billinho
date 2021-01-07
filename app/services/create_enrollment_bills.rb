class CreateEnrollmentBills
  # indica as variaveis utilizadas, ele e para o acesso
  attr_accessor :enrollment, :due_day, :value, :installments, :bill

  # prepara os atributos da classe
  def initialize(params = {})
    @enrollment = Enrollment.find(params[:enrollment_id])
    @due_day = params[:due_day]
    @value = params[:amount_cents]
    @installments = params[:installments]
  end

  def perform
    create_bill
  end

  private

  def status_default
    'Aberta'
  end

  def currency
    'BRL'
  end
  # Verifica se o dia de vencimento e maior que o dia de hoje
  def valid_date
    date = Date.today
    day = date.mday
    due_day > day
  end

  # diz se as faturas comecam no mes atual ou no seguinte
  def start_date
    if valid_date
      Date.new(Date.today.cwyear, Date.today.mon, due_day)
    else
      Date.new(Date.today.cwyear, Date.today.mon, due_day).next_month
    end
  end

  # mantem o dia da cobranca certo
  def valid_day(due_date)
    bill_due_date = begin
      Date.new(due_date.cwyear, due_date.mon, due_day.to_i)
    rescue StandardError
      bill_due_date = if due_date.nil?
                        due_date.end_of_month
                      else
                        Date.new(due_date.cwyear, due_date.mon,
                                 due_day.to_i)
                      end
    end
  end

  def create_bill
    due_date = start_date
    installments.times do
      Bill.create(amount_cents: value, amount_currency: currency, due_date: valid_day(due_date), status: status_default, enrollment: enrollment)
      due_date = due_date.next_month
    end
  end
end
