class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.integer :telefone_celular
      t.string :genero
      t.string :meio_pagamento_fatura

      t.timestamps
    end
  end
end
