module Api
  module V1
    class StudentsController < ApplicationController
      # Listar todos os students
      def index
        students = Student.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Students loaded', data: students }, status: :ok
      end

      # Listar students passando ID
      def show
        student = Student.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Aluno loaded', data: student }, status: :ok
      end

      # Criar um novo student
      def create
        student = Student.new(student_params)
        if student.save
          render json: { status: 'SUCCESS', message: 'Saved student', data: student }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Aluno not saved', data: student.errors },
                 status: :unprocessable_entity
        end
      end

      # Exclui student
      def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: { status: 'SUCCESS', message: 'Deleted student', data: student }, status: :ok
      end

      # Atualiza student
      def update
        student = Student.find(params[:id])
        if student.update_attributes(student_params)
          render json: { status: 'SUCCESS', message: 'Updated student', data: student }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Aluno not update', data: student.errors },
                 status: :unprocessable_entity
        end
      end
      # parametros aceitos

      private

      def student_params
        params.permit(:name, :cpf, :birth, :telephone, :gender, :payment_method)
      end
    end
  end
end
