class CreateEscalatings < ActiveRecord::Migration[6.0]
  def change
    create_table :escalatings do |t|
      t.string :username
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
