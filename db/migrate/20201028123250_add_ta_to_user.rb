class AddTaToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ta, :boolean,default:false
  end
end
