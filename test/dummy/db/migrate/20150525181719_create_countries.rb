class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name_en
      t.string :name_fi
      t.string :name_sv

      t.timestamps null: false
    end
  end
end
