module Api
  module V1
    class BillsController < ApplicationController
      # Listar todas as bills
      def index
        bills = Bill.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Bills loaded', data: bills }, status: :ok
      end

      # Listar bills passando ID
      def show
        bill = Bill.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Bill loaded', data: bill }, status: :ok
      end

      # cria bill
      def create
        bill = CreateBill.new(bill_params).perform
        if bill.save
          render json: { status: 'SUCCESS', message: 'Saved bill', data: bill }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Bill not saved', data: bill.errors },
                 status: :unprocessable_entity
        end
      end

      # Exclui bill
      def destroy
        bill = Bill.find(params[:id])
        bill.destroy
        render json: { status: 'SUCCESS', message: 'Deleted bill', data: bill }, status: :ok
      end

      # Atualiza bill
      def update
        bill = Bill.find(params[:id])
        if bill.update(bill_params)
          render json: { status: 'SUCCESS', message: 'Updated bill', data: bill }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Bill not update', data: bill.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def bill_params
        params.permit(:amount_cents, :amount_currency, :due_date, :status, :enrollment_id)
      end
    end
  end
end
