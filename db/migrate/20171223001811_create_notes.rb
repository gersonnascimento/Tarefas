class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :titulo
      t.string :texto

      t.timestamps
    end
  end
end
