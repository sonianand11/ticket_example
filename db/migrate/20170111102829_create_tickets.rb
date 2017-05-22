class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
