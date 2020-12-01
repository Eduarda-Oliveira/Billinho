class CreateFaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :faturas do |t|
      t.decimal :valor_fatura_reais
      t.date :data_vencimento
      t.string :status
      t.references :matricula, foreign_key: true

      t.timestamps
    end
  end
end
