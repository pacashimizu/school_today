class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login_id
      t.string :password_digest
      t.string :comment
      t.boolean :teacher, default: false
      t.references :grade, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
