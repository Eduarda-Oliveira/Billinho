class CreateEnrollmentBills
    #indica as variaveis utilizadas, ele é para o acesso
    attr_accessor :enrollment, :due_day, :value, :installments, :bill

    #prepara os atributos da classe
    def initialize(params={})
        @enrollment = Enrollment.find(params[:enrollment_id])
        @due_day = params[:due_day]
        @value = params[:value]
        @installments = params[:installments]
    end

    def perform
        createBill
    end
    
    private

    def statusDefault
        'Aberta'
    end

    #Verifica se o dia de vencimento é maior que o dia de hoje
    def validDate
        date = Date.today
        day = date.mday
        return due_day > day
    end 

    #diz se as faturas começam no mes atual ou no seguinte
    def startDate
        if validDate
            Date.new(Date.today.cwyear,Date.today.mon, due_day)
        else
            Date.new(Date.today.cwyear,Date.today.mon, due_day).next_month
        end
    end  

    #mantem o dia da cobrança certo 
    def validDay(dueDate)
       billDueDate = Date.new(dueDate.cwyear,dueDate.mon, due_day.to_i) rescue
       if billDueDate.nil? 
        billDueDate = dueDate.end_of_month
       else
        billDueDate = Date.new(dueDate.cwyear,dueDate.mon, due_day.to_i) 
       end
    end
    

    def createBill
        dueDate = startDate
        installments.times do 
            Bill.create(value: value, due_date: validDay(dueDate), status: statusDefault, enrollment: enrollment)
            dueDate = dueDate.next_month
        end
    end

end