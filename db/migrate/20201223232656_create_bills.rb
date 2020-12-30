class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.decimal :value
      t.date :due_date
      t.string :status
      t.references :enrollment, foreign_key: true

      t.timestamps
    end
  end
end
