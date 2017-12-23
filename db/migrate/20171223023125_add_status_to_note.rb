class AddStatusToNote < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :status, :string
  end
end
