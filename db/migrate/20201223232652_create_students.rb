class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :birth
      t.integer :telephone
      t.string :gender
      t.string :payment_method

      t.timestamps
    end
  end
end
