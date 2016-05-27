class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :music
      t.string :tv
      t.string :activities
      t.belongs_to :person

      t.timestamps null: false
    end
  end
end
