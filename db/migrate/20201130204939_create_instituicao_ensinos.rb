class CreateInstituicaoEnsinos < ActiveRecord::Migration[5.2]
  def change
    create_table :instituicao_ensinos do |t|
      t.string :nome
      t.string :cnpj
      t.string :tipo

      t.timestamps
    end
  end
end
