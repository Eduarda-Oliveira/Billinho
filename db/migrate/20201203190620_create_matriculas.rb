class CreateMatriculas < ActiveRecord::Migration[5.2]
  def change
    create_table :matriculas do |t|
      t.decimal :valor_total_reais
      t.integer :quantidade_faturas
      t.integer :dia_vencimento_faturas
      t.string :nome_curso
      t.references :aluno, foreign_key: true
      t.references :instituicao, foreign_key: true

      t.timestamps
    end
  end
end
