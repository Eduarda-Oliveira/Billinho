class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      #t.decimal :full_value
      t.integer :installments
      t.integer :due_day
      t.string :course
      t.monetize :amount
      t.references :student, foreign_key: true
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
