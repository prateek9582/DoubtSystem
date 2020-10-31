class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.string :time
      t.boolean :resolved, default : false
      t.boolean :escalated, default : false
      t.string :username
      t.string :start_time
      t.string :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
