class CreateCastles < ActiveRecord::Migration[7.0]
  def change
    create_table :castles do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :daily_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
