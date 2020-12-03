class CreateInstituicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :instituicaos do |t|
      t.string :nome
      t.string :cnpj
      t.string :tipo

      t.timestamps
    end
  end
end
