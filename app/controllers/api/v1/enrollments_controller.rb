module Api
  module V1
    class Api::V1::EnrollmentsController < ApplicationController
      # include criaFatura
      # Listar todas as enrollments
      def index
        enrollments = Enrollment.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Enrollments loaded', data: enrollments }, status: :ok
      end

      # Listar enrollments passando ID
      def show
        enrollment = Enrollment.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Enrollment loaded', data: enrollment },
               status: :ok
      end

      # Criar uma nova enrollment (e faturas)
      def create
        enrollment = Enrollment.new(enrollment_params)
        if enrollment.save
          render json: { status: 'SUCCESS', message: 'Saved enrollment', data: enrollment }, status: :ok
          CreateEnrollmentBills.new(enrollment_id: enrollment.id,
                                    due_day: enrollment.due_day,
                                    billValue: billValue(enrollment_params),
                                    installments: enrollment.installments).perform
        else
          render json: { status: 'ERROR', message: 'Enrollment not saved', data: enrollment.errors },
                 status: :unprocessable_entity
        end
      end

      # Exclui enrollment e suas faturas
      def destroy
        enrollment = Enrollment.find(params[:id])
        enrollment.bill.each(&:destroy)
        enrollment.destroy
        render json: { status: 'SUCCESS', message: 'Deleted enrollment', data: enrollment }, status: :ok
      end

      # Atualiza enrollment
      def update
        enrollment = Enrollment.find(params[:id])
        if enrollment.update(enrollment_params)
          render json: { status: 'SUCCESS', message: 'Updated enrollment', data: enrollment }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Enrollment not update', data: enrollment.errors },
                 status: :unprocessable_entity
        end
      end

      private

      # parametros aceitos enrollment
      def enrollment_params
        params.permit(:full_value, :installments, :due_day, :course, :student_id, :institution_id)
      end

      # valor da fatura com duas casas apos a virgula
      def billValue(enrollment_params)
        (enrollment_params[:full_value].to_f / enrollment_params[:installments]).round(2)
      end
    end
  end
end
