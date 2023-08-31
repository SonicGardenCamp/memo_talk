class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.string :name
      t.text :description, null: false

      t.timestamps
    end
  end
end
